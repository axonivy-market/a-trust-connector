package com.axonivy.connector.atrust.bo;

import java.io.File;
import java.io.Serializable;

import com.axonivy.connector.atrust.enums.SignatureStatus;

public class SignatureDocumentData implements Serializable {

	private static final long serialVersionUID = -2539526110614338433L;

	private String signatureTicket;
	private SignatureStatus signatureStatus;
	private String documentId;
	private String documentName;
	private byte[] pdfDocument;
	private File pdfFile;
	private Integer resultCode;
	private String lastSignatureError;

	public String getSignatureTicket() {
		return signatureTicket;
	}

	public void setSignatureTicket(String signatureTicket) {
		this.signatureTicket = signatureTicket;
	}

	public SignatureStatus getSignatureStatus() {
		return signatureStatus;
	}

	public void setSignatureStatus(SignatureStatus signatureStatus) {
		this.signatureStatus = signatureStatus;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public File getPdfFile() {
		return pdfFile;
	}

	public void setPdfFile(File pdfFile) {
		this.pdfFile = pdfFile;
	}

	public byte[] getPdfDocument() {
		return pdfDocument;
	}

	public void setPdfDocument(byte[] pdfDocument) {
		this.pdfDocument = pdfDocument;
	}

	public Integer getResultCode() {
		return resultCode;
	}

	public void setResultCode(Integer resultCode) {
		this.resultCode = resultCode;
	}

	public String getLastSignatureError() {
		return lastSignatureError;
	}

	public void setLastSignatureError(String lastSignatureError) {
		this.lastSignatureError = lastSignatureError;
	}

}
