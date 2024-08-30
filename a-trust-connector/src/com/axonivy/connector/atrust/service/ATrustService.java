package com.axonivy.connector.atrust.service;

import static com.axonivy.connector.atrust.constant.Constants.DEFAULT_PAGE_SIGN;
import static com.axonivy.connector.atrust.constant.Constants.FIRST_URL_PARAM_PATTERN;
import static com.axonivy.connector.atrust.constant.Constants.PDF;
import static com.axonivy.connector.atrust.constant.Constants.URL_PARAM_PATTERN;
import static com.axonivy.connector.atrust.enums.ATrustCustomField.SIGNATURE_DOCUMENT_DATA_ID;
import static com.axonivy.connector.atrust.enums.ATrustCustomField.SIGNATURE_JOB_ID;
import static com.axonivy.connector.atrust.enums.ATrustVariable.HANDY_SIGN_BACKGROUNDCOLOR;
import static com.axonivy.connector.atrust.enums.ATrustVariable.HANDY_SIGN_HEIGHT;
import static com.axonivy.connector.atrust.enums.ATrustVariable.HANDY_SIGN_PHONENUMBER;
import static com.axonivy.connector.atrust.enums.ATrustVariable.HANDY_SIGN_WIDTH;
import static com.axonivy.connector.atrust.enums.RequestParam.CALLBACK_HASH;
import static com.axonivy.connector.atrust.enums.RequestParam.TASK_ID;
import static java.lang.String.valueOf;
import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.http.HttpStatus;

import com.axonivy.connector.atrust.bo.SignatureDocumentData;
import com.axonivy.connector.atrust.bo.SignatureJob;
import com.axonivy.connector.atrust.enums.SignatureStatus;
import com.axonivy.connector.atrust.util.IvyUtils;

import at.a.trust.rest.api.client.SignDocument;
import at.a.trust.rest.api.client.SignatureTemplates;
import at.a.trust.rest.api.client.TemplateMeta;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.process.call.SubProcessCall;
import ch.ivyteam.ivy.process.call.SubProcessCallResult;
import ch.ivyteam.ivy.scripting.objects.File;
import ch.ivyteam.ivy.workflow.ITask;

public class ATrustService {

	private static final String TEMPLATE_ID_VAR = "ATrust/TemplateId";
	private static final String IFRAME_PARAM_PATTERN = "&width=%s&height=%s&backgroundcolor=%s&telephonenumber=%s";
	public static final String SIGNATURE_RETURN_PAGE = "/page/a-trust-connector$1/signatureReturn.jsp";
	public static final String SIGNATURE_CANCEL_PAGE = "/page/a-trust-connector$1/signatureCancel.jsp";
	public static final String TEMPLATE_MANAGEMENT_PROCESS_PATH = "ATrust/TemplateManagement";
	public static final String END_SIGNATURE_PAGE = "ATrust/EndSignature/start.ivp";
	public static final String GET_LIST_TEMPLATE_START = "GetListTemplate";
	public static final String TEMPLATES_PROPERTY = "templates";

	public static SignDocument buildSignDocumentData(SignatureJob signatureJob) throws IOException {
		// Initial data
		var signDocument = new SignDocument();
		if (signatureJob == null) {
			return signDocument;
		}
		// Adapt document name
		String fileName = signatureJob.getDocumentName();
		if (!fileName.endsWith(PDF)) {
			fileName = fileName.concat(PDF);
		}
		signatureJob.setDocumentName(fileName);

		// Convert PDF byte arrays to File
		if (signatureJob.getPdfDocument() != null && signatureJob.getPdfDocument().length > 0) {
			var newFile = new File(signatureJob.getDocumentName(), true);
			FileUtils.copyInputStreamToFile(new ByteArrayInputStream(signatureJob.getPdfDocument()),
					newFile.getJavaFile());
			signDocument.setDocument(newFile.getJavaFile());
		}

		String template = unifyTemplate(signatureJob.getSignTemplateId());
		signDocument.setTemplate(template);
		signDocument.setLocation(signatureJob.getLocation());
		signDocument.setReason(signatureJob.getReason());

		if (isNull(signatureJob.getSignStampPageNumber()) || signatureJob.getSignStampPageNumber() == 0) {
			signDocument.setPage(DEFAULT_PAGE_SIGN);
		} else {
			signDocument.setPage(signatureJob.getSignStampPageNumber().toString());
		}
		if (nonNull(signatureJob.getSignStampCoordinatesX0())) {
			signDocument.setX(valueOf(signatureJob.getSignStampCoordinatesX0()));
		}
		if (nonNull(signatureJob.getSignStampCoordinatesY0())) {
			signDocument.setY(valueOf(signatureJob.getSignStampCoordinatesY0()));
		}
		if (nonNull(signatureJob.getSignStampCoordinatesX1())) {
			signDocument.setW(valueOf(signatureJob.getSignStampCoordinatesX1()));
		}
		if (nonNull(signatureJob.getSignStampCoordinatesY1())) {
			signDocument.setH(valueOf(signatureJob.getSignStampCoordinatesY1()));
		}

		return signDocument;
	}

