#Axon Efeus [Ein-Hoff](https://www.a-trust.at) Anschluss hilft du zu
beschleunigen Arbeitsgang Automatisierung Initiativen integrieren mal
**#Ein-Hoffen HandySignatur** hinein euren Arbeitsgang Antrag innerhalb keine
Zeit. **Ein-Trust** mit die Mobiltelefon Unterschrift, du kannst deutlich
beglaubigen #du auf dem Internet. Es ist eure persönliche Unterschrift auf das
#netto, #welche ist gleichwertig zu der handgeschriebenen Unterschrift bei
Gesetz. Dieser Anschluss:

*   Ist gegründet weiter **RUHEN API** Technologien.
*   Versieht Zugang zu die Innenteil Charakterzüge von **#Ein-Trust** zu
    eigentlich signiert PDFs.
*   Unterstützt du mit ein leichtes-zu-Kopie Demo Ausführung zu heruntersetzen
    eure Integration Anstrengung.
*   Aktiviert niederen Code Bürger Entwickler zu erweitern existieren
    dienstliche Arbeitsgänge mit Mobiltelefon Unterschrift Charakterzüge.

Zu benutzen Ein-Trust, du brauchst ein Konto jener du schaffst an
https://www.Ein-hoff.An/de/produkte/qualifizierte_signaturservices/xidentity/.



## Demo

1. Starte das **Ein-Hoffen HandySignatur Beispiel** Arbeitsgang.
2. Bereite vor #Daten für signieren
    * #Hochladen ein **#PDF** Dokument.
    * Wähl aus eure Unterschrift Vorlage.
    * Betritt Drehort, Grund, und Indiz Briefmarke Koordinaten x, y, und w ob du
      wolltest mögen zu verschönern ihm.

   ![Demo-verarbeite](images/atrust-upload-doc.png)

2. Start #Unterschrift Dokument

   Dort haben 2 Optionen:

   1.  Unterschrift Dokument: Leite um Nutzer zu ATrust-HandySignature Seite,
       und dann kann Nutzer signieren das Dokument! Zu #zurückhalten "Blocken
       Popup" Charakterzug von Web Browser, nach Klick auf Unterschrift Dokument
       Knopf, ein neuer Knopf will sein fungieren und du kannst klicken auf ihm
       zu signieren.
   2.  Indiz Dokument in Rahm ein: Ein Rahmen will fungieren und erlauben Nutzer
       Anmeldung zu ATrust, dann kann Nutzer bleiben hier und signieren der doc!

   Lass uns probieren mit IFrame Option, Klick weiter **Indiz Dokument in
   Rahmen** und ein popup will fungieren und gelassen Nutzer Anmeldung zu
   **ATrust HandySignature** Seite

    - Log herein mit eure Mobiltelefon Unterschrift Urkunde.
      ![atrust-Unterschrift](images/atrust-handysign-login.png)

   - Kontrolle Mitteilung auf eurem Telefon, und folgen hin dem **Einem-Trust**
     steuert zu zufügen eure Unterschrift zu doc.

3. #Nachdem signiert, ein neues Dokument will sein zugefügt zu eurem Fall mit
   der Vorsilbe **SIGNIERT_**

   ![atrust-Unterschrift-fertig](images/atrust-handysign-finished.png)

