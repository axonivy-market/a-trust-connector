package com.axonivy.connector.atrust.validator;

import static com.axonivy.connector.atrust.enums.ATrustCustomField.SIGN_TICKET_ID;
import static com.axonivy.connector.atrust.enums.RequestParam.CALLBACK_HASH;

import org.apache.commons.lang3.StringUtils;

import com.axonivy.connector.atrust.bo.SignatureJob;
import com.axonivy.connector.atrust.enums.ATrustBpmErrorCode;
import com.axonivy.connector.atrust.util.IvyUtils;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.workflow.ITask;

public class ATrustSignValidator {

	private ATrustSignValidator() {
	}

	public static void validateSignHashAndTicket(String signHash, String ticket, Long referenceTaskId) {
		ITask requestTask = IvyUtils.findTask(referenceTaskId);
		if (requestTask == null) {
			throwATrustBpmError(ATrustBpmErrorCode.INVALID_PARAM);
		}
		String persistedSignTicketId = requestTask.customFields().stringField(SIGN_TICKET_ID.getKey()).getOrNull();
		String persistedCallbackHash = requestTask.customFields().stringField(CALLBACK_HASH.getKey()).getOrNull();
		if (StringUtils.isBlank(signHash) || StringUtils.isBlank(ticket)) {
			throwATrustBpmError(ATrustBpmErrorCode.NO_HASH);
		} else if (!StringUtils.equals(persistedCallbackHash, signHash)
				|| !StringUtils.equals(persistedSignTicketId, ticket)) {
			throwATrustBpmError(ATrustBpmErrorCode.HASH_MISMATCH);
		}
	}

	private static void throwATrustBpmError(ATrustBpmErrorCode errorCode) {
		BpmError.create(errorCode.getCode()).withMessage(errorCode.getErrorMessage()).throwError();
	}

	public static void validateSignatureJobData(SignatureJob signatureJob) {
		if (signatureJob == null) {
			throwATrustBpmError(ATrustBpmErrorCode.MISSING_REQUIRED_PARAM);
		}

		if (StringUtils.isBlank(signatureJob.getDocumentName()) || signatureJob.getPdfDocument() == null
				|| signatureJob.getPdfDocument().length == 0) {
			throwATrustBpmError(ATrustBpmErrorCode.INVALID_PARAM);
		}
	}
}
