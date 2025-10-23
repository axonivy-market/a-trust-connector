package com.axonivy.connector.atrust.enums;

public enum ATrustCustomField {
	SIGN_TICKET_ID("signTicketId"), SIGNATURE_JOB_ID("signatureJobId"),
	SIGNATURE_DOCUMENT_DATA_ID("signatureDocumentDataId"), SIGNATURE_STATUS("signatureStatus");

	private String key;

	private ATrustCustomField(String key) {
		this.key = key;
	}

	public String getKey() {
		return key;
	}
}
