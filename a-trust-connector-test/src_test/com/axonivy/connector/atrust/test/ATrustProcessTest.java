package com.axonivy.connector.atrust.test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.TestTemplate;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.extension.ExtensionContext;

import com.axonivy.connector.atrust.TemplateManagementData;
import com.axonivy.connector.atrust.bo.SignatureDocumentData;
import com.axonivy.connector.atrust.bo.SignatureJob;
import com.axonivy.connector.atrust.enums.ATrustBpmErrorCode;
import com.axonivy.connector.atrust.enums.ATrustCustomField;
import com.axonivy.connector.atrust.test.constants.ATrustTestConstants;
import com.axonivy.connector.atrust.test.context.MultiEnvironmentContextProvider;
import com.axonivy.connector.atrust.test.utils.ATrustTestUtils;

import at.a.trust.rest.api.client.TemplateMeta;
import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.RestClients;
import ch.ivyteam.ivy.scripting.objects.CompositeObject;
import ch.ivyteam.ivy.scripting.objects.File;
import ch.ivyteam.ivy.workflow.ITask;

/**
 * Service functionality is mocked out here: {@link ATrustSignMock}
 */
@IvyProcessTest(enableWebServer = true)
@TestMethodOrder(OrderAnnotation.class)
@ExtendWith(MultiEnvironmentContextProvider.class)
public class ATrustProcessTest {

	private static final String ATRUST_REST_CLIENT = "A-Trust (A-Trust Connector API)";
	private static final BpmProcess INTEGRATION_PROCESS = BpmProcess.path("ATrustIntegration/ATrustDemo");
	private static final BpmProcess ATRUST_SIGNER_PROCESS = BpmProcess.path("ATrust/StartSignature");
	private static final BpmProcess ATRUST_TEST_PROCESS = BpmProcess.path("Start Processes/TestATrust");
	private static final String START_SIGN_JOB = "call(SignatureJob)";
	private static final String SAMPLE_DOC = "ATrustTestDoc.pdf";
	private static final String SAMPLE_TEMPLATE_ID = "101";
	private static final String SAMPLE_TEMPLATE = "Sisi";
	private static final BpmProcess TEMPLATE_MANAGEMENT = BpmProcess.name("TemplateManagement");
	private int templateId;
	private SignatureJob signatureJob;

	@BeforeEach
	public void beforeEach(ExtensionContext context, AppFixture fixture, IApplication app) {
		ATrustTestUtils.setUpConfigForContext(context.getDisplayName(), fixture, app);
		signatureJob = new SignatureJob();
	}

	@AfterEach
	void afterEach(AppFixture fixture, IApplication app) {
		RestClients clients = RestClients.of(app);
		clients.remove(ATRUST_REST_CLIENT);
	}

	@TestTemplate
	@Order(value = Integer.MIN_VALUE)
	public void addNewTemplateProcess(BpmClient bpmClient, ExtensionContext context) {
		BpmElement startable = INTEGRATION_PROCESS.elementName("AddTemplateATrust.ivp");
		ExecutionResult result = bpmClient.start().process(startable).execute();
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();
		var demoData = (com.axonivy.connector.atrust.demo.Data) data;
		File uploadedFile = demoData.getMyIvyFile();
		Integer resultCode = demoData.getTemplateData().getResultCode();
		templateId = demoData.getTemplateData().getSigTemplateId();
		assertTrue(resultCode == HttpStatus.SC_CREATED);
		assertThat(uploadedFile).isNotNull();
		assertTrue(StringUtils.contains(uploadedFile.getPath(), "Template.xml"));
		assertThat(resultCode).isNotNull();
		assertThat(templateId).isInstanceOf(Integer.class);
		assertThat(templateId).isNotEqualTo(0);
		if (context.getDisplayName().equals(ATrustTestConstants.REAL_CALL_CONTEXT_DISPLAY_NAME)) {
			BpmElement deleteStartable = TEMPLATE_MANAGEMENT.elementName("DeleteTemplateATrust(Number)");
			ExecutionResult deleteResult = bpmClient.start().subProcess(deleteStartable)
					.withParam("templateId", templateId).execute();
			var templateData = (TemplateManagementData) deleteResult.data().last();
			Ivy.log().warn(templateData.getResult().getResultCode().equals(200));
		}
	}