	private static String unifyTemplate(Long signTemplateId) {
		if (signTemplateId == null || signTemplateId == 0) {
			signTemplateId = ATrustService.getDefaultSignatureTemplate();
			if (signTemplateId == null) {
				return StringUtils.EMPTY;
			}
		}
		for (var template : CollectionUtils.emptyIfNull(getAvailableTemplates())) {
			var foundTemplateId = template.getId();
			if (foundTemplateId.intValue() == signTemplateId.intValue()) {
				return String.valueOf(foundTemplateId);
			}
		}
		IvyUtils.throwBpmErrorAndSetValidationFailed();
		return StringUtils.EMPTY;
	}

	public static String generateCallbackUrl(boolean isEmbeddedInframe) {
		String internalCallbackUrl = StringUtils.EMPTY;
		if (isEmbeddedInframe) {
			internalCallbackUrl = getCallbackInFrameUrl();
		} else {
			var callbackSafetyHash = UUID.randomUUID().toString();
			internalCallbackUrl = getCallbackSafetyHashUrl(callbackSafetyHash);
		}
		return internalCallbackUrl;
	}

	public static List<TemplateMeta> getAvailableTemplates() {
		SubProcessCallResult callResult = SubProcessCall.withPath(TEMPLATE_MANAGEMENT_PROCESS_PATH)
				.withStartName(GET_LIST_TEMPLATE_START).call();
		SignatureTemplates templates = (SignatureTemplates) callResult.get(TEMPLATES_PROPERTY);
		return templates.getTemplateList();
	}

	public static String generateIFrameParameters() {
		var variable = Ivy.var();
		return String.format(IFRAME_PARAM_PATTERN, variable.get(HANDY_SIGN_WIDTH.getKey()),
				variable.get(HANDY_SIGN_HEIGHT.getKey()), variable.get(HANDY_SIGN_BACKGROUNDCOLOR.getKey()),
				variable.get(HANDY_SIGN_PHONENUMBER.getKey()));
	}

	public static String getCallbackInFrameUrl() {
		return getCurrentRequestAbsolutePath() + SIGNATURE_RETURN_PAGE;
	}

	public static String getErrorCallbackInFrameUrl() {
		return getCurrentRequestAbsolutePath() + SIGNATURE_CANCEL_PAGE;
	}

	public static String getCallbackSafetyHashUrl(String uuid) {
		if (StringUtils.isBlank(uuid)) {
			uuid = UUID.randomUUID().toString();
		}
		return Ivy.html().startLink(END_SIGNATURE_PAGE).getAbsolute()
				+ String.format(FIRST_URL_PARAM_PATTERN, CALLBACK_HASH.getKey(), uuid)
				+ String.format(URL_PARAM_PATTERN, TASK_ID.getKey(), Ivy.wfTask().getId());
	}

	public static void doPostSigning(long taskId, int returnCode, SignatureDocumentData signatureDocumentData)
			throws IOException {
		ITask requestTask = Ivy.wf().findTask(taskId);
		// Add the new file to case
		addSignedDocToCaseAndUpdateResult(returnCode, signatureDocumentData, requestTask);
		String inputtedDataId = requestTask.customFields().stringField(SIGNATURE_JOB_ID.getKey()).getOrDefault("");
		SignatureJob signatureJob = IvyUtils.queryRepoById(inputtedDataId, SignatureJob.class);
		if (signatureJob != null && StringUtils.isNoneBlank(signatureJob.getCallbackUrlAfterSignature())) {
			IvyUtils.redirectTo(signatureJob.getCallbackUrlAfterSignature());
		} else {
			IvyUtils.redirectTo(requestTask.getStartLinkEmbedded().getRelative());
		}
	}

	public static void addSignedDocToCaseAndUpdateResult(int returnCode, SignatureDocumentData signatureDocumentData,
			ITask requestTask) {
		if (HttpStatus.SC_OK == returnCode) {
			IvyUtils.addDocToCase(signatureDocumentData.getDocumentName(), signatureDocumentData.getPdfFile(),
					requestTask.getCase().getId(), true);

			// Update Signature Document
			String signatureDocumentDataId = requestTask.customFields().stringField(SIGNATURE_DOCUMENT_DATA_ID.getKey())
					.getOrNull();
			SignatureDocumentData savedSignatureDocumentData = IvyUtils.queryRepoById(signatureDocumentDataId,
					SignatureDocumentData.class);
			savedSignatureDocumentData.setPdfFile(signatureDocumentData.getPdfFile());
			signatureDocumentData.setSignatureStatus(SignatureStatus.SIGNED);
			signatureDocumentData.setResultCode(returnCode);
			signatureDocumentData.setLastSignatureError(null);
			requestTask.customFields().stringField(SIGNATURE_DOCUMENT_DATA_ID.getKey())
					.set(IvyUtils.saveToRepo(signatureDocumentData).getId());
		}
	}

	public static Long getDefaultSignatureTemplate() {
		String templateId = Ivy.var().get(TEMPLATE_ID_VAR);
		if (NumberUtils.isDigits(templateId)) {
			return Long.valueOf(templateId);
		}
		return null;
	}

	private static String getCurrentRequestAbsolutePath() {
		return Ivy.html().applicationHomeLink().getAbsolute();
	}
}
