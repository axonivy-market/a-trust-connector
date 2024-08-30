package com.axonivy.connector.atrust.enums;

public enum RequestParam {
	TASK_ID("requestTaskId"), CALLBACK_HASH("callbackSafetyHash");

	private String key;

	private RequestParam(String key) {
		this.key = key;
	}

	public String getKey() {
		return key;
	}
}
