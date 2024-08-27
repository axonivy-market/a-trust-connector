package com.axonivy.connector.atrust.convertor;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

import org.apache.commons.lang3.StringUtils;

import com.axonivy.connector.atrust.service.ATrustService;

import at.a.trust.rest.api.client.TemplateMeta;

@FacesConverter(value = "templateMetaConvertor")
public class TemplateMetaConvertor implements Converter {

	@Override
	public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
		return ATrustService.getAvailableTemplates().stream()
				.filter(template -> StringUtils.equals(String.valueOf(template.getId()), value)).findAny().orElse(null);
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
		if (value instanceof TemplateMeta) {
			return String.valueOf(((TemplateMeta) value).getId());
		}
		return null;
	}

}
