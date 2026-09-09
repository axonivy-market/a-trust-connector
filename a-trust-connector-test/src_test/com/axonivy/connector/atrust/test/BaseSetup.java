package com.axonivy.connector.atrust.test;

import java.util.List;

import org.glassfish.jersey.media.multipart.MultiPartFeature;

import com.axonivy.connector.atrust.config.HeaderFeature;
import com.axonivy.connector.atrust.config.OpenApiJsonFeature;
import com.axonivy.connector.atrust.test.constants.ATrustTestConstants;

import ch.ivyteam.ivy.environment.AppFixture;

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

	protected static Runnable runMockEnv(AppFixture fixture) {
		return () -> {
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Url", ATrustSignMock.URI);
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Features",
					List.of(HeaderFeature.class.getName(), MultiPartFeature.class.getName(),
							OpenApiJsonFeature.class.getName()));
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Properties.AUTH.apiKey", "apiKey");
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Properties.PATH.serverUrl", "serverUrl");
			fixture.config("RestClients." + ATRUST_REST_CLIENT + ".Properties.PATH.signBox", "signBox");
		};
	}
}
