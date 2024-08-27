package com.axonivy.connector.atrust.util;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.faces.context.FacesContext;

import com.axonivy.connector.atrust.constant.Constants;
import com.axonivy.connector.atrust.enums.ATrustBpmErrorCode;

import ch.ivyteam.ivy.bpm.error.BpmError;
import ch.ivyteam.ivy.business.data.store.BusinessDataInfo;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.request.IHttpResponse;
import ch.ivyteam.ivy.security.exec.Sudo;
import ch.ivyteam.ivy.workflow.ICase;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.workflow.TaskState;

public class IvyUtils {
	private static final List<TaskState> STATES_CAN_RESET = Arrays.asList(TaskState.RESUMED, TaskState.CREATED,
			TaskState.PARKED, TaskState.READY_FOR_JOIN, TaskState.FAILED);

	private IvyUtils() {
	}

	public static <T> T queryRepoById(String id, Class<T> clazz) {
		return Sudo.get(() -> {
			return Ivy.repo().find(id, clazz);
		});
	}

	public static BusinessDataInfo<Object> saveToRepo(Object entity) {
		if (entity == null) {
			return null;
		}
		return Sudo.get(() -> {
			return Ivy.repo().save(entity);
		});
	}

	public static void resetTask(long taskId) {
		Sudo.run(() -> {
			ITask requestTask = Ivy.wf().findTask(taskId);
			if (STATES_CAN_RESET.contains(requestTask.getState())) {
				requestTask.reset();
			}
		});
	}

	public static void redirectTo(String url) throws IOException {
		IHttpResponse httpResponse = (IHttpResponse) Ivy.response();
		httpResponse.sendRedirect(url);
	}

	public static void redirectToApplicationHome() throws IOException {
		redirectTo(Ivy.html().applicationHomeRef());
	}

	public static void addDocToCase(String docName, File content, long caseId, boolean isAddedSignedPrefix) {
		ICase ivyCase = findCase(caseId);
		if (ivyCase == null) {
			return;
		}
		try {
			Sudo.run(() -> {
				if (isAddedSignedPrefix) {
					ivyCase.documents().add(Constants.SIGNED_PREFIX + docName).write().withContentFrom(content);
				} else {
					ivyCase.documents().add(docName).write().withContentFrom(content);
				}
			});
		} catch (Exception e) {
			Ivy.log().error("ATrustHandy: cannot add doc to case", e);
		}
	}

	public static ITask findTask(long taskId) {
		return Sudo.get(() -> {
			return Ivy.wf().findTask(taskId);
		});
	}

	public static ICase findCase(long caseId) {
		return Sudo.get(() -> {
			return Ivy.wf().findCase(caseId);
		});
	}

	public static String getCMSTranslation(String url, Object... params) {
		return Ivy.cms().co(url, List.of(params));
	}

	public static void throwBpmErrorAndSetValidationFailed() {
		if (FacesContext.getCurrentInstance() != null) {
			FacesContext.getCurrentInstance().validationFailed();
		}
		BpmError.create(ATrustBpmErrorCode.TEMPLATE_NOT_FOUND.getCode())
				.withMessage(ATrustBpmErrorCode.TEMPLATE_NOT_FOUND.getErrorMessage()).throwError();
	}
}
