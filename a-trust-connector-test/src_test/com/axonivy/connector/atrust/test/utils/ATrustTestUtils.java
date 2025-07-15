package com.axonivy.connector.atrust.test.utils;

import java.util.List;

import org.glassfish.jersey.media.multipart.MultiPartFeature;

import com.axonivy.connector.atrust.config.HeaderFeature;
import com.axonivy.connector.atrust.config.OpenApiJsonFeature;
import com.axonivy.connector.atrust.test.ATrustSignMock;
import com.axonivy.connector.atrust.test.constants.ATrustTestConstants;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.rest.client.RestClient;
import ch.ivyteam.ivy.rest.client.RestClientFeature;
import ch.ivyteam.ivy.rest.client.RestClients;

public class ATrustTestUtils {
	private static final String ATRUST_REST_CLIENT = "A-Trust (A-Trust Connector API)";

	public static void setUpConfigForContext(String contextName, AppFixture fixture, IApplication app) {
		switch (contextName) {
		case ATrustTestConstants.REAL_CALL_CONTEXT_DISPLAY_NAME:
			setUpConfigForApiTest(fixture);
			break;
		case ATrustTestConstants.MOCK_SERVER_CONTEXT_DISPLAY_NAME:
			setUpConfigForMockServer(fixture, app);
			break;
		default:
			break;
		}
	}

	public static void setUpConfigForApiTest(AppFixture fixture) {
		String apiKey = System.getProperty(ATrustTestConstants.API_KEY);
		String ServerUrl = System.getProperty(ATrustTestConstants.SERVER_URL);
		String SignBox = System.getProperty(ATrustTestConstants.SIGN_BOX);
		fixture.var("ATrust.APIKey", apiKey);
		fixture.var("ATrust.ServerUrl", ServerUrl);
		fixture.var("ATrust.SignBox", SignBox);
	}

	public static void setUpConfigForMockServer(AppFixture fixture, IApplication app) {
		fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Url", ATrustSignMock.URI);
		fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Features", "");

		RestClients clients = RestClients.of(app);
		RestClient atrustRestClient = clients.find(ATRUST_REST_CLIENT);
		var mockClient = atrustRestClient.toBuilder()
				.features(List.of(new RestClientFeature(HeaderFeature.class.getName()),
						new RestClientFeature(MultiPartFeature.class.getName()),
						new RestClientFeature(OpenApiJsonFeature.class.getName())))
				.property("AUTH.apiKey", "apiKey").property("PATH.serverUrl", "serverUrl")
				.property("PATH.signBox", "signBox").toRestClient();
		clients.set(mockClient);
	}
}
