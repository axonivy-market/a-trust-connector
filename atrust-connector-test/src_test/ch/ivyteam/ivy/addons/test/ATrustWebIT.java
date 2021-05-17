package ch.ivyteam.ivy.addons.test;

import static com.codeborne.selenide.Condition.attribute;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;

import com.axonivy.ivy.webtest.IvyWebTest;
import com.axonivy.ivy.webtest.engine.EngineUrl;

@IvyWebTest(headless = true)
public class ATrustWebIT {

	@Test
	public void navigateToInfoPage() {
		open(EngineUrl.base());

		$("img").shouldBe(attribute("alt", "Axon Ivy"));
		$(By.tagName("img")).shouldBe(attribute("alt", "Axon Ivy"));
	}

	@Test
	public void openDemoATrustDialogForm() {
		// open demo form
		open(EngineUrl.createProcessUrl("atrust-connector-demo/17945B68D64A9057/StartATrustExample.ivp"));

		$("img").shouldBe(attribute("alt", "Axon Ivy"));
		// sign doc button should be disabled
		$(By.id("form:signature-document")).shouldBe(attribute("disabled", "true"));
	}

}