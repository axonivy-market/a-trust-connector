package com.axonivy.connector.atrust.test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;

import io.swagger.v3.oas.annotations.Hidden;

@Path(ATrustSignMock.PATH_SUFFIX)
@PermitAll
@Hidden
public class ATrustSignMock {

	static final String PATH_SUFFIX = "testbox/testboxrest/v2/";
	public static final String URI = "{ivy.app.baseurl}/api/" + PATH_SUFFIX;
	static final String TEMPLATE_PATH = "templates";
	static final String MOCK_TEMPLATE_LOCATION = URI + TEMPLATE_PATH + "/101";

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(TEMPLATE_PATH)
	public String getTemplates() {
		return load("json/templates.json");
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Path(TEMPLATE_PATH)
	public Response addTemplate(File template) throws MalformedURLException, URISyntaxException {
		var location = new URL(MOCK_TEMPLATE_LOCATION).toURI();
		return Response.created(location).build();
	}

	private static String load(String path) {
		try (InputStream is = ATrustSignMock.class.getResourceAsStream(path)) {
			return IOUtils.toString(is, StandardCharsets.UTF_8);
		} catch (IOException ex) {
			throw new RuntimeException("Failed to read resource: " + path);
		}
	}
}
