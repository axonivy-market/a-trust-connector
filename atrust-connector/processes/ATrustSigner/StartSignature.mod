[Ivy]
17944BA9442F63F7 9.2.0 #module
>Proto >Proto Collection #zClass
Se0 StartSignature Big #zClass
Se0 B #cInfo
Se0 #process
Se0 @AnnotationInP-0n ai ai #zField
Se0 @TextInP .type .type #zField
Se0 @TextInP .processKind .processKind #zField
Se0 @TextInP .xml .xml #zField
Se0 @TextInP .responsibility .responsibility #zField
Se0 @GridStep f8 '' #zField
Se0 @WSElement f4 '' #zField
Se0 @GridStep f12 '' #zField
Se0 @GridStep f14 '' #zField
Se0 @Alternative f7 '' #zField
Se0 @PushWFArc f13 '' #zField
Se0 @PushWFArc f9 '' #zField
Se0 @PushWFArc f11 '' #zField
Se0 @PushWFArc f18 '' #zField
Se0 @ErrorBoundaryEvent f6 '' #zField
Se0 @GridStep f41 '' #zField
Se0 @Alternative f42 '' #zField
Se0 @PushWFArc f44 '' #zField
Se0 @PushWFArc f17 '' #zField
Se0 @PushWFArc f16 '' #zField
Se0 @GridStep f10 '' #zField
Se0 @PushWFArc f43 '' #zField
Se0 @PushWFArc f38 '' #zField
Se0 @StartSub f0 '' #zField
Se0 @PushWFArc f1 '' #zField
Se0 @EndSub f2 '' #zField
Se0 @PushWFArc f19 '' #zField
>Proto Se0 Se0 StartSignature #zField
Se0 f8 actionTable 'out=in;
' #txt
Se0 f8 actionCode 'import atrust.enums.SignatureStatus;

in.signatureDocumentData.resultCode = in.resultCode;
in.signatureDocumentData.signatureTicket = in.signatureTicket;
in.signatureDocumentData.lastSignatureError = "Start Signature Web Service Error: Code " + in.resultCode;
in.signatureDocumentData.signatureStatus = SignatureStatus.FAILED;
in.signatureDocumentData.pdfDocument = null;' #txt
Se0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Set generic error message</name>
    </language>
</elementInfo>
' #txt
Se0 f8 816 74 160 44 -73 -8 #rect
Se0 f4 actionTable 'out=in;
out.forwardTargetUrl=wsResponse.handySignaturUrl;
out.resultCode=wsResponse.startSignatureTemplateExResult;
out.signatureTicket=wsResponse.ticket;
' #txt
Se0 f4 clientId 17963E54F88541B8 #txt
Se0 f4 port HttpsEndpoint #txt
Se0 f4 operation StartSignatureTemplateEx #txt
Se0 f4 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.documentData=in.signatureJob.pdfDocument;
parameters.documentName=in.signatureJob.documentName;
parameters.errorURL=in.internalCallbackUrl;
parameters.page=in.signatureJob.signStampPageNumber > 0 ? in.signatureJob.signStampPageNumber : 1;
parameters.redirectURL=in.internalCallbackUrl;
parameters.sigTemplateId=Integer.parseInt(ivy.var.ATrust_ATrustTemplateId);
parameters.x0=in.signatureJob.signStampCoordinatesX0;
parameters.x1=in.signatureJob.signStampCoordinatesX1;
parameters.y0=in.signatureJob.signStampCoordinatesY0;
parameters.y1=in.signatureJob.signStampCoordinatesY1;
' #txt
Se0 f4 exceptionHandler at:aws:atrustsigner:startsignature:exception #txt
Se0 f4 beanConfig "" #txt
Se0 f4 timeout 0 #txt
Se0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call Handysignatur service&#13;
StartSignature</name>
    </language>
