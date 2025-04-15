<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
	    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
	    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	    xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">


    <!-- schematron namespace declarations -->
    <ns prefix="keronic" uri = "http://example.com/my-functions"/>
    <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    <ns prefix="nlcs" uri="NLCSnetbeheer"/>

    <phase id="v10_depth_example">
        <active pattern="ls-cable-depth-example"/>
    </phase>

    <phase id="v10_depth_structure">
        <active pattern="structure-ls-cable-has-maaiveld"/>
    </phase>

    <phase id="v10_depth_complex">
        <active pattern="complex-ls-cable-depth-within-limits"/>
        <active pattern="complex-ls-cable-bovengronds-attribute-check"/>
    </phase>

    <phase id="v10_structure">
        <active pattern="structure-ls-mof-aftak-new-cables-count"/>
        <active pattern="structure-ls-mof-phase-cables-connected-count"/>
        <active pattern="structure-e-aarddraad-buildings-connected-count"/>
        <active pattern="structure-ms-cable-connections-count"/>
    </phase>

    <phase id="v10_complex">
        <active pattern="complex-ls-mof-aftak-new-cables-spanning"/>
        <active pattern="complex-ls-mof-phase-cables-connected-phase"/>
    </phase>

    <phase id="v11_depth_example">
        <active pattern="v11-ls-cable-depth-example"/>
    </phase>

    <phase id="v11_depth_structure">
        <active pattern="v11-structure-ls-cable-has-maaiveld"/>
    </phase>

    <phase id="v11_depth_complex">
        <active pattern="v11-complex-ls-cable-depth-within-limits"/>
        <active pattern="v11-complex-ls-cable-bovengronds-attribute-check"/>
    </phase>

    <phase id="v11_structure">
        <active pattern="structure-ls-mof-aftak-new-cables-count"/>
        <active pattern="v11-structure-ls-mof-phase-cables-connected-count"/>
        <active pattern="structure-e-aarddraad-buildings-connected-count"/>
        <active pattern="v11-structure-ms-cable-connections-count"/>
    </phase>

    <phase id="v11_complex">
        <active pattern="v11-complex-ls-mof-aftak-new-cables-spanning"/>
        <active pattern="complex-ls-mof-phase-cables-connected-phase"/>
    </phase>

    <!-- xsl functions -->
    <xsl:include href="xsl_functions/global_functions/config_functions.xsl"/>
    <xsl:include href="xsl_functions/helper_functions/helper_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_interface_functions.xsl"/>

    <!-- schematron patterns -->

    <!-- eaarddraad patterns-->
    <include href="patterns/e_aarddraad/v10/structure_e_aarddraad_buildings_connected_count.sch"/>
    <!-- mskabel patterns -->
    <include href="patterns/ms_kabel/v10/structure_ms_cable_connections_count.sch"/>
    <!-- lskabel patterns -->
    <include href="patterns/ls_kabel/v10/depth_ls_cable_example.sch"/>
    <include href="patterns/ls_kabel/v10/complex_ls_cable_depth_within_limits.sch"/>
    <include href="patterns/ls_kabel/v10/structure_ls_cable_has_maaiveld.sch"/>
    <include href="patterns/ls_kabel/v10/complex_ls_cable_bovengronds_attribute_check.sch"/>
    <include href="patterns/ls_kabel/v11/depth_ls_cable_example.sch"/>
    <include href="patterns/ls_kabel/v11/complex_ls_cable_depth_within_limits.sch"/>
    <include href="patterns/ls_kabel/v11/structure_ls_cable_has_maaiveld.sch"/>
    <include href="patterns/ls_kabel/v11/complex_ls_cable_bovengronds_attribute_check.sch"/>
    <!-- lsmof patterns -->
    <include href="patterns/ls_mof/v10/complex_ls_mof_aftak_new_cables_spanning.sch"/>
    <include href="patterns/ls_mof/v10/complex_ls_mof_phase_cables_connected_phases.sch"/>
    <include href="patterns/ls_mof/v10/structure_ls_mof_phase_cables_connected_count.sch"/>
    <include href="patterns/ls_mof/v10/structure_ls_mof_aftak_new_cables_count.sch"/>
    <include href="patterns/ls_mof/v11/complex_ls_mof_aftak_new_cables_spanning.sch"/>
    <include href="patterns/ls_mof/v11/complex_ls_mof_phase_cables_connected_phases.sch"/>
    <include href="patterns/ls_mof/v11/structure_ls_mof_phase_cables_connected_count.sch"/>
    <include href="patterns/ls_mof/v11/structure_ls_mof_aftak_new_cables_count.sch"/>
    <!-- mskabel patterns -->
    <include href="patterns/ms_kabel/v10/structure_ms_cable_connections_count.sch"/>
  </schema>
