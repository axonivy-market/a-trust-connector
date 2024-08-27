[A-Trust](https://www.a-trust.at) ist ein österreichisches Unternehmen, das elektronische Services, wie digitale Signaturen und Zertifikate, anbietet,
um eine sichere Online-Kommunikation zu gewährleisten. Die **Signaturbox** von A-Trust ist eine Lösung für digitale Signaturen, mit der 
Benutzer Dokumente sicher digital signieren können, um Authentizität (**Wer** signiert) und Integrität (**Was** wird signiert) zu gewährleisten.

- Basiert auf REST Web Service Technologien.
- Signiert PDFs.
- Unterstützt dich mit einer  Demo-Implementierung, um deinen Integrationsaufwand zu reduzieren.
- Ermöglicht es low code citizen developers bestehende Geschäftsprozesse mit Handy-Signaturfunktionen zu erweitern.

Für die Nutzung von A-Trust benötigst Du einen Account, den Dir https://www.a-trust.at/de/produkte/qualifizierte_signaturservices/xidentity/ erstellt.


## Demo

1. Start the **A-Trust HandySignatur Example** process.
2. Prepare data for signing
    * Upload a **PDF** document.
    * Select your signature template.
    * Enter location, reason, and sign stamp coordinates x, y, and w if you would like to beautify it.
 
    ![demo-process](images/atrust-upload-doc.png)

2. Start signing document

   There are have 2 options:
   
   1.  Signature Document: redirect user to ATrust-HandySignature page, and then user can sign the    document! To prevent "Block Popup" feature of web browser, after click on Signature Document button, a new button will be appear and you can click on it to sign.
   2.  Sign Document in Frame: an Frame will appear and allow user login to ATrust, then user can stay here and sign the doc!

   Let's try with IFrame option, click on **Sign Document in Frame** and a popup will appear and let user login to **ATrust HandySignature** page

    - Log in with your mobile phone signature certificate.
      ![atrust-signature](images/atrust-handysign-login.png)
   
   - Check notification on your phone, and follow up the **A-Trust** guide to add your signature to doc.

3. After signed, a new document will be added to your case with the prefix ***SIGNED_***

   ![atrust-signature-finished](images/atrust-handysign-finished.png)

4. You can download and open **Adobe PDF** to see your signature at bottom of doc.

   ![atrust-doc-signed](images/atrust-doc-signed.png)

The **ATrustDemo** process contains a final service part, where we prepared a signature template on the **A-Trust** server.

   ![atrust-demo-feature](images/atrust-demo-feature.png)

* You need to upload a **SignatureTemplate** to the **[A-Trust](https://www.a-trust.at)** service. Uses `AddTemplateATrust` start in the `ATrustDemo` process of `a-trust-connector-demo` project.

   When uploading successfully, **A-Trust** returns `templateID` and sets it in project Variables - `TemplateId` value in the `Configuration/variables.yaml`.

* An example **SignatureTemplate** in CMS: `cms/Templates/tempsiegel1`.



## Setup

Before any signing interactions between the **Axon Ivy Engine** and the **A-Trust HandySignatur** services can be run, they have to be introduced to each other. This can be done as follows:

1. Register an **A-Trust HandySignatur** account: https://www.a-trust.at/en/handy-signatur/handy-signatur-activation/

2. Create an **A-Trust Signatur-Box** **[here](https://www.a-trust.at/en/handy-signatur/signaturbox)** and then get a new `API key` with the `ServerUrl` and `SignBox`.

3. Open the `Configuration/variables.yaml` in your Designer and paste the below code with your `APIKey`, `TemplateId`, `ServerUrl` and `SignBox`

   ```
   Variables:
      ATrust:
           # API Key for "A-Trust Handysignature API"
           APIKey: ''
           # The Server URL under which the SigBox Server is reachable
           ServerUrl: ''
           # The SignBox belong to your ATrust server
           SignBox: ''
           # The default signature template ID to be used
           TemplateId: 0
   ```

4. Save the changed settings.


### Prerequisites:

* Working **A-TRUST** `API Key` (set in the variable) - Needed to call **REST API** services.
* You will also get the correct `ServerUrl` and `SignBox` from **A-TRUST** when checking their website!
* You need to upload a **SignatureTemplate** to the **[A-Trust](https://www.a-trust.at)** service before calling **ATrust/StartSignature**.
* Check the latest API description on the **[A-Trust](https://www.a-trust.at)** web page.
