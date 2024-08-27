package com.axonivy.connector.atrust.enums;

public enum ATrustHeaderLocation {
	TEMPLATES("/templates/"), SIGNATURE_BATCHES("/signaturebatches/"), DOCUMENTS("/documents/");

	private String path;

	private ATrustHeaderLocation(String path) {
		this.path = path;
	}

	public String getPath() {
		return path;
	}
}
