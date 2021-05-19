[Ivy]
1797F203890511D1 9.2.0 #module
>Proto >Proto Collection #zClass
Ee0 EndSignature Big #zClass
Ee0 B #cInfo
Ee0 #process
Ee0 @AnnotationInP-0n ai ai #zField
Ee0 @TextInP .type .type #zField
Ee0 @TextInP .processKind .processKind #zField
Ee0 @TextInP .xml .xml #zField
Ee0 @TextInP .responsibility .responsibility #zField
Ee0 @Alternative f9 '' #zField
Ee0 @Alternative f6 '' #zField
Ee0 @GridStep f20 '' #zField
Ee0 @GridStep f79 '' #zField
Ee0 @GridStep f45 '' #zField
Ee0 @StartRequest f5 '' #zField
Ee0 @GridStep f19 '' #zField
Ee0 @Alternative f3 '' #zField
Ee0 @GridStep f47 '' #zField
Ee0 @Alternative f4 '' #zField
Ee0 @GridStep f24 '' #zField
Ee0 @WSElement f23 '' #zField
Ee0 @GridStep f21 '' #zField
Ee0 @GridStep f7 '' #zField
Ee0 @GridStep f10 '' #zField
Ee0 @GridStep f25 '' #zField
Ee0 @StartRequest f39 '' #zField
Ee0 @PushWFArc f27 '' #zField
Ee0 @PushWFArc f33 '' #zField
Ee0 @PushWFArc f32 '' #zField
Ee0 @PushWFArc f30 '' #zField
Ee0 @PushWFArc f28 '' #zField
Ee0 @PushWFArc f8 '' #zField
Ee0 @PushWFArc f31 '' #zField
Ee0 @PushWFArc f26 '' #zField
Ee0 @PushWFArc f48 '' #zField
Ee0 @PushWFArc f11 '' #zField
Ee0 @PushWFArc f37 '' #zField
Ee0 @PushWFArc f34 '' #zField
Ee0 @PushWFArc f29 '' #zField
Ee0 @PushWFArc f12 '' #zField
Ee0 @PushWFArc f36 '' #zField
Ee0 @PushWFArc f13 '' #zField
Ee0 @PushWFArc f14 '' #zField
Ee0 @PushWFArc f35 '' #zField
Ee0 @PushWFArc f15 '' #zField
Ee0 @ErrorBoundaryEvent f22 '' #zField
>Proto Ee0 Ee0 EndSignature #zField
Ee0 f9 672 592 32 32 0 16 #rect
Ee0 f6 352 592 32 32 0 16 #rect
Ee0 f20 actionTable 'out=in;
' #txt
Ee0 f20 actionCode 'import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;
import com.axonivy.connector.atrust.restricted.SignatureSessionContainer;
import ch.ivyteam.ivy.bpm.error.BpmError;

SignatureSessionContainer container = ATrustSignerSessionHelper.getContainerObjectFromSession();
if( in.callbackSafetyHash.length() == 0 ) {
	BpmError.create("com:axonivy:connector:atrust:callback:nohash")
		.withMessage("Illegal start of callback process. No callbackSafetyHash parameter provided.")
		.throwError();
}
else if( !container.callbackSafetyHash.equals(in.callbackSafetyHash) ) {
	BpmError.create("com:axonivy:connector:atrust:callback:hashmismatch")
		.withMessage("Signature ticket in session does not match callback by A-Trust. No parallel signature of multiple documents allowed.")
		.throwError();
}

//after hash is verified, get data from session container and remove it from the session
ATrustSignerSessionHelper.clearSessionData();

in.aTrustTicketID = container.aTrustTicketID;
in.referenceTaskId = container.referenceTaskId;
in.callbackUrlAfterSignature = container.callbackUrlAfterSignature;
' #txt
Ee0 f20 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Check for valid hash&#13;
and get data from session</name>
    </language>
</elementInfo>
' #txt
Ee0 f20 160 202 176 44 -68 -16 #rect
Ee0 f79 actionTable 'out=in;
' #txt
Ee0 f79 actionCode 'import ch.ivyteam.ivy.request.IHttpRequest;
import ch.ivyteam.ivy.request.IHttpResponse;

