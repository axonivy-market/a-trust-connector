package com.axonivy.connector.atrust.config;

import com.fasterxml.jackson.annotation.JsonInclude;

import ch.ivyteam.ivy.rest.client.mapper.JsonFeature;
import jakarta.ws.rs.Priorities;
import jakarta.ws.rs.core.FeatureContext;
import jakarta.ws.rs.core.MediaType;
import tools.jackson.databind.MapperFeature;
import tools.jackson.databind.SerializationFeature;
import tools.jackson.databind.json.JsonMapper;
import tools.jackson.jakarta.rs.json.JacksonJsonProvider;

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
		public JsonMapper locateMapper(Class<?> type, MediaType mediaType) {
			disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
			return super.locateMapper(type, mediaType).rebuild()
					// allow fields starting with an upper case character (e.g. in ODATA specs)!
					.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true)
					// not sending this optional value seems to be lass prone to errors for some
					// remote services.
					.changeDefaultPropertyInclusion(_ -> JsonInclude.Value.construct(
							JsonInclude.Include.NON_NULL, JsonInclude.Include.NON_NULL))
					.build();
		}
	}
}
