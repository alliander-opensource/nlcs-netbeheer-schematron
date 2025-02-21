# Schematron nlcs++ proof of concept
Proof of concept van 5 uitgewerkte nlcs++ validaties

## Description
Deze repository is gemaakt zodat de netbeheerders zelf deze testen kunnen bekijken en uitvoeren

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

## Description
Deze repository is gemaakt zodat de netbeheerders zelf deze testen kunnen bekijken en uitvoeren


## Installation

1. Clone de repository:
    ```bash
    git clone https://github.com/keronic/nlcspp_schematron_poc.git
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
Voor vragen of opmerkingen neem contact op met: [reinier.koffijberg@keronic.com](mailto:reinier.koffijberg@keronic.com).