IHttpRequest httpRequest = ivy.request as IHttpRequest;
IHttpResponse httpResponse = ivy.response as IHttpResponse;

httpResponse.sendRedirect(in.callbackUrlAfterSignature);' #txt
Ee0 f79 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Forward to calling process&#13;
callback URL</name>
    </language>
</elementInfo>
' #txt
Ee0 f79 1248 202 176 44 -68 -16 #rect
Ee0 f45 actionTable 'out=in;
' #txt
Ee0 f45 actionCode 'import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;
import ch.ivyteam.ivy.workflow.ITask;
import ch.ivyteam.ivy.request.IHttpResponse;
import ch.ivyteam.ivy.request.IHttpRequest;

//remove data from session, because PDF documents could use lots of space
ATrustSignerSessionHelper.clearSessionData();
ITask requestTask = ivy.wf.findTask(in.referenceTaskId);
String targetUrl = ivy.html.taskstartref(requestTask);

//redirect user to task
IHttpRequest httpRequest = ivy.request as IHttpRequest;
IHttpResponse httpResponse = ivy.response as IHttpResponse;
httpResponse.sendRedirect(targetUrl);
' #txt
Ee0 f45 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Remove SignatureResult from session&#13;
Redirect user to task</name>
    </language>
</elementInfo>
' #txt
Ee0 f45 760 586 240 44 -101 -16 #rect
Ee0 f5 outLink start.ivp #txt
Ee0 f5 inParamDecl '<String callbackSafetyHash> param;' #txt
Ee0 f5 inParamTable 'out.callbackSafetyHash=param.callbackSafetyHash;
' #txt
Ee0 f5 requestEnabled true #txt
Ee0 f5 triggerEnabled false #txt
Ee0 f5 callSignature start(String) #txt
Ee0 f5 persist false #txt
Ee0 f5 caseData businessCase.attach=true #txt
Ee0 f5 showInStartList 0 #txt
Ee0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(callbackSafetyHash)</name>
    </language>
</elementInfo>
' #txt
Ee0 f5 @C|.responsibility Everybody #txt
Ee0 f5 81 209 30 30 -34 27 #rect
Ee0 f5 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Ee0 f5 bg|bg|-65536 #nodeStyle
Ee0 f19 actionTable 'out=in;
' #txt
Ee0 f19 actionCode 'in.signatureResult.referenceTaskId = in.referenceTaskId;
in.signatureResult.signatureAppliedSuccessfully = true;
in.signatureResult.aTrustTicketID = in.aTrustTicketID;
' #txt
Ee0 f19 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Set successful&#13;
flag to TRUE</name>
    </language>
</elementInfo>
' #txt
Ee0 f19 744 106 128 44 -40 -16 #rect
Ee0 f3 992 208 32 32 0 16 #rect
Ee0 f47 actionTable 'out=in;
' #txt
Ee0 f47 actionCode 'import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;
import com.axonivy.connector.atrust.restricted.SignatureResult;
import ch.ivyteam.ivy.bpm.error.BpmError;

//get signature result from session (as we only handle one siganture per user at a time, we do not need more parameters)
SignatureResult sr = ATrustSignerSessionHelper.getSignatureResultFromSession();
if( #sr == null ) {
	BpmError.create("com:axonivy:connector:atrust:documentsignature:nosessiondata").withMessage("No signature result data present in current user session").throwError();
}

in.signatureAppliedSuccessfully = sr.signatureAppliedSuccessfully;
in.referenceTaskId = sr.referenceTaskId;
' #txt
Ee0 f47 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Verify SignatureResult</name>
    </language>
</elementInfo>
' #txt
Ee0 f47 176 586 128 44 -60 -8 #rect
Ee0 f4 608 208 32 32 0 16 #rect
Ee0 f24 actionTable 'out=in;
' #txt
Ee0 f24 actionCode 'in.signatureResult.referenceTaskId = in.referenceTaskId;
in.signatureResult.aTrustTicketID = in.aTrustTicketID;
in.signatureResult.errorMessage = "No signed document provided. Maybe cancelled by user.";
in.signatureResult.signatureAppliedSuccessfully = false;
in.signatureResult.documentName = null;
in.signatureResult.pdfDocument = null;
' #txt
Ee0 f24 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Set not signed error message</name>
    </language>
