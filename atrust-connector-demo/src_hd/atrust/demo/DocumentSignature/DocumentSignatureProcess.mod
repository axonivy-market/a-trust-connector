[Ivy]
17963DD5D2CB13CA 9.2.0 #module
>Proto >Proto Collection #zClass
Ds0 DocumentSignatureProcess Big #zClass
Ds0 RD #cInfo
Ds0 #process
Ds0 @AnnotationInP-0n ai ai #zField
Ds0 @TextInP .type .type #zField
Ds0 @TextInP .processKind .processKind #zField
Ds0 @TextInP .xml .xml #zField
Ds0 @TextInP .responsibility .responsibility #zField
Ds0 @UdInit f0 '' #zField
Ds0 @UdProcessEnd f1 '' #zField
Ds0 @InfoButton f12 '' #zField
Ds0 @InfoButton f18 '' #zField
Ds0 @InfoButton f19 '' #zField
Ds0 @UdMethod f9 '' #zField
Ds0 @GridStep f10 '' #zField
Ds0 @UdProcessEnd f30 '' #zField
Ds0 @CallSub f13 '' #zField
Ds0 @PushWFArc f11 '' #zField
Ds0 @GridStep f8 '' #zField
Ds0 @PushWFArc f16 '' #zField
Ds0 @UdMethod f15 '' #zField
Ds0 @PushWFArc f17 '' #zField
Ds0 @PushWFArc f6 '' #zField
Ds0 @GridStep f20 '' #zField
Ds0 @PushWFArc f21 '' #zField
Ds0 @PushWFArc f7 '' #zField
Ds0 @UdMethod f22 '' #zField
Ds0 @UdMethod f25 '' #zField
Ds0 @UdMethod f27 '' #zField
Ds0 @UdMethod f29 '' #zField
Ds0 @GridStep f32 '' #zField
Ds0 @PushWFArc f33 '' #zField
Ds0 @GridStep f34 '' #zField
Ds0 @GridStep f36 '' #zField
Ds0 @PushWFArc f37 '' #zField
Ds0 @GridStep f38 '' #zField
Ds0 @PushWFArc f39 '' #zField
Ds0 @GridStep f40 '' #zField
Ds0 @PushWFArc f41 '' #zField
Ds0 @Alternative f42 '' #zField
Ds0 @PushWFArc f43 '' #zField
Ds0 @InfoButton f4 '' #zField
Ds0 @AnnotationArc f5 '' #zField
Ds0 @ErrorBoundaryEvent f14 '' #zField
Ds0 @GridStep f35 '' #zField
Ds0 @PushWFArc f47 '' #zField
Ds0 @PushWFArc f52 '' #zField
Ds0 @PushWFArc f23 '' #zField
Ds0 @UdProcessEnd f26 '' #zField
Ds0 @PushWFArc f44 '' #zField
Ds0 @PushWFArc f50 '' #zField
Ds0 @PushWFArc f49 '' #zField
Ds0 @PushWFArc f2 '' #zField
Ds0 @UdProcessEnd f3 '' #zField
Ds0 @PushWFArc f24 '' #zField
Ds0 @PushWFArc f28 '' #zField
>Proto Ds0 Ds0 DocumentSignatureProcess #zField
Ds0 f0 guid 17945D155C0F1547 #txt
Ds0 f0 method start() #txt
Ds0 f0 inParameterDecl '<> param;' #txt
Ds0 f0 outParameterDecl '<> result;' #txt
Ds0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ds0 f0 355 51 26 26 -33 13 #rect
Ds0 f1 355 235 26 26 0 12 #rect
Ds0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>How to integrate:&#13;
- Add a Call element to your process. It calls to   ATrustSigner/StartSignature process with start method is   call(SignatureJob).&#13;
- Prepare data for  SignatureJob  object:&#13;
	// Example data for Signature job&#13;
	SignatureJob signatureJob = new SignatureJob();&#13;
	signatureJob.taskId = ivy.task.getId(); // Current request task id&#13;
	signatureJob.documentName; // Document name&#13;
	signatureJob.pdfDocument; // Document in byte array format&#13;
	signatureJob.signStampCoordinatesX0 = 30.7; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesX1 = 60.2; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesY0 = 5.5; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesY1 = 14.4; // example for postion of stamp&#13;
	signatureJob.callbackUrlAfterSignature; // Call back url after signature, if leave with empty, the default callback url will be called&#13;
	signatureJob.signStampPageNumber; // Number of page where stamp will be sign on&#13;
