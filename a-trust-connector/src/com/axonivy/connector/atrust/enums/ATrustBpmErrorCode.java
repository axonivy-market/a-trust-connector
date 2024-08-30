package com.axonivy.connector.atrust.enums;

import com.axonivy.connector.atrust.util.IvyUtils;

public enum ATrustBpmErrorCode {
	GENERAL("com:axonivy:connector:atrust:connector",
			"/Dialogs/com/axonivy/connector/atrust/CannotReadResponseStreamMessage"),
	HASH_MISMATCH("com:axonivy:connector:atrust:callback:hashmismatch",
			"/Dialogs/com/axonivy/connector/atrust/InvalidHashMessage"),
	NO_HASH("com:axonivy:connector:atrust:callback:nohash",
			"/Dialogs/com/axonivy/connector/atrust/CallbackHasNoHashMessage"),
	MISSING_REQUIRED_PARAM("com:axonivy:connector:atrust:param:missingrequiredfield",
			"/Dialogs/com/axonivy/connector/atrust/MissingParamMessage"),
	INVALID_PARAM("com:axonivy:connector:atrust:param:invalid",
			"/Dialogs/com/axonivy/connector/atrust/InvalidParamMessage"),
	TEMPLATE_NOT_FOUND("com:axonivy:connector:atrust:template:notfound",
			"/Dialogs/com/axonivy/connector/atrust/TemplateNotFoundMessage");

	private String code;
	private String errorMessageCMSUrl;

	private ATrustBpmErrorCode(String code, String errorMessageCMSUrl) {
		this.code = code;
		this.errorMessageCMSUrl = errorMessageCMSUrl;
	}

	public String getCode() {
		return code;
	}

	public String getErrorMessage() {
		return IvyUtils.getCMSTranslation(errorMessageCMSUrl);
	}

}
