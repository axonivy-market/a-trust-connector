package com.axonivy.connector.atrust.convertor;

import static com.axonivy.connector.atrust.constant.Constants.SEMICOLON;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.axonivy.connector.atrust.bo.TemplateData;

import at.a.trust.rest.api.client.SignatureTemplates;

public class SignConvertor {

	private SignConvertor() {
	}

	public static TemplateData convertToTemplateData(SignatureTemplates signatureTemplates, Integer httpStatus) {
		TemplateData templateData = new TemplateData();
		templateData.setResultCode(httpStatus);
		if (signatureTemplates != null && CollectionUtils.isNotEmpty(signatureTemplates.getTemplateList())) {
			signatureTemplates.getTemplateList().forEach(template -> {
				var templateList = StringUtils.defaultString(templateData.getListTemplates()).concat(SEMICOLON)
						.concat(template.toString());
				templateData.setListTemplates(templateList);
			});
		}
		return templateData;
	}

}
