[Ivy]
1797F20B0709EDE7 9.3.1 #module
>Proto >Proto Collection #zClass
Tt0 TemplateManagement Big #zClass
Tt0 B #cInfo
Tt0 #process
Tt0 @AnnotationInP-0n ai ai #zField
Tt0 @TextInP .type .type #zField
Tt0 @TextInP .processKind .processKind #zField
Tt0 @TextInP .xml .xml #zField
Tt0 @TextInP .responsibility .responsibility #zField
Tt0 @EndSub f5 '' #zField
Tt0 @StartSub f3 '' #zField
Tt0 @EndSub f4 '' #zField
Tt0 @GridStep f91 '' #zField
Tt0 @WSElement f103 '' #zField
Tt0 @StartSub f13 '' #zField
Tt0 @EndSub f6 '' #zField
Tt0 @WSElement f7 '' #zField
Tt0 @StartSub f8 '' #zField
Tt0 @WSElement f90 '' #zField
Tt0 @PushWFArc f9 '' #zField
Tt0 @PushWFArc f12 '' #zField
Tt0 @PushWFArc f10 '' #zField
Tt0 @PushWFArc f94 '' #zField
Tt0 @PushWFArc f11 '' #zField
Tt0 @PushWFArc f14 '' #zField
Tt0 @PushWFArc f15 '' #zField
Tt0 @ErrorBoundaryEvent f0 '' #zField
Tt0 @PushWFArc f1 '' #zField
Tt0 @ErrorBoundaryEvent f2 '' #zField
Tt0 @PushWFArc f16 '' #zField
Tt0 @ErrorBoundaryEvent f17 '' #zField
Tt0 @PushWFArc f18 '' #zField
>Proto Tt0 Tt0 TemplateManagement #zField
Tt0 f5 529 497 30 30 0 15 #rect
Tt0 f5 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f5 bg|bg|-65536 #nodeStyle
Tt0 f3 inParamDecl '<File templateFile> param;' #txt
Tt0 f3 inParamTable 'out.myIvyFile=param.templateFile;
' #txt
Tt0 f3 outParamDecl '<com.axonivy.connector.atrust.bo.TemplateData templateData> result;' #txt
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
Tt0 f3 81 113 30 30 -13 17 #rect
Tt0 f3 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f3 bg|bg|-65536 #nodeStyle
Tt0 f4 625 305 30 30 0 15 #rect
Tt0 f4 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f4 bg|bg|-65536 #nodeStyle
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
Tt0 f91 256 106 128 44 -42 -16 #rect
Tt0 f103 actionTable 'out=in;
out.result.resultCode=wsResponse;
' #txt
Tt0 f103 clientId 1797F21DA09F10E5 #txt
Tt0 f103 port HttpsEndpoint #txt
Tt0 f103 operation DeleteTemplate #txt
Tt0 f103 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.sigTemplateId=in.templateId;
' #txt
Tt0 f103 exceptionHandler com:axonivy:connector:atrust:template:delete:exception #txt
Tt0 f103 beanConfig "" #txt
Tt0 f103 timeout 0 #txt
Tt0 f103 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Delete Template on HandySignatur</name>
    </language>
</elementInfo>
' #txt
Tt0 f103 256 298 208 44 -96 -8 #rect
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
Tt0 f13 81 305 30 30 -13 17 #rect
Tt0 f13 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f13 bg|bg|-65536 #nodeStyle
Tt0 f6 721 113 30 30 0 15 #rect
Tt0 f6 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f6 bg|bg|-65536 #nodeStyle
Tt0 f7 actionTable 'out=in;
out.result.listTemplates=wsResponse.list;
out.result.resultCode=wsResponse.listTemplateResult;
' #txt
Tt0 f7 clientId 1797F21DA09F10E5 #txt
Tt0 f7 port HttpsEndpoint #txt
Tt0 f7 operation ListTemplate #txt
Tt0 f7 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
' #txt
Tt0 f7 exceptionHandler com:axonivy:connector:atrust:template:getall:exception #txt
Tt0 f7 beanConfig "" #txt
Tt0 f7 timeout 0 #txt
Tt0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get List Template</name>
    </language>
</elementInfo>
' #txt
Tt0 f7 224 490 112 44 -48 -8 #rect
Tt0 f8 inParamDecl '<> param;' #txt
Tt0 f8 outParamDecl '<com.axonivy.connector.atrust.bo.TemplateData templateData> result;' #txt
Tt0 f8 outParamTable 'result.templateData=in.result;
' #txt
Tt0 f8 callSignature GetListTemplate() #txt
Tt0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>GetListTemplate()</name>
    </language>
