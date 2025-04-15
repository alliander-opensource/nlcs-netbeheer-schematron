# Schematron NLCS netbeheer        
Deze repository bevat de versie van de Proof of Concept (PoC) software voor het uitvoeren van inhoudelijke validaties op NLCS++ XML-bestanden.

## Inhoud
- [Introductie](#Introductie)
- [Uitgangspunten](#Uitgangspunten)
- [Validaties](#Validaties)
- [Installatie](#Installatie)
- [Gebruik](#Gebruik)
- [Contact](#Contact)
- [License](#License)

## Introductie
NLCS Netbeheer is een initiatief van diverse netbeheerders, waterbedrijven en Mijnaansluiting.nl om te komen tot een informatiemodel en nadere invulling van NLCS: NLCS++. Het doel is betere uitwisseling van informatie over bestaande, geplande en gerealiseerde infrastructuur.

Onderdeel van de NLCS++ uitwisseling is een XML-bestand met daarin de geometrieën en attributen van de bedrijfsmiddelen (LS Kabel, LS Mof, etc.). Het XSD borgt een valide structuur van het XML-bestand. Echter, voor een inhoudelijke validatie van het XML-bestand was er tot nu toe nog geen oplossing.

In het kader van dit informatiemodel is onderzocht in de vorm van een PoC in hoeverre **Schematron** een rol kan spelen bij de inhoudelijke validaties van de data die in het XML-bestand wordt vastgelegd. Schematron is een op XML gebaseerde technologie voor het **decentraal** en **systeem agnostisch** kunnen uitvoeren van inhoudelijke validaties van XML-bestanden.

Deze repository bevat de resultaten van de PoC, zodat de netbeheerders en andere belanghebbenden zelf testen kunnen bekijken en uitvoeren. 

Doel van de software is om een mogelijkheid te bieden om op **elke plek** (device) **dezelfde** inhoudelijke validaties te kunnen uitvoeren, **die ook voor de netbeheerder worden uitgevoerd**. Schematron **als oplossing** sluit aan bij dit doel, doordat deze systeem agnostisch is

De software in deze repository kan worden beschouwd als de 'motor' om de inhoudelijke validaties te kunnen uitvoeren. **Deze kan worden geïntegreerd naar inzicht van de softwareleverancier**. Verder is er het plan om een centrale service aan te bieden waar een NLCS++ geformatteerd XML-bestand inhoudelijk gevalideerd kan worden: Validatieservice. Deze service zal gebruik gaan maken van dezelfde 'motor' **als die aangeboden wordt om als software in te bouwen**.

## Uitgangspunten
Bij de ontwikkeling van de software zijn de volgende uitgangspunten gehanteerd:

- Testbestanden en inhoudelijke validaties zijn gebaseerd op NLCS++ versie v10 & v11.
- De oplossing is schaalbaar naar meerdere versies.
- De oplossing kan systeem agnostisch en decentraal worden uitgevoerd.
- Het DWG/DXF-bestand is buiten beschouwing gelaten.
- Doelstelling is om de inhoudelijke validaties te uniformeren tussen de netbeheerders.

## Validaties
Om vast te stellen of de Schematron technologie de toekomstige inhoudelijke validaties ondersteunt, zijn de volgende 5 inhoudelijke validaties ontwikkeld:

|Asset type|Type validatie|Validatie omschrijving|
|----------|--------------|----------------------|
|MS Kabel|Topologisch|Controleer of de MS Kabel is verbonden met ten minste twee assets.|
|LS Kabel|Diepte|Controleer of de diepteligging van een LS Kabel correct is geregistreerd.|
|LS Mof|Topologisch + Attributen|Controleer of de bedrijfsspanning van nieuw gelegde LS Kabels overeenkomt met de verbonden.|
|LS Aftakmof|Topologisch + Attributen|Bij 3>1 fase: 3-fase aan één kant, L1,2,3 aan andere kant.|
|E Aarddraad|Topologisch|Controleer of de aarddraad verbonden is met een gebouw.|

Deze controles zijn uitgekozen uit een lijst van validaties die op dit moment binnen de Netbeheerders wordt samengesteld. De keuze voor deze controles is gebaseerd op de technische werking van de regels, die mits bewezen in de PoC, ook gaan werken voor andere validaties van dezelfde technische aard. 
Bijvoorbeeld, een controle of een diepteligging van een LS kabel juist gevalideerd kan worden, levert een technisch bewijs dat we dit ook voor andere kabels kunnen uitvoeren.

N.B. Dat het hier niet om de definitieve inhoudelijke validaties gaat.

Wanneer een inhoudelijke validatie faalt, dan wordt er een omschrijving getoond inclusief de details van de fout. Een overzicht hiervan voor de 5 gerealiseerde inhoudelijke validaties zijn te vinden in [messages.xml](https://github.com/alliander-opensource/nlcs-netbeheer-schematron/blob/main/localization/messages.xml) 

## Installatie

1. Clone de repository:
    ```bash
    git clone https://github.com/alliander-opensource/nlcs-netbeheer-schematron.git
    ```
## Gebruik
Wij gaan ervan uit dat je toegang hebt tot het commando: java in cmd.

1. zorg dat de cmd terminal in de correcte folder zit
```cmd
cd \PATH\TO\REPO
```

2. Een voorbeeld test met parameters.
``` cmd
java -jar schxslt-cli.jar -d source_xmls/v10/poc_passing_structure_validations.xml -s validation_schemas/poc_schema.sch -o report.xml -p "v10_structure" -v
```
- '-d' (required) = de xml die gevalideerd wordt
- '-s' (required) = het schema dat gebruikt wordt
- '-o' (optional) = het rapport dat geproduceerd wordt
- '-p' (IN POC required) = welke fase testen worden gerund
- '-v' (optional)(no args) = of fouten in de terminal worden geprint (verbose)

in de -p parameter wordt aangegeven welke nlcs++ versie gebruikt wordt door een "vX_" prefix aan de fase te geven.

3. alle testen voor v10 (via ./run.bat op Windows)
``` cmd
run source_xmls/v10/poc_passing_structure_validations.xml validation_schemas/poc_schema.sch "v10_structure"
run source_xmls/v10/poc_failing_structure_validations.xml validation_schemas/poc_schema.sch "v10_structure"
run source_xmls/v10/poc_passing_complex_validations.xml validation_schemas/poc_schema.sch "v10_complex"
run source_xmls/v10/poc_failing_complex_validations.xml validation_schemas/poc_schema.sch "v10_complex"
run source_xmls/v10/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "v10_depth_structure"
run source_xmls/v10/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "v10_depth_structure"
run source_xmls/v10/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "v10_depth_complex"
run source_xmls/v10/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "v10_depth_complex"
run source_xmls/v10/poc_depth_example_validations.xml validation_schemas/poc_schema.sch "v10_depth_example"
```

4. alle testen voor v11 (via ./run.bat op Windows)
``` cmd
run source_xmls/v11/poc_passing_structure_validations.xml validation_schemas/poc_schema.sch "v11_structure"
run source_xmls/v11/poc_failing_structure_validations.xml validation_schemas/poc_schema.sch "v11_structure"
run source_xmls/v11/poc_passing_complex_validations.xml validation_schemas/poc_schema.sch "v11_complex"
run source_xmls/v11/poc_failing_complex_validations.xml validation_schemas/poc_schema.sch "v11_complex"
run source_xmls/v11/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "v11_depth_structure"
run source_xmls/v11/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "v11_depth_structure"
run source_xmls/v11/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "v11_depth_complex"
run source_xmls/v11/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "v11_depth_complex"
run source_xmls/v11/poc_depth_example_validations.xml validation_schemas/poc_schema.sch "v11_depth_example"
```

Het resultaat van een inhoudelijke validatie van een **valide** XML-bestand wordt als volgt weergeven in de terminal:
```cmd
[valid] ..\nlcs-netbeheer-schematron\source_xmls\v10\poc_passing_structure_validations.xml
```
Het resultaat van een inhoudelijke validatie van een **invalide** XML-bestand wordt als volgt weergeven in de terminal:
```cmd
[invalid] ..\nlcs-netbeheer-schematron\source_xmls\v10\poc_failing_structure_validations.xml
[invalid] ..\nlcs-netbeheer-schematron\source_xmls\v10\poc_failing_structure_validations.xml failed-assert /Q{NLCSnetbeheer}NLCSnetbeheerType[1]/Q{NLCSnetbeheer}Feature[5]/Q{NLCSnetbeheer}MSkabel[1]
            De kabel heeft een ongeldig aantal verbindingen.
            Handle: 6301
            Huidig aantal verbindingen: 3
            Handles van verbindingen: 62EA, 62EB, 62C7
            Met de status: BESTAAND RESERVE, zou het aantal verbindingen moeten 2 zijn

[invalid] ..\nlcs-netbeheer-schematron\source_xmls\v10\poc_failing_structure_validations.xml failed-assert /Q{NLCSnetbeheer}NLCSnetbeheerType[1]/Q{NLCSnetbeheer}Feature[9]/Q{NLCSnetbeheer}MSkabel[1]
            De kabel heeft een ongeldig aantal verbindingen.
            Handle: 6302
            Huidig aantal verbindingen: 1
            Handles van verbindingen: 62C8
            Met de status: BESTAAND RESERVE, zou het aantal verbindingen moeten 2 zijn
etc.
```
## Contact
Voor vragen of opmerkingen neem contact op met: [ariejohan.vande.werken@alliander.com](mailto:ariejohan.vande.werken@alliander.com).

## License
Copyright 2025 Keronic

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
