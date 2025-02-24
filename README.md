# Schematron nlcs++ proof of concept
Proof of concept van 5 uitgewerkte nlcs++ validaties

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)
- [License](#license)

## Description
Deze repository is gemaakt zodat de netbeheerders zelf deze testen kunnen bekijken en uitvoeren


## Installation

1. Clone de repository:
    ```bash
    git clone https://github.com/alliander-opensource/nlcs-netbeheer-schematron.git
    ```
## Usage
Wij gaan ervan uit dat je toegang hebt tot het commando: java in cmd.

1. zorg dat de cmd terminal in de correcte folder zit
```cmd
cd \PATH\TO\REPO
```

2. Een voorbeeld test met parameters.
``` cmd
java -jar schxslt-cli.jar -d source_xmls/poc_passing_structure_validations.xml -s validation_schemas/poc_schema.sch -o report.xml -p "structure" -v
```
- '-d' (required) = de xml die gevalideerd wordt
- '-s' (required) = het schema dat gebruikt wordt
- '-o' (optional) = het rapport dat geproduceerd wordt
- '-p' (IN POC required) = welke fase testen worden gerund
- '-v' (optional)(no args) = of fouten in de terminal worden geprint (verbose)

3. alle verschillende testen (via ./run.bat op Windows)
``` cmd
run source_xmls/poc_passing_structure_validations.xml validation_schemas/poc_schema.sch "structure"
run source_xmls/poc_failing_structure_validations.xml validation_schemas/poc_schema.sch "structure"
run source_xmls/poc_passing_complex_validations.xml validation_schemas/poc_schema.sch "complex"
run source_xmls/poc_failing_complex_validations.xml validation_schemas/poc_schema.sch "complex"
run source_xmls/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "depth_structure"
run source_xmls/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "depth_structure"
run source_xmls/poc_passing_depth_validations.xml validation_schemas/poc_schema.sch "depth_complex"
run source_xmls/poc_failing_depth_validations.xml validation_schemas/poc_schema.sch "depth_complex"
run source_xmls/poc_depth_example_validations.xml validation_schemas/poc_schema.sch "depth_example"
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
