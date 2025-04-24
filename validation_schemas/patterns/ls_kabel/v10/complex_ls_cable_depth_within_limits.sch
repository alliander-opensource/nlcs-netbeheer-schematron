<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="complex-ls-cable-depth-within-limits">
    <rule context="//nlcs:LSkabel[
                   nlcs:Geometry/gml:LineString/@srsDimension = '3' and
                   nlcs:Bovengronds = 'Nee'
                   ]">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="max_depth"
             value="number(keronic:ls-cable-get-max-depth())"/>
        <let name="min_depth"
             value="number(keronic:ls-cable-get-min-depth())"/>
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
                    number(tokenize($pos,' ')[3]) gt $max_depth or
                    number(tokenize($pos,' ')[3]) lt $min_depth
                    ]"/>

       <let name="message"
             value="keronic:get-translation('complex_ls_cable_depth_within_limits')"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle' : $handle,
                    'min_depth' : $min_depth,
                    'max_depth' : $max_depth,
                    'wrong_points' : string-join($positions_with_wrong_depth,', ')
                    }
                    return $map
                    "/>

        <assert id="assert-depth-within-limits" test="empty($positions_with_wrong_depth)">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
