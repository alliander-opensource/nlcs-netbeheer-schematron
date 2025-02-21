<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
	        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	        xmlns:keronic="http://example.com/my-functions"
	        xmlns:xs="http://www.w3.org/2001/XMLSchema"
	        version="3.0">

    <function name="keronic:vals-within-threshold" as="xs:boolean">
        <param name="value_1" as="xs:double"/>
        <param name="value_2" as="xs:double"/>
        <param name="threshold" as="xs:double"/>
        <choose>
            <when test="($value_1 le $value_2 + $threshold) and
                        ($value_1 ge $value_2 - $threshold)">
                <value-of select="true()"/>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:cast-string-array-to-double-array" as="xs:double*">
        <param name="string-array" as="xs:string*"/>
        <variable name="double-array" as="xs:double*">
            <for-each select="$string-array">
                <sequence select="xs:double(.)"/>
            </for-each>
        </variable>
        <sequence select="$double-array"/>
    </function>

    <function name="keronic:split-pos-list-to-posses" as="xs:string*">
        <param name="pos_list" as="xs:string*"/>

        <sequence select="for $index in 0 to ((count($pos_list) div 3) - 1)
                          return
                          let $act_index := ($index * 3) + 1
                          return
                          string-join($pos_list
                          [position() = $act_index or
                          position() = $act_index + 1 or
                          position() = $act_index + 2
                          ], ' ')
                          "/>
    </function>

    <function name="keronic:cast-3d-to-2d-array" as="xs:string*">
        <param name="array-3d" as="xs:string*" />
        <sequence select="
                          for $i in 1 to count($array-3d)
                          return
                          if ($i mod 3 != 0) then $array-3d[$i] else ()
        "/>
    </function>


    <function name="keronic:atan2" as="xs:double">
    <param name="y" as="xs:double"/>
    <param name="x" as="xs:double"/>

    <choose>
        <when test="$x = 0">
            <choose>
             <when test="$y gt 0">
                    <sequence select="math:pi() div 2"/>
                </when>
                <when test="$y lt 0">
                    <sequence select="-math:pi() div 2"/>
                </when>
                <otherwise>
                    <sequence select="0"/>
                </otherwise>
            </choose>
        </when>
        <otherwise>
            <variable name="atan" select="math:atan($y div $x)"/>
            <choose>
                <when test="$x gt 0">
                    <sequence select="$atan"/>
                </when>
                <when test="$x lt 0 and $y ge 0">
                    <sequence select="$atan + math:pi()"/>
                </when>
                <when test="$x lt 0 and $y lt 0">
                    <sequence select="$atan - math:pi()"/>
                </when>
            </choose>
        </otherwise>
    </choose>
</function>

</stylesheet>
