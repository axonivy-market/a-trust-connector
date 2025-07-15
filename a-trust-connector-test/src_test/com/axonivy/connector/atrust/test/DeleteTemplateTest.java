package com.axonivy.connector.atrust.test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.apache.http.HttpStatus;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.axonivy.connector.atrust.test.utils.ATrustTestUtils;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.scripting.objects.CompositeObject;

@IvyProcessTest(enableWebServer = true)
public class DeleteTemplateTest {
	private static final BpmProcess INTEGRATION_PROCESS = BpmProcess.path("ATrustIntegration/ATrustDemo");

	@BeforeEach
	public void beforeEach(AppFixture fixture, IApplication app) {
		ATrustTestUtils.setUpConfigForMockServer(fixture, app);
	}

	@Test
	public void deleteTemplateProcess(BpmClient bpmClient) {
		BpmElement startable = INTEGRATION_PROCESS.elementName("DeleteSignatureTemplate.ivp");
		ExecutionResult result = bpmClient.start().process(startable).execute();
		CompositeObject data = result.data().last();
		assertThat(data).isNotNull();
		com.axonivy.connector.atrust.demo.Data demoData = (com.axonivy.connector.atrust.demo.Data) data;
		Integer resultCode = demoData.getTemplateData().getResultCode();
		assertTrue(resultCode == HttpStatus.SC_OK);
		assertThat(demoData.getTemplateId()).isNotEqualTo(0);
	}
}