	@TestTemplate
	public void getListTemplateProcess(BpmClient bpmClient, ExtensionContext context) {
		CompositeObject data = executeGetListTemplateProcess(bpmClient);
		var demoData = (com.axonivy.connector.atrust.demo.Data) data;
		String listTemplate = demoData.getTemplateData().getListTemplates();
		Integer resultCode = demoData.getTemplateData().getResultCode();
		assertTrue(resultCode == HttpStatus.SC_OK);
		assertThat(listTemplate).isNotNull();
		if (context.getDisplayName().equals(ATrustTestConstants.MOCK_SERVER_CONTEXT_DISPLAY_NAME)) {
			assertTrue(StringUtils.contains(listTemplate, SAMPLE_TEMPLATE));
			assertTrue(StringUtils.contains(listTemplate, SAMPLE_TEMPLATE_ID));
		}
	}

	@TestTemplate
	public void callStartSignatureFailedByInvalidParams(BpmClient bpmClient) throws IOException {
		signatureJob.setDocumentName(SAMPLE_DOC);
		BpmElement startable = ATRUST_SIGNER_PROCESS.elementName(START_SIGN_JOB);
		try {
			bpmClient.start().subProcess(startable).execute(signatureJob);
		} catch (BpmError e) {
			assertThat(e.getErrorCode()).isEqualTo(ATrustBpmErrorCode.INVALID_PARAM.getCode());
		}

		signatureJob.setDocumentName(null);
		try {
			bpmClient.start().subProcess(startable).execute(signatureJob);
		} catch (BpmError e) {
			assertThat(e.getErrorCode()).isEqualTo(ATrustBpmErrorCode.INVALID_PARAM.getCode());
		}

		signatureJob.setPdfDocument(null);
		try {
			bpmClient.start().subProcess(startable).execute(signatureJob);
		} catch (BpmError e) {
			assertThat(e.getErrorCode()).isEqualTo(ATrustBpmErrorCode.INVALID_PARAM.getCode());
		}
	}

	@TestTemplate
	public void callStartSignatureProcessSuccessfully(BpmClient bpmClient) throws NoSuchFieldException {
		CompositeObject templateData = executeGetListTemplateProcess(bpmClient);
		var demoData = (com.axonivy.connector.atrust.demo.Data) templateData;
		TemplateMeta templateMeta = demoData.getSignatureTemplates().getTemplateList().get(0);
		templateId = templateMeta.getId();
		BpmElement startable = ATRUST_TEST_PROCESS.elementName("startSignature.ivp");
		ExecutionResult result = bpmClient.start().process(startable)
				.withParam("templateId", String.valueOf(templateId)).execute();
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();

		SignatureJob signatureJob = (SignatureJob) data.get("signatureJob");
		SignatureDocumentData documentData = (SignatureDocumentData) data.get("signatureDocumentData");
		assertThat(documentData).isNotNull();
		assertThat(documentData.getSignatureTicket()).isNotBlank();
		assertThat(documentData.getResultCode()).isEqualTo(HttpStatus.SC_CREATED);
		assertThat(documentData.getSignatureTicket()).isNotBlank();

		assertThat(signatureJob).isNotNull();
		assertThat(signatureJob.getDocumentName()).isEqualTo(SAMPLE_DOC);
		assertThat(signatureJob.getSignTemplateId()).isEqualTo(templateId);
		ITask requestTask = Ivy.wf().findTask(signatureJob.getTaskId());
		String submitTicket = requestTask.customFields().stringField(ATrustCustomField.SIGN_TICKET_ID.getKey())
				.getOrNull();
		assertThat(submitTicket).isEqualTo(documentData.getSignatureTicket());
		assertThat(requestTask.customFields().stringField(ATrustCustomField.SIGNATURE_JOB_ID.getKey()).getOrNull())
				.isNotNull();
		assertThat(requestTask.customFields().stringField(ATrustCustomField.SIGNATURE_DOCUMENT_DATA_ID.getKey())
				.getOrNull()).isNotNull();
	}

	private CompositeObject executeGetListTemplateProcess(BpmClient bpmClient) {
		BpmElement startable = INTEGRATION_PROCESS.elementName("GetListTemplate.ivp");
		ExecutionResult result = bpmClient.start().process(startable).execute();
		assertThat(result.data()).isNotNull();
		return result.data().last();
	}

}
