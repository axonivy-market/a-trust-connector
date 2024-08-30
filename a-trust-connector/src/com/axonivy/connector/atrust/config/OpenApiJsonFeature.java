package com.axonivy.connector.atrust.config;

import javax.ws.rs.Priorities;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;

import ch.ivyteam.ivy.rest.client.mapper.JsonFeature;

public class OpenApiJsonFeature extends JsonFeature {
	@Override
	public boolean configure(FeatureContext context) {
		JacksonJsonProvider provider = new JaxRsClientJson();
		configure(provider, context.getConfiguration());
		context.register(provider, Priorities.ENTITY_CODER);
		return true;
	}

	public static class JaxRsClientJson extends JacksonJsonProvider {
		@Override
		@SuppressWarnings("deprecation")
		public ObjectMapper locateMapper(Class<?> type, MediaType mediaType) {
			ObjectMapper mapper = super.locateMapper(type, mediaType);
			// match our generated jax-rs client beans: that contain JSR310 data types
			mapper.registerModule(new com.fasterxml.jackson.datatype.jsr310.JavaTimeModule());
			// allow fields starting with an upper case character (e.g. in ODATA specs)!
			mapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
			mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
			// not sending this optional value seems to be lass prone to errors for some
			// remote services.
			mapper.setSerializationInclusion(Include.NON_NULL);
			return mapper;
		}
	}
}
