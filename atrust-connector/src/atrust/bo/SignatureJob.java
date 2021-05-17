package atrust.bo;

import java.io.Serializable;

public class SignatureJob implements Serializable {

	private static final long serialVersionUID = -4688723205680819328L;

	private Long taskId;
	private String documentName;
	private byte[] pdfDocument;
	private Double signStampCoordinatesX0;
	private Double signStampCoordinatesX1;
	private Double signStampCoordinatesY0;
	private Double signStampCoordinatesY1;
	private String callbackUrlAfterSignature;
	private Long signStampPageNumber;

	public SignatureJob() {	}

	/**
	 * @param taskId The id of calling task.
	 * @param documentName Name of the document for display purpose.
	 * @param pdfDocument PDF Document that should be signed.
	 * @param signStampCoordinatesX0 Position to apply the stamp.
	 * @param signStampCoordinatesX1 Position to apply the stamp.
	 * @param signStampCoordinatesY0 Position to apply the stamp.
	 * @param signStampCoordinatesY1 Position to apply the stamp.
	 * @param callbackUrlAfterSignature URL of your callback process. User will be forwarded to this place after signature is done. Per default, user will be forwarded to working task.
	 * @param signStampPageNumber Page number to apply the stamp. Default= 1
	 */
	public SignatureJob(Long taskId, String documentName, byte[] pdfDocument, Double signStampCoordinatesX0,
			Double signStampCoordinatesX1, Double signStampCoordinatesY0, Double signStampCoordinatesY1,
			String callbackUrlAfterSignature, Long signStampPageNumber) {
		super();
		this.taskId = taskId;
		this.documentName = documentName;
		this.pdfDocument = pdfDocument;
		this.signStampCoordinatesX0 = signStampCoordinatesX0;
		this.signStampCoordinatesX1 = signStampCoordinatesX1;
		this.signStampCoordinatesY0 = signStampCoordinatesY0;
		this.signStampCoordinatesY1 = signStampCoordinatesY1;
		this.callbackUrlAfterSignature = callbackUrlAfterSignature;
		this.signStampPageNumber = signStampPageNumber;
	}

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public byte[] getPdfDocument() {
		return pdfDocument;
	}

	public void setPdfDocument(byte[] pdfDocument) {
		this.pdfDocument = pdfDocument;
	}

	public Double getSignStampCoordinatesX0() {
		return signStampCoordinatesX0;
	}

	public void setSignStampCoordinatesX0(Double signStampCoordinatesX0) {
		this.signStampCoordinatesX0 = signStampCoordinatesX0;
	}

	public Double getSignStampCoordinatesX1() {
		return signStampCoordinatesX1;
	}

	public void setSignStampCoordinatesX1(Double signStampCoordinatesX1) {
		this.signStampCoordinatesX1 = signStampCoordinatesX1;
	}

	public Double getSignStampCoordinatesY0() {
		return signStampCoordinatesY0;
	}

	public void setSignStampCoordinatesY0(Double signStampCoordinatesY0) {
		this.signStampCoordinatesY0 = signStampCoordinatesY0;
	}

	public Double getSignStampCoordinatesY1() {
		return signStampCoordinatesY1;
	}

	public void setSignStampCoordinatesY1(Double signStampCoordinatesY1) {
		this.signStampCoordinatesY1 = signStampCoordinatesY1;
	}

	public String getCallbackUrlAfterSignature() {
		return callbackUrlAfterSignature;
	}

	public void setCallbackUrlAfterSignature(String callbackUrlAfterSignature) {
		this.callbackUrlAfterSignature = callbackUrlAfterSignature;
	}

	public Long getSignStampPageNumber() {
		return signStampPageNumber;
	}

	public void setSignStampPageNumber(Long signStampPageNumber) {
		this.signStampPageNumber = signStampPageNumber;
	}
}
