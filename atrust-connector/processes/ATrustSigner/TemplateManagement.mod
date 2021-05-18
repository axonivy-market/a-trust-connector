[Ivy]
17946776E3FC9608 9.2.0 #module
>Proto >Proto Collection #zClass
Tt0 TemplateManagement Big #zClass
Tt0 B #cInfo
Tt0 #process
Tt0 @AnnotationInP-0n ai ai #zField
Tt0 @TextInP .type .type #zField
Tt0 @TextInP .processKind .processKind #zField
Tt0 @TextInP .xml .xml #zField
Tt0 @TextInP .responsibility .responsibility #zField
Tt0 @WSElement f103 '' #zField
Tt0 @WSElement f4 '' #zField
Tt0 @WSElement f90 '' #zField
Tt0 @GridStep f91 '' #zField
Tt0 @PushWFArc f94 '' #zField
Tt0 @StartSub f3 '' #zField
Tt0 @PushWFArc f12 '' #zField
Tt0 @StartSub f0 '' #zField
Tt0 @PushWFArc f6 '' #zField
Tt0 @EndSub f1 '' #zField
Tt0 @EndSub f2 '' #zField
Tt0 @EndSub f5 '' #zField
Tt0 @PushWFArc f8 '' #zField
Tt0 @PushWFArc f10 '' #zField
Tt0 @PushWFArc f11 '' #zField
Tt0 @StartSub f13 '' #zField
Tt0 @PushWFArc f7 '' #zField
>Proto Tt0 Tt0 TemplateManagement #zField
Tt0 f103 actionTable 'out=in;
out.result.resultCode=wsResponse;
' #txt
Tt0 f103 clientId 17963E54F88541B8 #txt
Tt0 f103 port HttpsEndpoint #txt
Tt0 f103 operation DeleteTemplate #txt
Tt0 f103 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.sigTemplateId=in.templateId;
' #txt
Tt0 f103 beanConfig "" #txt
Tt0 f103 timeout 0 #txt
Tt0 f103 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Delete Template on HandySignatur</name>
    </language>
</elementInfo>
' #txt
Tt0 f103 320 298 208 44 -96 -8 #rect
Tt0 f4 actionTable 'out=in;
out.result.listTemplates=wsResponse.list;
out.result.resultCode=wsResponse.listTemplateResult;
' #txt
Tt0 f4 clientId 17963E54F88541B8 #txt
Tt0 f4 port HttpsEndpoint #txt
Tt0 f4 operation ListTemplate #txt
Tt0 f4 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
' #txt
Tt0 f4 beanConfig "" #txt
Tt0 f4 timeout 0 #txt
Tt0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get List Template</name>
    </language>
</elementInfo>
' #txt
Tt0 f4 288 490 112 44 -48 -8 #rect
Tt0 f90 actionTable 'out=in;
out.result.resultCode=wsResponse.uploadTemplateResult;
out.result.sigTemplateId=wsResponse.sigTemplateId;
' #txt
Tt0 f90 clientId 17963E54F88541B8 #txt
Tt0 f90 port HttpsEndpoint #txt
Tt0 f90 operation UploadTemplate #txt
Tt0 f90 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.templateData=in.documentByteArray;
' #txt
Tt0 f90 beanConfig "" #txt
Tt0 f90 timeout 0 #txt
Tt0 f90 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Add template to&#13;
HandySignatur</name>
    </language>
</elementInfo>
' #txt
Tt0 f90 536 106 128 44 -41 -16 #rect
Tt0 f91 actionTable 'out=in;
' #txt
Tt0 f91 actionCode 'import java.nio.file.Files;
import java.nio.file.Path;

Path path = in.myIvyFile.getJavaFile().toPath();
in.documentByteArray = Files.readAllBytes(path);' #txt
Tt0 f91 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Transform file to&#13;
byte array</name>
    </language>
</elementInfo>
' #txt
Tt0 f91 320 106 128 44 -42 -16 #rect
Tt0 f94 expr out #txt
Tt0 f94 448 128 536 128 #arcP
Tt0 f3 inParamDecl '<File templateFile> param;' #txt
Tt0 f3 inParamTable 'out.myIvyFile=param.templateFile;
' #txt
Tt0 f3 outParamDecl '<atrust.connector.bo.TemplateData templateData> result;' #txt
Tt0 f3 outParamTable 'result.templateData=in.result;
' #txt
Tt0 f3 callSignature AddTemplateATrust(File) #txt
Tt0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>AddTemplateATrust(File)</name>
    </language>