&#13;
&#13;
- The return object is  SignatureDocumentData.&#13;
- After success, a document will be added to this case with the prefix     SIGNED_ if the doc is signed.&#13;
- Add a customfield name "referenceSignDocId" to this task to track the result of the signing process.&#13;
- The referenceSignDocId is the ID of the data object saved in ivy business data (ivy.repo)&#13;
</name>
        <nameStyle>27,5,8
4,5,8,0
40,5,8
27,5,8,0,1
32,5,8
19,5,8,0,1
22,5,8
12,5,8,0
9,5,8
798,5
24,5,8
21,5,8,0
1,5,8
2,5
75,5,8
7,5,8,0
15,5,8
6,5,8,0
29,5,8
18,5,8,0
151,5,8
2,5
</nameStyle>
        <desc>How to integrate:&#13;
- Add a Call element to your process. It calls to   ATrustSigner/StartSignature process with start method is   call(SignatureJob).&#13;
- Prepare data for  SignatureJob  object:&#13;
	// Example data for Signature job&#13;
	SignatureJob signatureJob = new SignatureJob();&#13;
	signatureJob.taskId = ivy.task.getId(); // Current request task id&#13;
	signatureJob.documentName; // Document name&#13;
	signatureJob.pdfDocument; // Document in byte array format&#13;
	signatureJob.signStampCoordinatesX0 = 30.7; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesX1 = 60.2; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesY0 = 5.5; // example for postion of stamp&#13;
	signatureJob.signStampCoordinatesY1 = 14.4; // example for postion of stamp&#13;
	signatureJob.callbackUrlAfterSignature; // Call back url after signature, if leave with empty, the default callback url will be called&#13;
	signatureJob.signStampPageNumber; // Number of page where stamp will be sign on&#13;
&#13;
&#13;
- The return object is  SignatureDocumentData.&#13;
- After success, a document will be added to this case with the prefix     SIGNED_ if the doc is signed.&#13;
- Add a customfield name "referenceSignDocId" to this task to track the result of the signing process.&#13;
- The referenceSignDocId is the ID of the data object saved in ivy business data (ivy.repo)&#13;
</desc>
    </language>
</elementInfo>
' #txt
Ds0 f12 64 802 912 380 -448 -185 #rect
Ds0 f12 bg|bg|-16744448 #nodeStyle
Ds0 f18 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Your process</name>
        <nameStyle>12,5,8,0
</nameStyle>
    </language>
</elementInfo>
' #txt
Ds0 f18 96 40 208 112 -51 -10 #rect
Ds0 f19 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Integration&#13;
&#13;
API KEY IN GLOBAL VARIABLE of A-TRUST-CONNECTOR project:&#13;
- ATrust.APIKey    : API Key for A-Trust Handysignatur api&#13;
- ATrust.ATrustTemplateId    : The ID of the signature template to be used.&#13;
</name>
        <nameStyle>13,5,8,0
62,5,0
17,5,0,12
43,5,0
27,5,0,12
48,5,0
</nameStyle>
    </language>
</elementInfo>
' #txt
Ds0 f19 68 480 504 112 -205 -50 #rect
Ds0 f19 bg|bg|-16744448 #nodeStyle
Ds0 f9 guid 17945D2D343BE5CA #txt
Ds0 f9 method sign() #txt
Ds0 f9 inParameterDecl 'at.DocumentSignatureComponent.DocumentSignatureComponentData out;
' #txt
Ds0 f9 inParameterMapAction 'out.disableSignButton=true;
' #txt
Ds0 f9 outParameterDecl '<> result;' #txt
Ds0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>sign()</name>
    </language>
