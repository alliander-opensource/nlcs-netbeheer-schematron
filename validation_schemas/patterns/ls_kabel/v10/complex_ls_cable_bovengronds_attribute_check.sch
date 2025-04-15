<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="complex-ls-cable-bovengronds-attribute-check">
    <rule context="//nlcs:LSkabel[
                   nlcs:Geometry/gml:LineString/@srsDimension = '3'
                   ]">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="bovengronds"
             value="if (nlcs:Bovengronds = 'Ja') then true() else false() "
             as="xs:boolean"/>

        <let name="pos_list"
             value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList), ' ')"/>
        <let name="pos_list_dimension"
             value="nlcs:Geometry/gml:LineString/@srsDimension"/>

        <let name="pos_list_with_depth"
             value="keronic:pos-list-apply-relative-depth(
                    $pos_list,
                    $pos_list_dimension,
                    //nlcs:Amaaiveld)
                    "/>

        <let name="positions_split"
             value="keronic:split-pos-list-to-posses($pos_list_with_depth)"/>


        <let name="positions_with_wrong_depth"
             value="for $pos in $positions_split
                    return $pos[
                    if ($bovengronds) then (number(tokenize($pos,' ')[3]) gt 0)
                    else (number(tokenize($pos,' ')[3]) le 0)]"/>

       <let name="message"
             value="keronic:get-translation('complex_ls_cable_bovengronds_attribute_check')"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle' : $handle,
                    'Bovengronds' : nlcs:Bovengronds,
                    'wrong_points' : string-join($positions_with_wrong_depth,', ')
                    }
                    return $map
                    "/>

        <assert id="assert-cable-is-bovengronds" test="empty($positions_with_wrong_depth)">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