</elementInfo>
' #txt
Ee0 f24 744 202 176 44 -82 -8 #rect
Ee0 f23 actionTable 'out=in;
out.resultCode=wsResponse.endSignatureResult;
out.signatureResult.certificateB64=wsResponse.certificateB64;
out.signatureResult.documentName=wsResponse.documentName;
out.signatureResult.pdfDocument=wsResponse.documentData;
' #txt
Ee0 f23 clientId 1797F21DA09F10E5 #txt
Ee0 f23 port HttpsEndpoint #txt
Ee0 f23 operation EndSignature #txt
Ee0 f23 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.ticket=in.aTrustTicketID;
' #txt
Ee0 f23 exceptionHandler com:axonivy:connector:atrust:endsignature:exception #txt
Ee0 f23 beanConfig "" #txt
Ee0 f23 timeout 0 #txt
Ee0 f23 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call Handysignatur service&#13;
EndSignature</name>
    </language>
</elementInfo>
' #txt
Ee0 f23 384 202 176 44 -68 -16 #rect
Ee0 f21 actionTable 'out=in;
' #txt
Ee0 f21 actionCode 'import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;

ATrustSignerSessionHelper.saveToSession(in.signatureResult);' #txt
Ee0 f21 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Store signature result&#13;
to session</name>
    </language>
</elementInfo>
' #txt
Ee0 f21 1064 202 144 44 -53 -16 #rect
Ee0 f7 actionTable 'out=in;
' #txt
Ee0 f7 actionCode 'import com.axonivy.connector.atrust.enums.SignatureStatus;
import com.axonivy.connector.atrust.bo.SignatureDocumentData;
import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;
import com.axonivy.connector.atrust.restricted.SignatureResult;
import ch.ivyteam.ivy.workflow.ITask;
import java.io.ByteArrayInputStream;
import ch.ivyteam.ivy.workflow.document.Path;
import org.primefaces.model.DefaultStreamedContent;
import ch.ivyteam.ivy.workflow.ICase;
import org.primefaces.model.StreamedContent;

SignatureResult sr = ATrustSignerSessionHelper.getSignatureResultFromSession();
//attached SIGNED Doc to request case
ITask requestTask = ivy.wf.findTask(in.referenceTaskId);

String docName = "SIGNED_" + sr.documentName;
String contentType = "application/pdf";
StreamedContent generatedSignatureDocument = new DefaultStreamedContent(new ByteArrayInputStream(sr.getPdfDocument()), contentType, docName);
ICase requestCase = requestTask.getCase().getBusinessCase();
requestCase.documents().add(new Path(docName)).write().withContentFrom(generatedSignatureDocument.getStream());

SignatureDocumentData signatureDocumentData = new SignatureDocumentData();
signatureDocumentData.documentName = docName;
signatureDocumentData.pdfDocument = sr.pdfDocument;
signatureDocumentData.signatureStatus = SignatureStatus.SIGNED;
signatureDocumentData.signatureTicket = sr.aTrustTicketID;

//save to repo
String dataObjectId = ivy.repo.save(signatureDocumentData).getId();
requestTask.customFields().stringField("referenceSignDocId").set(dataObjectId);
' #txt
Ee0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Add signed doc to case&#13;
Store data to business data</name>
    </language>
</elementInfo>
' #txt
Ee0 f7 440 586 176 44 -69 -16 #rect
Ee0 f10 actionTable 'out=in;
' #txt
Ee0 f10 actionCode 'import com.axonivy.connector.atrust.util.ATrustSignerSessionHelper;
import com.axonivy.connector.atrust.enums.SignatureStatus;
import com.axonivy.connector.atrust.bo.SignatureDocumentData;
import com.axonivy.connector.atrust.restricted.SignatureResult;
import ch.ivyteam.ivy.workflow.ITask;

SignatureResult sr = ATrustSignerSessionHelper.getSignatureResultFromSession();
in.referenceTaskId = sr.referenceTaskId;

//attached SIGNED Doc to request case
ITask requestTask = ivy.wf.findTask(in.referenceTaskId);

