package com.axonivy.connector.atrust.bo;

import java.io.Serializable;

/**
 * Contains objects of web service response from A-Trust Handy-Signatur Service
 *
 */
public class TemplateData implements Serializable {

	private static final long serialVersionUID = -7413824839105230756L;

	private Integer sigTemplateId;
	private Integer resultCode;
	private String listTemplates;

	public TemplateData() {
	}

	public Integer getSigTemplateId() {
		return sigTemplateId;
	}

	public void setSigTemplateId(Integer sigTemplateId) {
		this.sigTemplateId = sigTemplateId;
	}

	public Integer getResultCode() {
		return resultCode;
	}

	public void setResultCode(Integer resultCode) {
		this.resultCode = resultCode;
	}

	public String getListTemplates() {
		return listTemplates;
	}

	public void setListTemplates(String listTemplates) {
		this.listTemplates = listTemplates;
	}
}
