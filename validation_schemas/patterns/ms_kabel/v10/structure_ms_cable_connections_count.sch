<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="structure-ms-cable-connections-count">
    <rule context="//nlcs:MSkabel">
        <let name="required_connections_start"
             value="keronic:get-ms-cable-connections-start()"/>

        <let name="required_connections_end"
             value="keronic:get-ms-cable-connections-end()"/>

        <let name="handle"
             value="nlcs:Handle"/>

        <let name="statuses_to_check"
             value="keronic:get-statuses-without-empty-ends()"/>

        <let name="status"
             value="nlcs:Status"/>

        <let name="pos_list"
             value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList), ' ')"/>

        <let name="pos_list_dimension"
             value="nlcs:Geometry/gml:LineString/@srsDimension"/>

        <let name="ms_mof_connections_start"
             value="//nlcs:MSmof[
                    let $point := tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Point/@srsDimension
                    return
                    keronic:line-start-connected-to-point($pos_list, $pos_list_dimension, $point, $dimension)
                    ]"/>

        <let name="ms_station_connections_start"
             value="//nlcs:MSstation[
                    let $area := tokenize(normalize-space(nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Polygon/@srsDimension
                    return
                    keronic:line-start-connected-to-area($pos_list, $pos_list_dimension, $area, $dimension)
                    ]"/>

        <let name="ms_overdrachtspunt_connections_start"
             value="//nlcs:MSoverdrachtspunt[
                    let $point := tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Point/@srsDimension
                    return
                    keronic:line-start-connected-to-point($pos_list, $pos_list_dimension, $point, $dimension)
                    ]"/>

        <let name="ms_mof_connections_end"
             value="//nlcs:MSmof[
                    let $point := tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Point/@srsDimension
                    return
                    keronic:line-end-connected-to-point($pos_list, $pos_list_dimension, $point, $dimension)
                    ]"/>

        <let name="ms_station_connections_end"
             value="//nlcs:MSstation[
                    let $area := tokenize(normalize-space(nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Polygon/@srsDimension
                    return
                    keronic:line-end-connected-to-area($pos_list, $pos_list_dimension, $area, $dimension)
                    ]"/>

        <let name="ms_overdrachtspunt_connections_end"
             value="//nlcs:MSoverdrachtspunt[
                    let $point := tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))
                    return
                    let $dimension :=  nlcs:Geometry/gml:Point/@srsDimension
                    return
                    keronic:line-end-connected-to-point($pos_list, $pos_list_dimension, $point, $dimension)
                    ]"/>

        <let name="total_connections_start_count"
             value="count($ms_mof_connections_start) +
                    count($ms_station_connections_start) +
                    count($ms_overdrachtspunt_connections_start)
                    "/>

          <let name="total_connections_end_count"
             value="count($ms_mof_connections_end) +
                    count($ms_station_connections_end) +
                    count($ms_overdrachtspunt_connections_end)
                    "/>

        <let name="message"
             value="keronic:get-translation('ms_kabel_end_connection_text')"/>

        <let name="placeholders"
             value="let $map := map{
                    'status' : $status,
                    'handle' : $handle,
                    'required_connections' : string(
                    number($required_connections_start) +
                    number($required_connections_end)),
                    'curr_connections' : string($total_connections_start_count + $total_connections_end_count),
                    'connected_handles' : string-join((
                    $ms_mof_connections_start/nlcs:Handle,
                    $ms_overdrachtspunt_connections_start/nlcs:Handle,
                    $ms_station_connections_start/nlcs:Handle,
                    $ms_mof_connections_end/nlcs:Handle,
                    $ms_overdrachtspunt_connections_end/nlcs:Handle,
                    $ms_station_connections_end/nlcs:Handle
                    ), ', ')
                    }
                    return $map
                    "/>

        <assert id="assert-required-connections" test="if (some $status_to_check in ($statuses_to_check) satisfies($status_to_check = $status))
                      then
                      (($total_connections_start_count = number($required_connections_start)) and
                      (($total_connections_end_count = number($required_connections_end))))
                      else
                      true()">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
