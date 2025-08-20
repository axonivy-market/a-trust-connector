package com.axonivy.connector.atrust.test;

import java.util.List;

import org.glassfish.jersey.media.multipart.MultiPartFeature;

import com.axonivy.connector.atrust.config.HeaderFeature;
import com.axonivy.connector.atrust.config.OpenApiJsonFeature;
import com.axonivy.connector.atrust.test.constants.ATrustTestConstants;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.rest.client.RestClient;
import ch.ivyteam.ivy.rest.client.RestClientFeature;
import ch.ivyteam.ivy.rest.client.RestClients;

public class BaseSetup {
	private static final String ATRUST_REST_CLIENT = "A-Trust (A-Trust Connector API)";

	protected static Runnable runRealEnv(AppFixture fixture) {
		return () -> {
			String apiKey = System.getProperty(ATrustTestConstants.API_KEY);
			String ServerUrl = System.getProperty(ATrustTestConstants.SERVER_URL);
			String SignBox = System.getProperty(ATrustTestConstants.SIGN_BOX);
			fixture.var("ATrust.APIKey", apiKey);
			fixture.var("ATrust.ServerUrl", ServerUrl);
			fixture.var("ATrust.SignBox", SignBox);
		};
	}

	protected static Runnable runMockEnv(AppFixture fixture, IApplication app) {
		return () -> {
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Url", ATrustSignMock.URI);
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Features", "");

			RestClients clients = RestClients.of(app);
			RestClient atrustRestClient = clients.find(ATRUST_REST_CLIENT);
			var mockClient = atrustRestClient.toBuilder()
					.features(List.of(new RestClientFeature(HeaderFeature.class.getName()),
							new RestClientFeature(MultiPartFeature.class.getName()),
							new RestClientFeature(OpenApiJsonFeature.class.getName())))
					.property("AUTH.apiKey", "apiKey").property("PATH.serverUrl", "serverUrl").property("PATH.signBox", "signBox")
					.toRestClient();
			clients.set(mockClient);
		};
	}
}