4. Du können herunterladen und offen **Adobe #PDF** zu sehen #genau besehen eure
   Unterschrift von doc.

   ![atrust-doc-#Mit Vorzeichen versehen](images/atrust-doc-signed.png)

Das **ATrustDemo** #verarbeiten zügelt eine endgültige Bedienung Teil, #wo
bereiteten vor wir eine Unterschrift Vorlage weiter die **Eine-Trust** Server.

![atrust-Demo-biete](images/atrust-demo-feature.png)

* Du brauchst zu #hochladen ein **SignatureTemplate** zu das
  **[Ein-Hoff](https://www.a-trust.at)** Bedienung. Nutzungen
  `AddTemplateATrust` starten herein die `ATrustDemo` Arbeitsgang von
  `einen-Trust-Anschluss-Demo` Projekt.

  Wann #hochladen erfolgreich, **Ein-Trust** Rückgaben `templateID` und setzen
  es herein projizieren Variablen - `TemplateId` schätzen herein die
  `Konfiguration/Variablen.yaml`.

* Ein Beispiel **SignatureTemplate** herein CMS: `cms/Vorlagen/tempsiegel1`.

## Einrichtung

Vor irgendwelche #Unterschrift Interaktionen zwischen die **#Axon Efeu Motor**
und der **Ein-Hoffen HandySignatur** Bedienungen können sein gerannt, sie müssen
sein hereingebracht zu #jede #andere. Dies kann sein getan folgendermaßen:

1. Melde an ein **Ein-Hoffen HandySignatur** Konto:
   Https://www.Ein-hoff.An/en/praktisch-signatur/praktisch-signatur-#Nutzbarmachung/

2. Schaff ein **Ein-Hoffen Signatur-Schachteln**
   **[hier](https://www.a-trust.at/en/handy-signatur/signaturbox)** und dann
   bekommen ein neues `API Schlüssel` mit den `ServerUrl` und `SignBox`.

3. Öffne das `Konfiguration/Variablen.yaml` In eurem Designer und #bekleben dem
   unterhalb Code mit eure `APIKey`, `TemplateId`, `ServerUrl` und `SignBox`

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

        # To config the Handy-Signature view in iframe. The Details can be found on the A-Trust Website https://labs.a-trust.at/developer/Handy-Signatur.aspx.
        HandySignaturParameter:
          # For setting width of frame.
          Width: 350
          # For setting height of frame.
          Height: 350
          # For setting background color of frame.
          BackgroundColor: 0
          # For setting phone number of frame.
          PhoneNumber: 0
   ```

4. Speicher die #abgeändert Lagen.

### Voraussetzungen:

* Arbeitend **Ein-TRUST** `API Schlüssel` (Apparat in das variables) - Gebraucht
  zu rufen **RUHT API** Bedienungen.
* Du willst auch das richtiges bekommen `ServerUrl` und `SignBox` von
  **Ein-TRUST** #wann überprüfend ihre Website!
* Du brauchst zu #hochladen ein **SignatureTemplate** zu das
  **[Ein-Hoff](https://www.a-trust.at)** Bedienung vor rufen
  **ATrust/StartSignature**.
* Überprüf das spätestes API Steckbrief weiter den
  **[Einen-Hoff](https://www.a-trust.at)** Web-Seite.

### #Errichtet-in Komponente für IFrame #Unterschrift

Das Ein-Trust Anschluss versieht ein pre-#errichtet JSF Komponente
(`ATrustSignInFrame`) jener aktiviert nahtlose Integration von Eine-Hofft
HandySignatur Funktionalität direkt innerhalb euren #Axon Efeu Antrag benutzend
einen #eingraben iframe. Diese Komponente merzt die Notwendigkeit für popup
Fenster und versehen eine More integrativ Nutzer Erfahrung.

#### Komponente Überblick

Das `ATrustSignInFrame` Komponente #abkapseln das vollständige #Unterschrift
workflow innerhalb euren Antrags UI, bedienend den Authentifizierung
Arbeitsgang, Dokument #Unterschrift, und Resultat verarbeitend automatisch.

#### Integration Stufen

1. **Fügt zu die Komponente zu eure JSF Seite**

   Schließ ein herein die Komponente eure XHTML Datei benutzend die folgende
   Syntax:

   ```xhtml
   <ic:com.axonivy.connector.atrust.ATrustSignInFrame
      signatureJob="#{data.signatureJob}"
      addDocToCase="true"
      disableSignButton="#{data.disableSignButton}"
      signDialogHeader="Document Signing"
      signButtonIcon="si si-pen-2"
      signButtonLabel="Sign Document"
      signButtonStyleClass="btn btn-primary"
      onSignatureFinishedListener="#{logic.onSignFinished()}"
      componentToUpdate="form" />
   ```

#### Komponente Attribute

| Attribut                      | Typ                | Bedürft | Steckbrief                                                                                                             |
| ----------------------------- | ------------------ | ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `signatureJob`                | `SignatureJob`     | Ja      | Der Unterschrift Beruf Objekt zügelnd dokumentiert und signierend Parameter                                            |
| `addDocToCase`                | `Aussagenlogisch`  | #Nr     | Wann `wahr`, automatisch fügt zu das #mit Vorzeichen versehen Dokument zu dem gängigen Fall (#voreinstellen: `Falsch`) |
| `disableSignButton`           | `Aussagenlogisch`  | #Nr     | Reguliert den bereiten Staat von den Indiz Knopf (#voreinstellen: `Falsch`)                                            |
| `signDialogHeader`            | `Schnur`           | #Nr     | #Benutzerdefiniert Kopfball Text für das #Unterschrift Zwiegespräch                                                    |
| `signButtonIcon`              | `Schnur`           | #Nr     | CSS Klasse für die Knopf Ikone (unterstützt [#Windschlüpfig machen Ikonen](https://streamlineicons.com/))              |
| `signButtonLabel`             | `Schnur`           | #Nr     | Text Etikett für den Indiz Knopf (#voreinstellen: "Indiz")                                                             |
| `signButtonStyleClass`        | `Schnur`           | #Nr     | Zuzüglich CSS Klassen für Knopf Styling                                                                                |
| `onSignatureFinishedListener` | `MethodExpression` | #Nr     | Rückruf Methode exekutiert nach erfolgreich #Unterschrift                                                              |
| `componentToUpdate`           | `Schnur`           | #Nr     | ID Von der Komponente zu verbessern nach signieren Abschluss                                                           |
