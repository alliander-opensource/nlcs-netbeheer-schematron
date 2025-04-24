<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="structure-ls-cable-has-maaiveld">
    <rule context="//nlcs:LSkabel[
                   nlcs:Geometry/gml:LineString/@srsDimension = '3'
                   ]">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="pos_list"
             value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList), ' ')"/>

        <let name="pos_list_dimension"
             value="nlcs:Geometry/gml:LineString/@srsDimension"/>

        <let name="positions_split"
             value="keronic:split-pos-list-to-posses($pos_list)"/>

        <let name="maaivelden"
             value="//nlcs:Amaaiveld"/>

        <let name="connected_maaiveld_threshold"
             value="keronic:get-connected-maaiveld-threshold()"/>

        <let name="positions_without_maaiveld"
             value="for $pos in $positions_split
                    return $pos[
                    not(some $maaiveld in ($maaivelden) satisfies (keronic:point-connected-to-point-with-threshold(
                    tokenize(normalize-space($pos), ' '),
                    $pos_list_dimension,
                    tokenize(normalize-space($maaiveld/nlcs:Geometry/gml:Point/gml:pos), ' '),
                    $maaiveld/nlcs:Geometry/gml:Point/@srsDimension,
                    $connected_maaiveld_threshold
                    )))
                    ]"/>

       <let name="message"
            value="keronic:get-translation('structure_ls_cable_has_maaiveld')"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle' : $handle,
                    'wrong_points' : string-join($positions_without_maaiveld,', ')
                    }
                    return $map
                    "/>

        <assert id="assert-cable-has-maaiveld" test="empty($positions_without_maaiveld)">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