</elementInfo>
' #txt
Tt0 f3 145 113 30 30 -13 17 #rect
Tt0 f3 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f3 bg|bg|-65536 #nodeStyle
Tt0 f12 175 128 320 128 #arcP
Tt0 f0 inParamDecl '<> param;' #txt
Tt0 f0 outParamDecl '<atrust.connector.bo.TemplateData templateData> result;' #txt
Tt0 f0 outParamTable 'result.templateData=in.result;
' #txt
Tt0 f0 callSignature GetListTemplate() #txt
Tt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>GetListTemplate()</name>
    </language>
</elementInfo>
' #txt
Tt0 f0 145 497 30 30 -13 17 #rect
Tt0 f0 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f0 bg|bg|-65536 #nodeStyle
Tt0 f6 175 512 288 512 #arcP
Tt0 f1 785 113 30 30 0 15 #rect
Tt0 f1 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f1 bg|bg|-65536 #nodeStyle
Tt0 f2 689 305 30 30 0 15 #rect
Tt0 f2 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f2 bg|bg|-65536 #nodeStyle
Tt0 f5 593 497 30 30 0 15 #rect
Tt0 f5 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f5 bg|bg|-65536 #nodeStyle
Tt0 f8 400 512 593 512 #arcP
Tt0 f10 528 320 689 320 #arcP
Tt0 f11 664 128 785 128 #arcP
Tt0 f13 inParamDecl '<Number templateId> param;' #txt
Tt0 f13 inParamTable 'out.templateId=param.templateId;
' #txt
Tt0 f13 outParamDecl '<Integer resultCode> result;' #txt
Tt0 f13 outParamTable 'result.resultCode=in.result.resultCode;
' #txt
Tt0 f13 callSignature DeleteTemplateATrust(Number) #txt
Tt0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>DeleteTemplateATrust(Number)</name>
    </language>
</elementInfo>
' #txt
Tt0 f13 145 305 30 30 -13 17 #rect
Tt0 f13 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f13 bg|bg|-65536 #nodeStyle
Tt0 f7 175 320 320 320 #arcP
>Proto Tt0 .type atrust.connector.atrustsigner.TemplateManagementData #txt
>Proto Tt0 .processKind CALLABLE_SUB #txt
>Proto Tt0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <swimlaneLabel>Template Management</swimlaneLabel>
        <swimlaneLabel>Upload Template</swimlaneLabel>
        <swimlaneLabel>Delete Template</swimlaneLabel>
        <swimlaneLabel>Get Template</swimlaneLabel>
    </language>
    <swimlaneOrientation>false</swimlaneOrientation>
    <swimlaneSize>904</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneType>POOL</swimlaneType>
    <swimlaneType>LANE_IN_POOL</swimlaneType>
    <swimlaneType>LANE_IN_POOL</swimlaneType>
    <swimlaneType>LANE_IN_POOL</swimlaneType>
    <swimlaneSpaceBefore>32</swimlaneSpaceBefore>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
    <swimlaneSpaceBefore>0</swimlaneSpaceBefore>
</elementInfo>
' #txt
>Proto Tt0 0 0 32 24 18 0 #rect
>Proto Tt0 @|BIcon #fIcon
Tt0 f91 mainOut f94 tail #connect
Tt0 f94 head f90 mainIn #connect
Tt0 f3 mainOut f12 tail #connect
Tt0 f12 head f91 mainIn #connect
Tt0 f0 mainOut f6 tail #connect
Tt0 f6 head f4 mainIn #connect
Tt0 f4 mainOut f8 tail #connect
Tt0 f8 head f5 mainIn #connect
Tt0 f103 mainOut f10 tail #connect
Tt0 f10 head f2 mainIn #connect
Tt0 f90 mainOut f11 tail #connect
Tt0 f11 head f1 mainIn #connect
Tt0 f13 mainOut f7 tail #connect
Tt0 f7 head f103 mainIn #connect
