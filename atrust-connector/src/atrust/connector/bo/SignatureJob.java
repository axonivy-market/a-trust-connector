package atrust.connector.bo;

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

	public SignatureJob() { }

	/**
	 * @param taskId                    {@link #setTaskId(Long)}
	 * @param documentName              {@link #setDocumentName(String)}
	 * @param pdfDocument               {@link #setPdfDocument(byte[])}
	 * @param signStampCoordinatesX0    {@link #setSignStampCoordinatesX0(Double)}
	 * @param signStampCoordinatesX1    {@link #setSignStampCoordinatesX1(Double)}
	 * @param signStampCoordinatesY0    {@link #setSignStampCoordinatesY0(Double)}
	 * @param signStampCoordinatesY1    {@link #setSignStampCoordinatesY1(Double)}
	 * @param callbackUrlAfterSignature {@link #setCallbackUrlAfterSignature(String)}
	 * @param signStampPageNumber       {@link #setSignStampPageNumber(Long)}
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

	/**
	 * @return The id of calling task.
	 */
	public Long getTaskId() {
		return taskId;
	}

	/**
	 * @param taskId The id of calling task.
	 */
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	/**
	 * @return Name of the document for display purpose.
	 */
	public String getDocumentName() {
		return documentName;
	}

	/**
	 * @param documentName Name of the document for display purpose.
	 */
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	/**
	 * @return PDF Document that should be signed.
	 */
	public byte[] getPdfDocument() {
		return pdfDocument;
	}

	/**
	 * @param pdfDocument PDF Document that should be signed.
	 */
	public void setPdfDocument(byte[] pdfDocument) {
		this.pdfDocument = pdfDocument;
	}

	/**
	 * The position of the signature seal in the PDF.
	 * 
	 * @return Left lower X coordinate of the signature seal (in user space units).
	 */
	public Double getSignStampCoordinatesX0() {
		return signStampCoordinatesX0;
	}

	/**
	 * Set the position of the signature seal in the PDF.
	 * 
	 * @param signStampCoordinatesX0 Left lower X coordinate of the signature seal
	 *                               (in user space units).
	 */
	public void setSignStampCoordinatesX0(Double signStampCoordinatesX0) {
		this.signStampCoordinatesX0 = signStampCoordinatesX0;
	}

	/**
	 * The position of the signature seal in the PDF.
	 * 
	 * @return Right upper X coordinate of the signature seal (in user space units).
	 */
	public Double getSignStampCoordinatesX1() {
		return signStampCoordinatesX1;
	}

	/**
	 * Set the position of the signature seal in the PDF.
	 * 
	 * @param signStampCoordinatesX1 Right upper X coordinate of the signature seal
	 *                               (in user space units).
	 */
	public void setSignStampCoordinatesX1(Double signStampCoordinatesX1) {
		this.signStampCoordinatesX1 = signStampCoordinatesX1;
	}

	/**
	 * The position of the signature seal in the PDF.
	 * 
	 * @return Left lower Y coordinate of the signature seal (in user space units).
	 */
	public Double getSignStampCoordinatesY0() {
		return signStampCoordinatesY0;
	}

	/**
	 * Set the position of the signature seal in the PDF.
	 * 
	 * @param signStampCoordinatesY0 Left lower Y coordinate of the signature seal
	 *                               (in user space units).
	 */
	public void setSignStampCoordinatesY0(Double signStampCoordinatesY0) {
		this.signStampCoordinatesY0 = signStampCoordinatesY0;
	}

	/**
	 * Set the position of the signature seal in the PDF.
	 * 
	 * @return signStampCoordinatesY1 Right upper Y coordinate of the signature seal
	 *         (in user space units).
	 */
	public Double getSignStampCoordinatesY1() {
		return signStampCoordinatesY1;
	}

	/**
	 * Set the position of the signature seal in the PDF.
	 * 
	 * @param signStampCoordinatesY1 Right upper Y coordinate of the signature seal
	 *                               (in user space units).
	 */
	public void setSignStampCoordinatesY1(Double signStampCoordinatesY1) {
		this.signStampCoordinatesY1 = signStampCoordinatesY1;
	}

	/**
	 * @return URL of your callback process. User will be forwarded to this place
	 *         after signature is done. Per default, user will be forwarded to
	 *         working task.
	 */
	public String getCallbackUrlAfterSignature() {
		return callbackUrlAfterSignature;
	}

	/**
	 * @param callbackUrlAfterSignature URL of your callback process. User will be
	 *                                  forwarded to this place after signature is
	 *                                  done. Per default, user will be forwarded to
	 *                                  working task.
	 */
	public void setCallbackUrlAfterSignature(String callbackUrlAfterSignature) {
		this.callbackUrlAfterSignature = callbackUrlAfterSignature;
	}

	/**
	 * @return Page number to apply the stamp. Default= 1
	 */
	public Long getSignStampPageNumber() {
		return signStampPageNumber;
	}

	/**
	 * @param signStampPageNumber Page number to apply the stamp.
	 */
	public void setSignStampPageNumber(Long signStampPageNumber) {
		this.signStampPageNumber = signStampPageNumber;
	}
}
