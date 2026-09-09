package com.axonivy.connector.atrust.convertor;

import org.apache.commons.lang3.Strings;

import com.axonivy.connector.atrust.service.ATrustService;

import at.a.trust.rest.api.client.TemplateMeta;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import jakarta.faces.convert.ConverterException;
import jakarta.faces.convert.FacesConverter;

@FacesConverter(value = "templateMetaConvertor", managed = true)
@ApplicationScoped
public class TemplateMetaConvertor implements Converter<Object> {

	@Override
	public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
		return ATrustService.getAvailableTemplates().stream()
				.filter(template -> Strings.CS.equals(String.valueOf(template.getId()), value)).findAny().orElse(null);
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
		if (value instanceof TemplateMeta) {
			return String.valueOf(((TemplateMeta) value).getId());
		}
		return null;
	}

}
