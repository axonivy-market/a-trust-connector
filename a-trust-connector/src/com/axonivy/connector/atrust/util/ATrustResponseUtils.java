package com.axonivy.connector.atrust.util;

import static com.axonivy.connector.atrust.enums.ATrustHeaderLocation.DOCUMENTS;
import static com.axonivy.connector.atrust.enums.ATrustHeaderLocation.SIGNATURE_BATCHES;
import static com.axonivy.connector.atrust.enums.ATrustHeaderLocation.TEMPLATES;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;

import javax.ws.rs.core.Response;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;

import com.axonivy.connector.atrust.bo.ATrustException;
import com.axonivy.connector.atrust.enums.ATrustBpmErrorCode;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.scripting.objects.File;

public class ATrustResponseUtils {

	private ATrustResponseUtils() {
	}

	public static Integer extractTemplateIdFromResponse(Response response) {
		validateResponse(response);
		if (isCreated(response)) {
			String docId = StringUtils.substringAfter(response.getLocation().getPath(), TEMPLATES.getPath());
			return Integer.parseInt(docId);
		}
		return 0;
	}

	public static String extractSignBatchTicketFromResponse(Response response) {
		validateResponse(response);
		if (isCreated(response)) {
			return StringUtils.substringAfter(response.getLocation().getPath(), SIGNATURE_BATCHES.getPath());
		}
		return StringUtils.EMPTY;
	}

	public static String extractHandySignatureUrlFromResponse(Response response) throws MalformedURLException {
		validateResponse(response);
		if (isCreated(response)) {
			return response.getLocation().toURL().toString();
		}
		return StringUtils.EMPTY;
	}

	public static String extractDocumentIdFromResponse(Response response) {
		validateResponse(response);
		if (isCreated(response)) {
			return StringUtils.substringAfter(response.getLocation().getPath(), DOCUMENTS.getPath());
		}
		return StringUtils.EMPTY;
	}

	public static File download(Response response, String filename) {
		File file = null;
		if (HttpStatus.SC_OK == response.getStatus()) {
			try (InputStream is = response.readEntity(InputStream.class)) {
				file = new File(filename, true);
				byte[] bytes = IOUtils.toByteArray(is);
				FileUtils.writeByteArrayToFile(file.getJavaFile(), bytes);
			} catch (IOException e) {
				BpmError.create(ATrustBpmErrorCode.GENERAL.getCode())
						.withMessage(ATrustBpmErrorCode.GENERAL.getErrorMessage()).withCause(e).throwError();
			}
		}
		return file;
	}

	private static boolean isCreated(Response response) {
		return response != null && HttpStatus.SC_CREATED == response.getStatus();
	}

	private static void validateResponse(Response response) {
		if (response == null) {
			throw new ATrustException("No HTTP Response was persisted");
		}
	}
}
