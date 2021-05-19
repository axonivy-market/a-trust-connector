package com.axonivy.connector.atrust.test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.Test;

import com.axonivy.connector.atrust.StartSignatureData;
import com.axonivy.connector.atrust.bo.SignatureDocumentData;
import com.axonivy.connector.atrust.bo.SignatureJob;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.scripting.objects.CompositeObject;

@IvyProcessTest
public class ATrustProcessTest {

	private static final BpmProcess integrationProcess = BpmProcess.path("ATrustIntegration/ATrustDemo");
	private static final BpmProcess aTrustSignerProcess = BpmProcess.path("ATrust/StartSignature");
	private static final BpmProcess aTrustTestProcess = BpmProcess.path("Start Processes/TestATrust");
	
	private static final Integer SUCCESS_CODE = 0;
	private static final Integer ERROR_PREPARE_PDF = -1008;
	private static final String START_ERROR = "Start Signature Web Service Error";

	@Test
	public void getListTemplateProcess(BpmClient bpmClient) {
		BpmElement startable = integrationProcess.elementName("GetListTemplate.ivp");
		ExecutionResult result = bpmClient.start().process(startable).execute();
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();
		com.axonivy.connector.atrust.demo.Data demoData = (com.axonivy.connector.atrust.demo.Data) data;
		String listTemplate = demoData.getTemplateData().getListTemplates();
		Integer resultCode = demoData.getTemplateData().getResultCode();
		assertThat(listTemplate).isNotNull();
		assertTrue(StringUtils.contains(listTemplate, "SignaturQualifiziert_AIS_Vertrag_oben"));
		assertThat(resultCode).isNotNull();
		assertTrue(resultCode == 0);
	}

	@Test
	public void callStartSignatureProcessFailed(BpmClient bpmClient) {
		BpmElement startable = aTrustSignerProcess.elementName("call(SignatureJob)");
		ExecutionResult result = bpmClient.start().subProcess(startable).execute(new SignatureJob());
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();
		
		StartSignatureData signatureData = (StartSignatureData) data;
		assertThat(signatureData.getSignatureTicket()).isNotBlank();
		
		SignatureDocumentData documentData = signatureData.getSignatureDocumentData();
		assertThat(documentData).isNotNull();
		assertTrue(ERROR_PREPARE_PDF.compareTo(documentData.getResultCode()) == 0);
		assertTrue(StringUtils.startsWithIgnoreCase(documentData.getLastSignatureError(), START_ERROR));
	}

	@Test
	public void callStartSignatureProcessSuccessfully(BpmClient bpmClient) throws NoSuchFieldException {
		BpmElement startable = aTrustTestProcess.elementName("startSignature.ivp");
		ExecutionResult result = bpmClient.start().process(startable).execute();
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();

		SignatureDocumentData documentData = (SignatureDocumentData) data.get("signatureDocumentData");
		assertThat(documentData).isNotNull();
		assertThat(documentData.getSignatureTicket()).isNotBlank();
		assertTrue(SUCCESS_CODE.compareTo(documentData.getResultCode()) == 0);
		assertTrue(StringUtils.isEmpty(documentData.getLastSignatureError()));
	}
}
