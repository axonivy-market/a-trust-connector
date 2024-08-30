package com.axonivy.connector.atrust;

import java.io.IOException;

import org.apache.commons.io.FileUtils;

import ch.ivyteam.ivy.cm.ContentObjectValue;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.scripting.objects.File;

public class IvyScriptCmsHelper {

	public static ContentObjectValue getContentObjectValue(String path) {
		return Ivy.cms().get(path).get().value().get();
	}

	public static void copyContentObjectValueToFile(ContentObjectValue contentObjectValue, File file) throws IOException {
		if (file == null || contentObjectValue == null) {
			return;
		}
		FileUtils.copyInputStreamToFile(contentObjectValue.read().inputStream(), file.getJavaFile());
	}
}