</elementInfo>
' #txt
Tt0 f8 81 497 30 30 -13 17 #rect
Tt0 f8 res:/webContent/icons/atrust-icon.png?small #fDecoratorIcon
Tt0 f8 bg|bg|-65536 #nodeStyle
Tt0 f90 actionTable 'out=in;
out.result.resultCode=wsResponse.uploadTemplateResult;
out.result.sigTemplateId=wsResponse.sigTemplateId;
' #txt
Tt0 f90 clientId 1797F21DA09F10E5 #txt
Tt0 f90 port HttpsEndpoint #txt
Tt0 f90 operation UploadTemplate #txt
Tt0 f90 inputParams 'parameters.aPIKey=ivy.var.ATrust_APIKey;
parameters.templateData=in.documentByteArray;
' #txt
Tt0 f90 exceptionHandler com:axonivy:connector:atrust:template:add:exception #txt
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
Tt0 f90 472 106 128 44 -41 -16 #rect
Tt0 f9 336 512 529 512 #arcP
Tt0 f12 111 128 256 128 #arcP
Tt0 f10 464 320 625 320 #arcP
Tt0 f94 expr out #txt
Tt0 f94 384 128 472 128 #arcP
Tt0 f11 111 320 256 320 #arcP
Tt0 f14 111 512 224 512 #arcP
Tt0 f15 600 128 721 128 #arcP
Tt0 f0 actionTable 'out=in;
' #txt
Tt0 f0 errorCode com:axonivy:connector:atrust:template:add:exception #txt
Tt0 f0 attachedToRef 1797F20B0709EDE7-f90 #txt
Tt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>com:axonivy:connector:atrust:template:add:exception</name>
    </language>
</elementInfo>
' #txt
Tt0 f0 561 145 30 30 0 15 #rect
Tt0 f1 591 160 736 143 #arcP
Tt0 f1 1 736 160 #addKink
Tt0 f1 0 0.621866186531533 0 0 #arcLabel
Tt0 f2 actionTable 'out=in;
' #txt
Tt0 f2 errorCode com:axonivy:connector:atrust:template:delete:exception #txt
Tt0 f2 attachedToRef 1797F20B0709EDE7-f103 #txt
Tt0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>com:axonivy:connector:atrust:template:delete:exception</name>
    </language>
</elementInfo>
' #txt
Tt0 f2 425 337 30 30 0 15 #rect
Tt0 f16 455 352 640 335 #arcP
Tt0 f16 1 640 352 #addKink
Tt0 f16 0 0.5955167407949854 0 0 #arcLabel
Tt0 f17 actionTable 'out=in;
' #txt
Tt0 f17 errorCode com:axonivy:connector:atrust:template:getall:exception #txt
Tt0 f17 attachedToRef 1797F20B0709EDE7-f7 #txt
Tt0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>com:axonivy:connector:atrust:template:getall:exception</name>
    </language>
</elementInfo>
' #txt
Tt0 f17 297 529 30 30 0 15 #rect
Tt0 f18 327 544 544 527 #arcP
Tt0 f18 1 544 544 #addKink
Tt0 f18 0 0.5814313227975682 0 0 #arcLabel
>Proto Tt0 .type com.axonivy.connector.atrust.TemplateManagementData #txt
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
    <swimlaneSize>576</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneSize>192</swimlaneSize>
    <swimlaneColor gradient="false">-1</swimlaneColor>
    <swimlaneColor gradient="false">-3342337</swimlaneColor>
    <swimlaneColor gradient="false">-3342388</swimlaneColor>
    <swimlaneColor gradient="false">-3342337</swimlaneColor>
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
Tt0 f8 mainOut f14 tail #connect
Tt0 f14 head f7 mainIn #connect
Tt0 f7 mainOut f9 tail #connect
Tt0 f9 head f5 mainIn #connect
Tt0 f103 mainOut f10 tail #connect
Tt0 f10 head f4 mainIn #connect
Tt0 f90 mainOut f15 tail #connect
Tt0 f15 head f6 mainIn #connect
Tt0 f13 mainOut f11 tail #connect
Tt0 f11 head f103 mainIn #connect
Tt0 f0 mainOut f1 tail #connect
Tt0 f1 head f6 mainIn #connect
Tt0 f2 mainOut f16 tail #connect
Tt0 f16 head f4 mainIn #connect
Tt0 f17 mainOut f18 tail #connect
Tt0 f18 head f5 mainIn #connect
