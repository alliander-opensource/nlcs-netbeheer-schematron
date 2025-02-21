<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="structure-e-aarddraad-buildings-connected-count">
    <rule context="//nlcs:Eaarddraad">
        <let name="handle"
             value="nlcs:Handle"/>

        <let name="pos"
             value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList), ' ')"/>

        <let name="pos_dimension"
             value="nlcs:Geometry/gml:LineString/@srsDimension"/>

        <let name="ls_kasten_connected"
             value="//nlcs:LSkast[
                    let $pos_list := tokenize(normalize-space(
                    nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))
                    return
                    let $pos_list_dimensions := nlcs:Geometry/gml:Polygon/@srsDimension
                    return
                    keronic:line-connected-to-area($pos, $pos_dimension, $pos_list, $pos_list_dimensions)
                    ]"/>

        <let name="ms_stations_connected"
             value="//nlcs:MSstation[
                    let $pos_list := tokenize(normalize-space(
                    nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))
                    return
                    let $pos_list_dimensions := nlcs:Geometry/gml:Polygon/@srsDimension
                    return
                    keronic:line-connected-to-area($pos, $pos_dimension, $pos_list, $pos_list_dimensions)
                    ]"/>

        <let name="message"
             value="keronic:get-translation('e_aarddraad_connected_buildings')"/>

        <let name="required_count"
             value="xs:integer(keronic:e-aarddraad-connected-buildings-count())"
             as="xs:integer"/>

        <let name="total_connected"
             value="count($ls_kasten_connected) + count($ms_stations_connected)"
             as="xs:integer"/>

        <let name="placeholders"
             value="let $map := map{
                    'handle_mof' : $handle,
                    'curr_count' : $total_connected,
                    'required_connections' : $required_count,
                    'connected_handles' : string-join((
                    $ls_kasten_connected/nlcs:Handle,
                    $ms_stations_connected/nlcs:Handle
                    ), ', ')
                    }
                    return $map
                    "/>

        <assert test="$total_connected  = $required_count">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
