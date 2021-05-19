[Ivy]
17969069DFA18010 9.2.0 #module
>Proto >Proto Collection #zClass
Tt0 TestATrust Big #zClass
Tt0 B #cInfo
Tt0 #process
Tt0 @AnnotationInP-0n ai ai #zField
Tt0 @TextInP .type .type #zField
Tt0 @TextInP .processKind .processKind #zField
Tt0 @TextInP .xml .xml #zField
Tt0 @TextInP .responsibility .responsibility #zField
Tt0 @StartRequest f0 '' #zField
Tt0 @CallSub f13 '' #zField
Tt0 @GridStep f10 '' #zField
Tt0 @PushWFArc f6 '' #zField
Tt0 @PushWFArc f3 '' #zField
>Proto Tt0 Tt0 TestATrust #zField
Tt0 f0 outLink startSignature.ivp #txt
Tt0 f0 inParamDecl '<> param;' #txt
Tt0 f0 requestEnabled true #txt
Tt0 f0 triggerEnabled false #txt
Tt0 f0 callSignature startSignature() #txt
Tt0 f0 caseData businessCase.attach=true #txt
Tt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>startSignature.ivp</name>
    </language>
</elementInfo>
' #txt
Tt0 f0 @C|.responsibility Everybody #txt
Tt0 f0 81 113 30 30 -21 17 #rect
Tt0 f13 processCall ATrust/StartSignature:call(com.axonivy.connector.atrust.bo.SignatureJob) #txt
Tt0 f13 requestActionDecl '<com.axonivy.connector.atrust.bo.SignatureJob signatureJob> param;' #txt
Tt0 f13 requestMappingAction 'param.signatureJob=in.signatureJob;
' #txt
Tt0 f13 responseActionDecl 'at.DocumentSignatureComponent.DocumentSignatureComponentData out;
' #txt
Tt0 f13 responseMappingAction 'out=in;
out.signatureDocumentData=result.signatureDocumentData;
' #txt
Tt0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Call A-Trust to StartSignature&#13;
Input: SignatureJob&#13;
Output: SignatureDocumentData</name>
    </language>
</elementInfo>
' #txt
Tt0 f13 432 98 192 60 -89 -28 #rect
Tt0 f10 actionTable 'out=in;
' #txt
Tt0 f10 actionCode 'import com.axonivy.connector.atrust.bo.SignatureJob;
import ch.ivyteam.ivy.cm.IContentObjectValue;
import java.nio.file.Files;
import java.nio.file.Path;
import ch.ivyteam.ivy.workflow.document.IDocument;

//Get first doc from CMS
IContentObjectValue docContent = ivy.cms.getContentObjectValue("/TestData/ATrustTestDoc", ivy.session.getContentLocale());
				
// Prepare data for Signature job
SignatureJob signatureJob = new SignatureJob();
signatureJob.taskId = ivy.task.getId();
signatureJob.documentName = "ATrustTestDoc.pdf";
signatureJob.pdfDocument = docContent.getContentAsByteArray();
signatureJob.signStampCoordinatesX0 = 30.7;
signatureJob.signStampCoordinatesX1 = 60.2;
signatureJob.signStampCoordinatesY0 = 5.5;
signatureJob.signStampCoordinatesY1 = 14.4;
signatureJob.signStampPageNumber = 1;

in.signatureJob = signatureJob;
' #txt
Tt0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Prepare Input of A-Trust call&#13;
Input: SignatureJob</name>
    </language>
</elementInfo>
' #txt
Tt0 f10 184 106 176 44 -69 -16 #rect
Tt0 f6 360 128 432 128 #arcP
Tt0 f3 111 128 184 128 #arcP
>Proto Tt0 .type com.axonivy.connector.atrust.test.Data #txt
>Proto Tt0 .processKind NORMAL #txt
>Proto Tt0 0 0 32 24 18 0 #rect
>Proto Tt0 @|BIcon #fIcon
Tt0 f10 mainOut f6 tail #connect
Tt0 f6 head f13 mainIn #connect
Tt0 f0 mainOut f3 tail #connect
Tt0 f3 head f10 mainIn #connect