SignatureDocumentData signatureDocumentData = new SignatureDocumentData();
signatureDocumentData.signatureStatus = SignatureStatus.NOT_SIGN;
signatureDocumentData.signatureTicket = sr.aTrustTicketID;
signatureDocumentData.lastSignatureError = sr.errorMessage;

//save to repo
String dataObjectId = ivy.repo.save(signatureDocumentData).getId();
requestTask.customFields().stringField("referenceSignDocId").set(dataObjectId);
' #txt
Ee0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Store result to repo</name>
    </language>
</elementInfo>
' #txt
Ee0 f10 440 490 112 44 -52 -8 #rect
Ee0 f25 actionTable 'out=in;
' #txt
Ee0 f25 actionCode 'in.signatureResult.referenceTaskId = in.referenceTaskId;
in.signatureResult.aTrustTicketID = in.aTrustTicketID;
in.signatureResult.errorMessage = "End Signature Web Service Error: Code " + in.resultCode;
in.signatureResult.signatureAppliedSuccessfully = false;
in.signatureResult.documentName = null;
in.signatureResult.pdfDocument = null;' #txt
Ee0 f25 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Set generic error message</name>
    </language>
</elementInfo>
' #txt
Ee0 f25 744 298 160 44 -73 -8 #rect
Ee0 f39 outLink SignatureCallBack.ivp #txt
Ee0 f39 inParamDecl '<> param;' #txt
Ee0 f39 requestEnabled true #txt
Ee0 f39 triggerEnabled false #txt
Ee0 f39 callSignature SignatureCallBack() #txt
Ee0 f39 persist false #txt
Ee0 f39 caseData businessCase.attach=true #txt
Ee0 f39 showInStartList 0 #txt
Ee0 f39 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>SignatureCallBack.ivp</name>
    </language>
</elementInfo>
' #txt
Ee0 f39 @C|.responsibility Everybody #txt
Ee0 f39 81 593 30 30 -49 17 #rect
Ee0 f27 536 271 1008 240 #arcP
Ee0 f27 1 536 387 #addKink
Ee0 f27 2 1008 387 #addKink
Ee0 f27 1 0.4721552942284704 0 0 #arcLabel
Ee0 f33 expr in #txt
Ee0 f33 1024 224 1064 224 #arcP
Ee0 f32 expr out #txt
Ee0 f32 920 224 992 224 #arcP
Ee0 f32 0 0.15362572048340492 0 0 #arcLabel
Ee0 f30 expr in #txt
Ee0 f30 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>no error</name>
    </language>
</elementInfo>
' #txt
Ee0 f30 624 208 744 128 #arcP
Ee0 f30 1 624 128 #addKink
Ee0 f30 1 0.03952121853282668 4 -8 #arcLabel
Ee0 f28 expr out #txt
Ee0 f28 111 224 160 224 #arcP
Ee0 f8 expr in #txt
Ee0 f8 outCond in.signatureAppliedSuccessfully #txt
Ee0 f8 384 608 440 608 #arcP
Ee0 f31 expr out #txt
Ee0 f31 1208 224 1248 224 #arcP
Ee0 f26 expr in #txt
Ee0 f26 outCond 'in.resultCode != 0' #txt
Ee0 f26 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>resultCode != 0</name>
    </language>
</elementInfo>
' #txt
Ee0 f26 624 240 744 320 #arcP
Ee0 f26 1 624 320 #addKink
Ee0 f26 1 0.4772727272727273 0 -8 #arcLabel
Ee0 f48 expr out #txt
Ee0 f48 111 608 176 608 #arcP
Ee0 f11 704 608 760 608 #arcP
Ee0 f37 expr out #txt
Ee0 f37 336 224 384 224 #arcP
Ee0 f34 expr in #txt
Ee0 f34 outCond 'in.signatureResult.pdfDocument.size() == 0  || in.signatureResult.certificateB64.length() == 0' #txt
Ee0 f34 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>no doc or no cert</name>
    </language>
