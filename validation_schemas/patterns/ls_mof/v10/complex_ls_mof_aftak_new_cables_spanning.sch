<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="complex-ls-mof-aftak-new-cables-spanning">
    <rule context="//nlcs:LSmof[nlcs:Functie = 'AFTAK']">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="statuses_to_check"
             value="keronic:ls-mof-spanning-ls-cable-status-check()"/>

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

        <let name="spanning_1"
             value="$new_ls_cables_connected[position() = 1]/nlcs:Spanningsniveau"/>

        <let name="spanning_2"
             value="$new_ls_cables_connected[position() = 2]/nlcs:Spanningsniveau"/>

        <let name="spanning_3"
             value="$new_ls_cables_connected[position() = 3]/nlcs:Spanningsniveau"/>

        <let name="message"
             value="keronic:get-translation('ls_mof_aftak_new_cables_spanning')"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle_mof' : $handle,
                    'handle_1' : $new_ls_cables_connected[position() = 1]/nlcs:Handle,
                    'handle_2' : $new_ls_cables_connected[position() = 2]/nlcs:Handle,
                    'handle_3' : $new_ls_cables_connected[position() = 3]/nlcs:Handle,
                    'spanning_1' : $spanning_1,
                    'spanning_2' : $spanning_2,
                    'spanning_3' : $spanning_3
                    }
                    return $map
                    "/>

        <let name="required_count"
             value="xs:integer(keronic:ls-mof-new-ls-cable-count())"
             as="xs:integer"/>

        <assert id="assert-complex-aftak-voltage" test="if (count($new_ls_cables_connected) = $required_count)
                      then
                      (($spanning_1 = $spanning_2) and ($spanning_1 = $spanning_3))
                      else
                      true()">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
