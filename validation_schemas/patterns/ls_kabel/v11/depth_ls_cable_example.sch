<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-ls-cable-depth-example">
    <rule context="//nlcs:LSkabel">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="pos_list"
             value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList), ' ')"/>

        <let name="pos_list_dimension"
             value="nlcs:Geometry/gml:LineString/@srsDimension"/>

        <let name="pos_list_with_depth"
             value="keronic:pos-list-apply-relative-depth(
                    $pos_list,
                    $pos_list_dimension,
                    //nlcs:Amaaiveldhoogte)
                    "/>

        <let name="ls_mof_connected"
             value="//nlcs:LSmof[
                    let $pos := tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))
                    return
                    let $pos_dimension := nlcs:Geometry/gml:Point/@srsDimension
                    return
                    let $pos_with_depth := keronic:point-apply-relative-depth(
                    $pos,
                    $pos_dimension,
                    //nlcs:Amaaiveldhoogte)
                    return
                    keronic:point-connected-to-line($pos_with_depth, $pos_dimension, $pos_list_with_depth, $pos_list_dimension)
                    ]"/>

        <!-- <let name="message" -->
        <!--      value="keronic:get-translation('ls_mof_aftak_new_cables_count')"/> -->

        <!-- <let name="placeholders" -->
        <!--      value="let $map := map{ -->
        <!--             'handle_mof' : $handle, -->
        <!--             'required_connections' : $required_count, -->
        <!--             'curr_count' : $new_cables_count, -->
        <!--             'connected_handles' : string-join($new_ls_cables_connected/nlcs:Handle, ', ') -->
        <!--             } -->
        <!--             return $map -->
        <!--             "/> -->

        <assert id="assert-ignore" test="false()">
            kabel : <value-of select="$handle"/> is connected to:
            mof: <value-of select="$ls_mof_connected/nlcs:Handle"/>
        </assert>
    </rule>
</pattern>