</elementInfo>
' #txt
Se0 f4 464 170 176 44 -68 -16 #rect
Se0 f12 actionTable 'out=in;
' #txt
Se0 f12 actionCode 'import atrust.connector.restricted.SignatureSessionContainer;
import atrust.util.ATrustSignerSessionHelper;
import org.apache.commons.lang3.StringUtils;

SignatureSessionContainer container = new SignatureSessionContainer();
container.aTrustTicketID = in.signatureTicket;
container.callbackSafetyHash = in.callbackSafetyHash;
container.callbackUrlAfterSignature = in.signatureJob.callbackUrlAfterSignature;
container.referenceTaskId = in.signatureJob.taskId;

if (StringUtils.isEmpty(container.callbackUrlAfterSignature)) {
	container.callbackUrlAfterSignature = ivy.html.startRef("ATrustSigner/EndSignature/SignatureCallBack.ivp");
}

ATrustSignerSessionHelper.saveToSession(container);' #txt
Se0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Store signature job&#13;
to user''s session</name>
    </language>
</elementInfo>
' #txt
Se0 f12 816 170 128 44 -46 -16 #rect
Se0 f14 actionTable 'out=in;
' #txt
Se0 f14 actionCode 'import java.util.UUID;

// Create a ramdom key for callback parameters
in.callbackSafetyHash = UUID.randomUUID().toString();

// Internal callback url which will be redirect at end of sign step
in.internalCallbackUrl = ivy.html.startref("ATrustSigner/EndSignature/start.ivp") + "?callbackSafetyHash=" + in.callbackSafetyHash;' #txt
Se0 f14 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Prepare callback parameters&#13;
for EndSignature step</name>
    </language>
</elementInfo>
' #txt
Se0 f14 224 170 192 44 -75 -16 #rect
Se0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>resultCode != 0</name>
    </language>
</elementInfo>
' #txt
Se0 f7 688 176 32 32 0 -117 #rect
Se0 f13 expr in #txt
Se0 f13 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>no error</name>
    </language>
</elementInfo>
' #txt
Se0 f13 720 192 816 192 #arcP
Se0 f13 0 0.53125 0 -13 #arcLabel
Se0 f9 expr out #txt
Se0 f9 640 192 688 192 #arcP
Se0 f11 expr out #txt
Se0 f11 416 192 464 192 #arcP
Se0 f18 expr in #txt
Se0 f18 outCond 'in.resultCode != 0' #txt
Se0 f18 704 176 816 96 #arcP
Se0 f18 1 704 96 #addKink
Se0 f18 1 0.15281434264333596 0 0 #arcLabel
Se0 f6 actionTable 'out=in;
out.signatureDocumentData.lastSignatureError=error.getLocalizedMessage();
' #txt
Se0 f6 errorCode at:aws:atrustsigner:startsignature:exception #txt
Se0 f6 attachedToRef 17944BA9442F63F7-f4 #txt
Se0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name></name>
    </language>
</elementInfo>
' #txt
Se0 f6 601 209 30 30 15 6 #rect
Se0 f41 actionTable 'out=in;
' #txt
Se0 f41 actionCode 'import ch.ivyteam.ivy.workflow.TaskState;
import java.util.Arrays;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.request.IHttpRequest;
import ch.ivyteam.ivy.request.IHttpResponse;