</elementInfo>
' #txt
Ds0 f9 115 723 26 26 -16 15 #rect
Ds0 f10 actionTable 'out=in;
' #txt
Ds0 f10 actionCode 'import java.nio.file.Files;
import java.nio.file.Path;
import ch.ivyteam.ivy.workflow.document.IDocument;

//Get first doc from case
IDocument document = ivy.case.documents().getAll().get(0);
Path path = document.read().asJavaFile().toPath();

// Prepare data for Signature job
//SignatureJob signatureJob = new SignatureJob();
in.signatureJob.taskId = ivy.task.getId();
in.signatureJob.documentName = document.getName();
in.signatureJob.pdfDocument = Files.readAllBytes(path);
in.signatureJob.signStampCoordinatesX0 = 30.7;
in.signatureJob.signStampCoordinatesX1 = 60.2;
in.signatureJob.signStampCoordinatesY0 = 5.5;
in.signatureJob.signStampCoordinatesY1 = 14.4;
in.signatureJob.signStampPageNumber = 1;

//in.signatureJob = signatureJob;' #txt
Ds0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Prepare Input of A-Trust call&#13;
Input: SignatureJob</name>
    </language>
</elementInfo>
' #txt
Ds0 f10 200 714 176 44 -69 -16 #rect
Ds0 f30 1003 723 26 26 0 12 #rect
Ds0 f13 processCall ATrustSigner/StartSignature:call(atrust.connector.bo.SignatureJob) #txt
Ds0 f13 requestActionDecl '<atrust.connector.bo.SignatureJob signatureJob> param;' #txt
Ds0 f13 requestMappingAction 'param.signatureJob=in.signatureJob;
' #txt
Ds0 f13 responseActionDecl 'at.DocumentSignatureComponent.DocumentSignatureComponentData out;
' #txt
Ds0 f13 responseMappingAction 'out=in;
out.signatureDocumentData=result.signatureDocumentData;
' #txt
Ds0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call A-Trust to StartSignature&#13;
Input: SignatureJob&#13;
Output: SignatureDocumentData</name>
    </language>
</elementInfo>
' #txt
Ds0 f13 448 706 192 60 -89 -28 #rect
Ds0 f11 expr out #txt
Ds0 f11 141 736 200 736 #arcP
Ds0 f8 actionTable 'out=in;
' #txt
Ds0 f8 actionCode 'import atrust.connector.enums.SignatureStatus;
import atrust.connector.bo.SignatureDocumentData;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

String dataObjectId = ivy.task.customFields().stringField("referenceSignDocId").getOrNull();

SignatureDocumentData signatureDocumentData = ivy.repo.find(dataObjectId, SignatureDocumentData.class) as SignatureDocumentData;
if ( #signatureDocumentData != null ) {
	FacesMessage message = new FacesMessage();
	String summryMessage = "";
	if ( signatureDocumentData.signatureStatus == SignatureStatus.SIGNED ) {
		summryMessage = String.format("Ticket: %s. Status: %s.", signatureDocumentData.signatureTicket, signatureDocumentData.signatureStatus);
		message.severity = FacesMessage.SEVERITY_INFO;
	}
	else {
		summryMessage = String.format("Ticket: %s. Status: %s. Error message: %s", signatureDocumentData.signatureTicket, signatureDocumentData.signatureStatus, signatureDocumentData.lastSignatureError);
		message.severity = FacesMessage.SEVERITY_ERROR;
	}

	message.setSummary(summryMessage);
	FacesContext.getCurrentInstance().addMessage(null, message);

	in.disableSignButton = signatureDocumentData.signatureStatus == SignatureStatus.SIGNED;
}
' #txt
Ds0 f8 security system #txt
Ds0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get Message</name>
    </language>
</elementInfo>
' #txt
Ds0 f8 456 138 112 44 -36 -8 #rect
Ds0 f16 368 77 368 235 #arcP
Ds0 f16 0 0.5326213483853488 0 0 #arcLabel
Ds0 f15 guid 1795526D6912ED84 #txt
Ds0 f15 method loadStatus() #txt
Ds0 f15 inParameterDecl '<> param;' #txt
Ds0 f15 outParameterDecl '<> result;' #txt
Ds0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>loadStatus()</name>
    </language>
