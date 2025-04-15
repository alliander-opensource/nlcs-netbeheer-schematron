<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-structure-ls-mof-phase-cables-connected-count">
    <rule context="//nlcs:LSmof[nlcs:Functie = 'OVERGANG']">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="statuses_to_check"
             value="keronic:ls-mof-phase-ls-cable-status-check()"/>

        <let name="pos"
             value="tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos), ' ')"/>

        <let name="pos_dimension"
             value="nlcs:Geometry/gml:Point/@srsDimension"/>

        <let name="ls_cables_connected"
             value="//nlcs:LSkabel[
                    let $pos_list := tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))
                    return
                    let $pos_list_dimensions := nlcs:Geometry/gml:LineString/@srsDimension
                    return
                    (some $status_to_check in ($statuses_to_check) satisfies($status_to_check = nlcs:Status))
                    and
                    keronic:point-connected-to-line($pos, $pos_dimension, $pos_list, $pos_list_dimensions)
                    ]"/>

        <let name="message"
             value="keronic:get-translation('ls_mof_phase_connected_cables_count')"/>

        <let name="required_count"
             value="xs:integer(keronic:ls-mof-phase-ls-cable-required-count())"
             as="xs:integer"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle_mof' : $handle,
                    'curr_count' : count($ls_cables_connected),
                    'required_connections' : $required_count,
                    'checked_statuses' : string-join($statuses_to_check, ', '),
                    'connected_handles' : string-join($ls_cables_connected/nlcs:Handle, ', ')
                    }
                    return $map
                    "/>

        <assert id="assert-structure-phase-connected-cable-count"  test="(count($ls_cables_connected) = $required_count) or
                      (count($ls_cables_connected) = 0)">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