// Reset request task
ITask requestTask = ivy.wf.findTask(in.signatureJob.taskId);
List<TaskState> statesCanReset = Arrays.asList(TaskState.RESUMED, TaskState.CREATED, TaskState.PARKED, TaskState.READY_FOR_JOIN, TaskState.FAILED);
if (statesCanReset.contains(#requestTask.getState())) {
	requestTask.reset();
}

// Redirect to EndSignature with safety hash
IHttpRequest httpRequest = ivy.request as IHttpRequest;
IHttpResponse httpResponse = ivy.response as IHttpResponse;

httpResponse.sendRedirect(in.forwardTargetUrl);

' #txt
Se0 f41 security system #txt
Se0 f41 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Reset request task&#13;
and forward to EndSignature</name>
    </language>
</elementInfo>
' #txt
Se0 f41 1168 170 176 44 -70 -16 #rect
Se0 f42 1392 176 32 32 0 16 #rect
Se0 f44 expr out #txt
Se0 f44 976 96 1408 176 #arcP
Se0 f44 1 1408 96 #addKink
Se0 f44 0 0.5898941129540048 0 0 #arcLabel
Se0 f17 616 239 1408 208 #arcP
Se0 f17 1 616 288 #addKink
Se0 f17 2 1408 288 #addKink
Se0 f17 1 0.03406640910883355 0 0 #arcLabel
Se0 f16 1344 192 1392 192 #arcP
Se0 f16 0 0.6490674774449611 0 0 #arcLabel
Se0 f10 actionTable 'out=in;
' #txt
Se0 f10 actionCode 'import atrust.enums.SignatureStatus;

in.signatureDocumentData.resultCode = in.resultCode;
in.signatureDocumentData.signatureTicket = in.signatureTicket;
in.signatureDocumentData.lastSignatureError = "";
in.signatureDocumentData.signatureStatus = SignatureStatus.INPROGRESS;
in.signatureDocumentData.documentName = in.signatureJob.documentName;
in.signatureDocumentData.pdfDocument = null;
' #txt
Se0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Set signature output</name>
    </language>
</elementInfo>
' #txt
Se0 f10 992 170 128 44 -55 -8 #rect
Se0 f43 expr out #txt
Se0 f43 944 192 992 192 #arcP
Se0 f38 1120 192 1168 192 #arcP
Se0 f0 inParamDecl '<atrust.bo.SignatureJob signatureJob> param;' #txt
Se0 f0 inParamTable 'out.signatureJob=param.signatureJob;
' #txt
Se0 f0 outParamDecl '<atrust.bo.SignatureDocumentData signatureDocumentData> result;' #txt
Se0 f0 outParamTable 'result.signatureDocumentData=in.signatureDocumentData;
' #txt
Se0 f0 callSignature call(atrust.bo.SignatureJob) #txt
Se0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>call(SignatureJob)</name>
    </language>
</elementInfo>
' #txt
Se0 f0 129 177 30 30 -13 17 #rect
Se0 f1 159 192 224 192 #arcP
Se0 f2 1489 177 30 30 0 15 #rect
Se0 f19 1424 192 1489 192 #arcP
>Proto Se0 .type ATrustSigner.StartSignatureData #txt
>Proto Se0 .processKind CALLABLE_SUB #txt
>Proto Se0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>A-Trust Single Signature</swimlaneLabel>
        <swimlaneLabel>StartSignatureTemplateEx</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>384</swimlaneSize>
    <swimlaneSize>320</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-3342388</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneType>LANE_IN_POOL</swimlaneType>
    <swimlaneSpaceBefore>32</swimlaneSpaceBefore>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto Se0 0 0 32 24 18 0 #rect
>Proto Se0 @|BIcon #fIcon
Se0 f4 mainOut f9 tail #connect
Se0 f9 head f7 in #connect
Se0 f7 out f18 tail #connect
Se0 f18 head f8 mainIn #connect
Se0 f7 out f13 tail #connect
Se0 f13 head f12 mainIn #connect
Se0 f14 mainOut f11 tail #connect
Se0 f11 head f4 mainIn #connect
Se0 f8 mainOut f44 tail #connect
Se0 f44 head f42 in #connect
Se0 f6 mainOut f17 tail #connect
Se0 f17 head f42 in #connect
Se0 f41 mainOut f16 tail #connect
Se0 f16 head f42 in #connect
Se0 f12 mainOut f43 tail #connect
Se0 f43 head f10 mainIn #connect
Se0 f10 mainOut f38 tail #connect
Se0 f38 head f41 mainIn #connect
Se0 f0 mainOut f1 tail #connect
Se0 f1 head f14 mainIn #connect
Se0 f42 out f19 tail #connect
Se0 f19 head f2 mainIn #connect
