package com.axonivy.connector.atrust.config;

import java.io.IOException;

import jakarta.ws.rs.Priorities;
import jakarta.ws.rs.client.ClientRequestContext;
import jakarta.ws.rs.client.ClientRequestFilter;
import jakarta.ws.rs.core.Feature;
import jakarta.ws.rs.core.FeatureContext;

import com.axonivy.connector.atrust.constant.Constants;
import com.fasterxml.jackson.jakarta.rs.json.JacksonJsonProvider;

import ch.ivyteam.ivy.rest.client.FeatureConfig;

public class HeaderFeature implements Feature {
	public static final String REQUIRED_HEADER_KEY = "X-API-KEY";
	public static final String REQUESTED_BY = "X-Requested-By";;
	public static final String API_KEY = "AUTH.apiKey";

	@Override
	public boolean configure(FeatureContext context) {
		var config = new FeatureConfig(context.getConfiguration(), HeaderFeature.class);
		String apiKey = config.readMandatory(API_KEY);
		context.register(new ATrustRequestFilter(apiKey), Priorities.HEADER_DECORATOR);
		context.register(JacksonJsonProvider.class);
		return true;
	}

	private static class ATrustRequestFilter implements ClientRequestFilter {
		private final String apiKey;

		private ATrustRequestFilter(String apiKey) {
			this.apiKey = apiKey;
		}

		@Override
		public void filter(ClientRequestContext context) throws IOException {
			context.getHeaders().add(REQUIRED_HEADER_KEY, apiKey);
			context.getHeaders().add(REQUESTED_BY, Constants.IVY);
		}
	}
}
