package com.axonivy.connector.atrust.enums;

public enum ATrustVariable {

	TEMPLATE_ID("ATrust.TemplateId"), HANDY_SIGN_WIDTH("ATrust.IDAustriaParameter.Width"),
	HANDY_SIGN_HEIGHT("ATrust.IDAustriaParameter.Height"),
	HANDY_SIGN_BACKGROUNDCOLOR("ATrust.IDAustriaParameter.BackgroundColor"),
	HANDY_SIGN_PHONENUMBER("ATrust.IDAustriaParameter.PhoneNumber");

	private String key;

	private ATrustVariable(String key) {
		this.key = key;
	}

	public String getKey() {
		return key;
	}
}