</elementInfo>
' #txt
Ds0 f15 499 51 26 26 -25 15 #rect
Ds0 f17 512 77 512 138 #arcP
Ds0 f6 376 736 448 736 #arcP
Ds0 f20 actionTable 'out=in;
' #txt
Ds0 f20 actionCode 'import atrust.connector.enums.SignatureStatus;
import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

in.disableSignButton = in.signatureDocumentData.signatureStatus == SignatureStatus.INPROGRESS;

if ( in.signatureDocumentData.signatureStatus != SignatureStatus.SIGNED ) {
	String summryMessage = "Ticket: " + in.signatureDocumentData.signatureTicket + ". Status: " + in.signatureDocumentData.signatureStatus + ". Error message: " + in.signatureDocumentData.lastSignatureError;
	FacesMessage message = new FacesMessage(summryMessage);
	message.severity = FacesMessage.SEVERITY_ERROR;
	FacesContext.getCurrentInstance().addMessage(null, message);
}
' #txt
Ds0 f20 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Disable sign document if state is inprogress&#13;
Add message</name>
    </language>
</elementInfo>
' #txt
Ds0 f20 688 714 272 44 -116 -16 #rect
Ds0 f21 expr out #txt
Ds0 f21 640 736 688 736 #arcP
Ds0 f7 960 736 1003 736 #arcP
Ds0 f22 guid 17960294D6528B44 #txt
Ds0 f22 method renderTable() #txt
Ds0 f22 inParameterDecl '<> param;' #txt
Ds0 f22 outParameterDecl '<> result;' #txt
Ds0 f22 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>renderTable()</name>
    </language>
</elementInfo>
' #txt
Ds0 f22 659 51 26 26 -25 15 #rect
Ds0 f25 guid 179602AA7BB9A436 #txt
Ds0 f25 method download(ch.ivyteam.ivy.workflow.document.IDocument) #txt
Ds0 f25 inParameterDecl '<ch.ivyteam.ivy.workflow.document.IDocument document> param;' #txt
Ds0 f25 inParameterMapAction 'out.selectedDocument=param.document;
' #txt
Ds0 f25 outParameterDecl '<org.primefaces.model.StreamedContent streamContent> result;' #txt
Ds0 f25 outParameterMapAction 'result.streamContent=in.streamedContent;
' #txt
Ds0 f25 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>download(IDocument)</name>
    </language>
</elementInfo>
' #txt
Ds0 f25 1235 51 26 26 -75 15 #rect
Ds0 f27 guid 179602D5136D7503 #txt
Ds0 f27 method upload(org.primefaces.event.FileUploadEvent) #txt
Ds0 f27 inParameterDecl '<org.primefaces.event.FileUploadEvent event> param;' #txt
Ds0 f27 inParameterMapAction 'out.uploadedFile=param.event.getFile();
' #txt
Ds0 f27 outParameterDecl '<> result;' #txt
Ds0 f27 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>upload(FileUploadEvent)</name>
    </language>
</elementInfo>
' #txt
Ds0 f27 1011 51 26 26 -25 15 #rect
Ds0 f29 guid 17960313FC066DB0 #txt
Ds0 f29 method delete() #txt
Ds0 f29 inParameterDecl '<> param;' #txt
Ds0 f29 outParameterDecl '<> result;' #txt
Ds0 f29 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>delete()</name>
    </language>
</elementInfo>
' #txt
Ds0 f29 819 51 26 26 -31 15 #rect
Ds0 f32 actionTable 'out=in;
' #txt
Ds0 f32 actionCode 'import ch.ivyteam.ivy.workflow.document.IDocument;

in.documents = ivy.case.documents().getAll();
in.disableSignButton = in.documents.size() == 0;
' #txt
Ds0 f32 security system #txt
Ds0 f32 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get all docs in case</name>
    </language>