</elementInfo>
' #txt
Ee0 f34 640 224 744 224 #arcP
Ee0 f34 0 0.5229762632388595 1 -12 #arcLabel
Ee0 f29 expr out #txt
Ee0 f29 904 320 1008 240 #arcP
Ee0 f29 1 1008 320 #addKink
Ee0 f29 0 0.14250872914922688 0 0 #arcLabel
Ee0 f12 304 608 352 608 #arcP
Ee0 f36 expr out #txt
Ee0 f36 872 128 1008 208 #arcP
Ee0 f36 1 1008 128 #addKink
Ee0 f36 0 0.1536813872601905 -2 -9 #arcLabel
Ee0 f13 616 608 672 608 #arcP
Ee0 f14 expr in #txt
Ee0 f14 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>error</name>
    </language>
</elementInfo>
' #txt
Ee0 f14 368 592 440 512 #arcP
Ee0 f14 1 368 512 #addKink
Ee0 f14 1 0.4583333333333333 0 -16 #arcLabel
Ee0 f35 expr out #txt
Ee0 f35 560 224 608 224 #arcP
Ee0 f15 552 512 688 592 #arcP
Ee0 f15 1 688 512 #addKink
Ee0 f15 0 0.2279760548790699 -1 -15 #arcLabel
Ee0 f22 actionTable 'out=in;
out.signatureResult.documentName=null;
out.signatureResult.errorMessage=error.getLocalizedMessage();
out.signatureResult.pdfDocument=null;
out.signatureResult.signatureAppliedSuccessfully=false;
' #txt
Ee0 f22 errorCode com:axonivy:connector:atrust:endsignature:exception #txt
Ee0 f22 attachedToRef 1797F203890511D1-f23 #txt
Ee0 f22 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name></name>
    </language>
</elementInfo>
' #txt
Ee0 f22 521 241 30 30 -119 17 #rect
>Proto Ee0 .type com.axonivy.connector.atrust.EndSignatureData #txt
>Proto Ee0 .processKind NORMAL #txt
>Proto Ee0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>A-Trust Signature</swimlaneLabel>
        <swimlaneLabel>End Signature</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>416</swimlaneSize>
    <swimlaneSize>416</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-3342388</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneType>LANE_IN_POOL</swimlaneType>
    <swimlaneSpaceBefore>32</swimlaneSpaceBefore>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto Ee0 0 0 32 24 18 0 #rect
>Proto Ee0 @|BIcon #fIcon
Ee0 f5 mainOut f28 tail #connect
Ee0 f28 head f20 mainIn #connect
Ee0 f20 mainOut f37 tail #connect
Ee0 f37 head f23 mainIn #connect
Ee0 f23 mainOut f35 tail #connect
Ee0 f35 head f4 in #connect
Ee0 f4 out f26 tail #connect
Ee0 f26 head f25 mainIn #connect
Ee0 f25 mainOut f29 tail #connect
Ee0 f29 head f3 in #connect
Ee0 f22 mainOut f27 tail #connect
Ee0 f27 head f3 in #connect
Ee0 f24 mainOut f32 tail #connect
Ee0 f32 head f3 in #connect
Ee0 f4 out f34 tail #connect
Ee0 f34 head f24 mainIn #connect
Ee0 f4 out f30 tail #connect
Ee0 f30 head f19 mainIn #connect
Ee0 f19 mainOut f36 tail #connect
Ee0 f36 head f3 in #connect
Ee0 f3 out f33 tail #connect
Ee0 f33 head f21 mainIn #connect
Ee0 f21 mainOut f31 tail #connect
Ee0 f31 head f79 mainIn #connect
Ee0 f39 mainOut f48 tail #connect
Ee0 f48 head f47 mainIn #connect
Ee0 f47 mainOut f12 tail #connect
Ee0 f12 head f6 in #connect
Ee0 f6 out f8 tail #connect
Ee0 f8 head f7 mainIn #connect
Ee0 f6 out f14 tail #connect
Ee0 f14 head f10 mainIn #connect
Ee0 f7 mainOut f13 tail #connect
Ee0 f13 head f9 in #connect
Ee0 f9 out f11 tail #connect
Ee0 f11 head f45 mainIn #connect
Ee0 f10 mainOut f15 tail #connect
Ee0 f15 head f9 in #connect
