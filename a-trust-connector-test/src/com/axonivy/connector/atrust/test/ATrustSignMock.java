package com.axonivy.connector.atrust.test;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import ch.ivyteam.ivy.environment.Ivy;
import io.swagger.v3.oas.annotations.Hidden;

@Path(ATrustSignMock.PATH_SUFFIX)
@PermitAll
@Hidden
public class ATrustSignMock {

	static final String PATH_SUFFIX = "testbox/testboxrest/v2/";
	public static final String URI = "{ivy.app.baseurl}/api/" + PATH_SUFFIX;
	static final String TEMPLATE_PATH = "templates";
	static final String SIGNATURE_BATCHES_PATH = "signaturebatches";
	static final String MOCK_TEMPLATE_LOCATION = PATH_SUFFIX + TEMPLATE_PATH + "/101";
	static final String MOCK_BATCH_LOCATION = PATH_SUFFIX + SIGNATURE_BATCHES_PATH + "/" + UUID.randomUUID().toString();

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(TEMPLATE_PATH)
	public String getTemplates() {
		return load("json/templates.json");
	}

	@POST
	@Produces()
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Path(TEMPLATE_PATH)
	public Response addTemplate(@FormDataParam("file") InputStream uploadStream,
			@FormDataParam("file") FormDataContentDisposition fileMetaData)
			throws MalformedURLException, URISyntaxException {
		var location = new URL(Ivy.html().applicationHomeRef() + MOCK_TEMPLATE_LOCATION).toURI();
		return Response.created(location).build();
	}

	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Path(TEMPLATE_PATH + "/{templateId}")
	public Response deleteTemplate(@PathParam(value = "templateId") String templateId) {
		return Response.ok().build();
	}

	@POST
	@Path(SIGNATURE_BATCHES_PATH)
	public Response createBatch() throws MalformedURLException, URISyntaxException {
		var location = new URL(Ivy.html().applicationHomeRef() + MOCK_BATCH_LOCATION).toURI();
		return Response.created(location).build();
	}

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Path(SIGNATURE_BATCHES_PATH + "/{ticketId}/documents")
	public Response addDocToBatch(@PathParam("ticketId") String ticketId,
			@FormDataParam("file") InputStream uploadStream,
			@FormDataParam("file") FormDataContentDisposition fileMetaData, @QueryParam("location") String location,
			@QueryParam("location") String reason, @QueryParam("template") String template,
			@QueryParam("page") String page, @QueryParam("x") String x, @QueryParam("y") String y,
			@QueryParam("w") String w, @QueryParam("h") String h) throws MalformedURLException, URISyntaxException {
		var locationURL = new URL(Ivy.html().applicationHomeRef() + MOCK_BATCH_LOCATION).toURI();
		return Response.created(locationURL).build();
	}

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Path(SIGNATURE_BATCHES_PATH + "/{ticketId}/mobileSignature")
	public Response createMobileSignature(@PathParam("ticketId") String ticketId)
			throws MalformedURLException, URISyntaxException {
		var locationURL = new URL(Ivy.html().applicationHomeRef() + MOCK_BATCH_LOCATION).toURI();
		return Response.created(locationURL).build();
	}

	private static String load(String path) {
		try (InputStream is = ATrustSignMock.class.getResourceAsStream(path)) {
			return IOUtils.toString(is, StandardCharsets.UTF_8);
		} catch (IOException ex) {
			throw new RuntimeException("Failed to read resource: " + path);
		}
	}
}