</elementInfo>
' #txt
Ds0 f32 616 138 112 44 -53 -8 #rect
Ds0 f33 672 77 672 138 #arcP
Ds0 f34 actionTable 'out=in;
' #txt
Ds0 f34 actionCode 'import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;
import ch.ivyteam.ivy.workflow.document.IDocument;

//Add the new file to case
ivy.case.documents().add(in.uploadedFile.getFileName()).write().withContentFrom(in.uploadedFile.getInputstream());

//Update message
FacesMessage message = new FacesMessage(String.format("Upload file %s to case successfully", in.uploadedFile.getFileName(), ivy.case.getId()));
FacesContext.getCurrentInstance().addMessage("form:upload-message", message);
' #txt
Ds0 f34 security system #txt
Ds0 f34 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Add file to case</name>
    </language>
</elementInfo>
' #txt
Ds0 f34 968 274 112 44 -41 -8 #rect
Ds0 f36 actionTable 'out=in;
' #txt
Ds0 f36 actionCode 'import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;

//Remove selected doc
ivy.case.documents().delete(in.selectedDocument.getId());

//Update message
FacesMessage message = new FacesMessage(String.format("%s has deleted", in.selectedDocument.getName()));
FacesContext.getCurrentInstance().addMessage("form:upload-message", message);

in.selectedDocument = null;
' #txt
Ds0 f36 security system #txt
Ds0 f36 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Remove doc</name>
    </language>
</elementInfo>
' #txt
Ds0 f36 776 138 112 44 -34 -8 #rect
Ds0 f37 832 77 832 138 #arcP
Ds0 f38 actionTable 'out=in;
' #txt
Ds0 f38 actionCode 'import java.nio.file.Files;
import org.primefaces.model.DefaultStreamedContent;
import java.io.InputStream;

//Get content type
String contentType = Files.probeContentType(in.selectedDocument.read().asJavaFile().toPath());

//Read doc as stream content
InputStream inputStream = ivy.case.documents().get(in.selectedDocument.getId()).read().asStream();
in.streamedContent = new DefaultStreamedContent(inputStream, contentType, in.selectedDocument.getName());
' #txt
Ds0 f38 security system #txt
Ds0 f38 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Download selected doc</name>
    </language>
</elementInfo>
' #txt
Ds0 f38 1176 138 144 44 -64 -8 #rect
Ds0 f39 1248 77 1248 138 #arcP
Ds0 f40 actionTable 'out=in;
' #txt
Ds0 f40 actionCode 'import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;
import ch.ivyteam.ivy.workflow.document.Path;

//Find doc in case by name
String fileName = in.uploadedFile.getFileName();
in.doesDocumentExist = ivy.case.documents().get(new Path(fileName)) != null;

if (in.doesDocumentExist) {
	//Update message
	FacesMessage message = new FacesMessage(String.format("Document %s already exists", fileName));
	message.setSeverity(FacesMessage.SEVERITY_ERROR);
	FacesContext.getCurrentInstance().addMessage("form:upload-message", message);
}


' #txt
Ds0 f40 security system #txt
Ds0 f40 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Validation</name>
    </language>
</elementInfo>
' #txt
Ds0 f40 968 138 112 44 -27 -8 #rect
Ds0 f41 1024 77 1024 138 #arcP
Ds0 f42 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>exist?</name>
    </language>
</elementInfo>
' #txt
Ds0 f42 1008 208 32 32 24 -8 #rect
Ds0 f43 1024 182 1024 208 #arcP
Ds0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get first doc in current case</name>
    </language>
</elementInfo>
' #txt
Ds0 f4 280 649 160 30 -74 -8 #rect
Ds0 f5 360 679 288 714 #arcP
Ds0 f14 actionTable 'out=in;
' #txt
Ds0 f14 attachedToRef 17963DD5D2CB13CA-f34 #txt
Ds0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name></name>
    </language>
</elementInfo>
' #txt
Ds0 f14 1041 313 30 30 0 15 #rect
Ds0 f35 actionTable 'out=in;
' #txt
Ds0 f35 actionCode '
//Disable upload
in.disableUpload = ivy.case.documents().getAll().size() > 0;' #txt
Ds0 f35 security system #txt
Ds0 f35 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Check disable upload</name>
    </language>
