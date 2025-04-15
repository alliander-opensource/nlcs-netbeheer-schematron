<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:math="http://www.w3.org/2005/xpath-functions/math"
            xmlns:keronic="http://example.com/my-functions"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:map="http://www.w3.org/2005/xpath-functions/map"
            version="3.0">

  <variable name="config_file" select= "document('../../../configuration/config.xml')"/>
  <variable name="language" select= "'nl'"/>
  <variable name="translation_file" select= "document('../../../localization/messages.xml')"/>

  <function name="keronic:get-connected-threshold">
    <value-of select="$config_file/config/V10/Topology/ConnectedThreshold"/>
  </function>
  
  <function name="keronic:get-ls-cable-min-measurement-distance">
    <value-of select="$config_file/config/V10/LSkabel/MinMeasurementDistance"/>
  </function>

  <function name="keronic:get-ls-cable-max-measurement-distance">
    <value-of select="$config_file/config/V10/LSkabel/MaxMeasurementDistance"/>
  </function>

  <function name="keronic:get-ls-mof-max-cable-connection">
    <value-of select="$config_file/config/V10/LSmof/MaxConnectionCount"/>
  </function>

  <function name="keronic:get-ls-mof-min-cable-connection">
    <value-of select="$config_file/config/V10/LSmof/MinConnectionCount"/>
  </function>

  <function name= "keronic:get-ls-cable-min-measurement-angle">
    <value-of select="$config_file/config/V10/LSkabel/MinMeasurementAngle"/>
  </function>

  <function name= "keronic:get-ms-cable-connections-end">
    <value-of select="$config_file/config/V10/MSkabel/ConnectionCountEnd"/>
  </function>

  <function name= "keronic:get-ms-cable-connections-start">
    <value-of select="$config_file/config/V10/MSkabel/ConnectionCountStart"/>
  </function>

  <function name= "keronic:get-statuses-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V10/MSkabel/WithoutEmptyEnds/Status"/>
  </function>

  <function name= "keronic:v11-get-statuses-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V10/MSkabel/WithoutEmptyEnds/Status"/>
  </function>

  <function name= "keronic:get-bedrijfstoestand-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V11/MSkabel/WithoutEmptyEnds/Bedrijfstoestand"/>
  </function>

  <function name= "keronic:ls-mof-spanning-ls-cable-status-check" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelSpanningCheck/Status"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-status-check" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/Status"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l1-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L1"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l2-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L2"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l3-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L3"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-f3-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/F3"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-required-count" as="xs:string">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/RequiredCount"/>
  </function>

  <function name= "keronic:ls-mof-new-ls-cable-count" as="xs:string">
    <value-of select="$config_file/config/V10/LSmof/LSkabelSpanningCheck/RequiredCount"/>
  </function>

  <function name= "keronic:e-aarddraad-connected-buildings-count" as="xs:string">
    <value-of select="$config_file/config/V10/EAarddraad/ConnectedBuildingsCount"/>
  </function>

  <function name= "keronic:ls-cable-get-max-depth" as="xs:string">
    <value-of select="$config_file/config/V10/LSkabel/MaxDepth"/>
  </function>

  <function name= "keronic:ls-cable-get-min-depth" as="xs:string">
    <value-of select="$config_file/config/V10/LSkabel/MinDepth"/>
  </function>

  <function name="keronic:get-connected-maaiveld-threshold" as="xs:string">
    <value-of select="$config_file/config/V10/Topology/ConnectedMaaiveldThreshold"/>
  </function>

  <function name= "keronic:get-translation">
    <param name="message_id"/>
    <variable name="translation" select="$translation_file//message[@id=$message_id]/message-text[@xml:lang=$language]"/>
    <value-of select="$translation"/>
  </function>

  <function name="keronic:replace-placeholders">
    <param name="message"/>
    <param name="placeholders"/>
    <variable name="result">
      <call-template name="keronic:replace-recursively">
        <with-param name="message" select="$message"/>
        <with-param name="placeholders" select="$placeholders"/>
      </call-template>
    </variable>
    <value-of select="$result"/>
  </function>

  <!-- recursively replaces placeholder strings with values from a keyed map -->
  <template name="keronic:replace-recursively">
    <param name="message"/>
    <param name="placeholders"/>

    <choose>
      <when test="exists(map:keys($placeholders))">
        <variable name="key" select="map:keys($placeholders)[1]"/>
        <variable name="value" select="xs:string(map:get($placeholders, $key))"/>
        <variable name="placeholder" select="concat('\{', $key, '\}')"/>

        <variable name="new_message" select="replace($message, $placeholder, $value)"/>
        <variable name="new_placeholders" select="map:remove($placeholders, $key)"/>

        <!-- Recursively call the template with updated message and map -->
        <call-template name="keronic:replace-recursively">
          <with-param name="message" select="$new_message"/>
          <with-param name="placeholders" select="$new_placeholders"/>
        </call-template>
      </when>
      <otherwise>
        <!-- No placeholders left, return the final message -->
        <value-of select="$message"/>
      </otherwise>
    </choose>
  </template>


</stylesheet>
