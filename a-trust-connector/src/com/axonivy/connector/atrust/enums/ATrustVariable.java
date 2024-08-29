package com.axonivy.connector.atrust.enums;

public enum ATrustVariable {

	TEMPLATE_ID("ATrust.TemplateId"), HANDY_SIGN_WIDTH("ATrust.HandySignaturParameter.Width"),
	HANDY_SIGN_HEIGHT("ATrust.HandySignaturParameter.Height"),
	HANDY_SIGN_BACKGROUNDCOLOR("ATrust.HandySignaturParameter.BackgroundColor"),
	HANDY_SIGN_PHONENUMBER("ATrust.HandySignaturParameter.PhoneNumber");

	private String key;

	private ATrustVariable(String key) {
		this.key = key;
	}

	public String getKey() {
		return key;
	}
}