</elementInfo>
' #txt
Ds0 f35 768 274 128 44 -60 -8 #rect
Ds0 f47 968 296 896 296 #arcP
Ds0 f52 832 182 832 274 #arcP
Ds0 f52 0 0.9174941947970494 0 0 #arcLabel
Ds0 f23 expr in #txt
Ds0 f23 1024 240 1024 274 #arcP
Ds0 f26 819 395 26 26 0 12 #rect
Ds0 f44 832 318 832 395 #arcP
Ds0 f50 512 182 768 296 #arcP
Ds0 f50 1 512 296 #addKink
Ds0 f50 1 0.0010823579929230285 0 0 #arcLabel
Ds0 f49 expr in #txt
Ds0 f49 outCond in.doesDocumentExist #txt
Ds0 f49 1008 224 832 274 #arcP
Ds0 f49 1 832 224 #addKink
Ds0 f49 0 0.7147717687121272 0 0 #arcLabel
Ds0 f2 672 182 768 296 #arcP
Ds0 f2 1 672 296 #addKink
Ds0 f2 1 0.8970112028821641 0 0 #arcLabel
Ds0 f3 1235 283 26 26 0 12 #rect
Ds0 f24 1248 182 1248 283 #arcP
Ds0 f28 1056 343 845 408 #arcP
Ds0 f28 1 1056 408 #addKink
Ds0 f28 1 0.3463426343732845 0 0 #arcLabel
>Proto Ds0 .type atrust.demo.DocumentSignature.DocumentSignatureData #txt
>Proto Ds0 .processKind HTML_DIALOG #txt
>Proto Ds0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>Example to integrate in your process</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>768</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneSpaceBefore>448</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto Ds0 -8 -8 16 16 16 26 #rect
Ds0 f9 mainOut f11 tail #connect
Ds0 f11 head f10 mainIn #connect
Ds0 f0 mainOut f16 tail #connect
Ds0 f16 head f1 mainIn #connect
Ds0 f15 mainOut f17 tail #connect
Ds0 f17 head f8 mainIn #connect
Ds0 f10 mainOut f6 tail #connect
Ds0 f6 head f13 mainIn #connect
Ds0 f13 mainOut f21 tail #connect
Ds0 f21 head f20 mainIn #connect
Ds0 f20 mainOut f7 tail #connect
Ds0 f7 head f30 mainIn #connect
Ds0 f22 mainOut f33 tail #connect
Ds0 f33 head f32 mainIn #connect
Ds0 f29 mainOut f37 tail #connect
Ds0 f37 head f36 mainIn #connect
Ds0 f25 mainOut f39 tail #connect
Ds0 f39 head f38 mainIn #connect
Ds0 f27 mainOut f41 tail #connect
Ds0 f41 head f40 mainIn #connect
Ds0 f40 mainOut f43 tail #connect
Ds0 f43 head f42 in #connect
Ds0 f4 ao f5 tail #connect
Ds0 f5 head f10 @CG|ai #connect
Ds0 f34 mainOut f47 tail #connect
Ds0 f47 head f35 mainIn #connect
Ds0 f36 mainOut f52 tail #connect
Ds0 f52 head f35 mainIn #connect
Ds0 f23 head f34 mainIn #connect
Ds0 f35 mainOut f44 tail #connect
Ds0 f44 head f26 mainIn #connect
Ds0 f8 mainOut f50 tail #connect
Ds0 f50 head f35 mainIn #connect
Ds0 f42 out f49 tail #connect
Ds0 f49 head f35 mainIn #connect
Ds0 f42 out f23 tail #connect
Ds0 f32 mainOut f2 tail #connect
Ds0 f2 head f35 mainIn #connect
Ds0 f38 mainOut f24 tail #connect
Ds0 f24 head f3 mainIn #connect
Ds0 f14 mainOut f28 tail #connect
Ds0 f28 head f26 mainIn #connect
