<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="structure-ls-mof-aftak-new-cables-count">
    <rule context="//nlcs:LSmof[nlcs:Functie = 'AFTAK']">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="statuses_to_check"
             value="keronic:ls-mof-spanning-ls-cable-status-check()"/>

        <let name="required_count"
             value="keronic:ls-mof-new-ls-cable-count()"/>

        <let name="pos"
             value="tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos), ' ')"/>

        <let name="pos_dimension"
             value="nlcs:Geometry/gml:Point/@srsDimension"/>


        <let name="new_ls_cables_connected"
             value="//nlcs:LSkabel[
                    let $pos_list := tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))
                    return
                    let $pos_list_dimensions := nlcs:Geometry/gml:LineString/@srsDimension
                    return
                    (some $status_to_check in ($statuses_to_check) satisfies($status_to_check = nlcs:Status))
                    and
                    keronic:point-connected-to-line($pos, $pos_dimension, $pos_list, $pos_list_dimensions)
                    ]"/>

        <let name="new_cables_count"
             value="count($new_ls_cables_connected)"/>

        <let name="message"
             value="keronic:get-translation('ls_mof_aftak_new_cables_count')"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle_mof' : $handle,
                    'required_connections' : $required_count,
                    'curr_count' : $new_cables_count,
                    'connected_handles' : string-join($new_ls_cables_connected/nlcs:Handle, ', ')
                    }
                    return $map
                    "/>

        <assert test="$new_cables_count = xs:integer($required_count) or $new_cables_count = 0">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
