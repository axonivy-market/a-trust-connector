package com.axonivy.connector.atrust.test.context;

import java.util.stream.Stream;

import org.junit.jupiter.api.extension.ExtensionContext;
import org.junit.jupiter.api.extension.TestTemplateInvocationContext;
import org.junit.jupiter.api.extension.TestTemplateInvocationContextProvider;

import com.axonivy.connector.atrust.test.constants.ATrustTestConstants;

public class MultiEnvironmentContextProvider implements TestTemplateInvocationContextProvider {
	@Override
	public boolean supportsTestTemplate(ExtensionContext context) {
		return true;
	}

	@Override
	public Stream<TestTemplateInvocationContext> provideTestTemplateInvocationContexts(ExtensionContext context) {
		String testEnv = System.getProperty(ATrustTestConstants.END_TO_END_TESTING_ENVIRONMENT_KEY);
		return switch (testEnv) {
		case ATrustTestConstants.END_TO_END_TESTING_ENVIRONMENT_VALUE ->
			Stream.of(new TestEnvironmentInvocationContext(ATrustTestConstants.REAL_CALL_CONTEXT_DISPLAY_NAME));
		default ->
			Stream.of(new TestEnvironmentInvocationContext(ATrustTestConstants.MOCK_SERVER_CONTEXT_DISPLAY_NAME));
		};
	}
}
