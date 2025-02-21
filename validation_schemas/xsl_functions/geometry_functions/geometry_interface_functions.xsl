<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
	        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	        xmlns:keronic="http://example.com/my-functions"
            xmlns:keronic-geom="http://example.com/my-functions-test"
	        xmlns:xs="http://www.w3.org/2001/XMLSchema"
	        version="3.0">


    <!-- FROM POINT FUNCTIONS -->
    <function name="keronic:point-connected-to-point" as="xs:boolean">
        <param name="point_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-point-2d(
                                          $point_1,
                                          $point_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point_2,
                                          $point_1,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-point-3d(
                                          $point_1,
                                          $point_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point_1,
                                          $point_2,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-connected-to-line" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-line-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-line-3d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-line-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-touches-line" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-touches-line-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>

                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-touches-line-3d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-touches-line-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-connected-to-area" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-area-3d(
                                          $point,
                                          $area,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>


    <!-- FROM LINE FUNCTIONS -->
    <function name="keronic:line-connected-to-point" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>

                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-point-3d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-touches-point" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-touches-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-touches-line-2d(
                                          $point,
                                          $line,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-touches-point-3d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-point-2d(
                                          $line,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-connected-to-line" as="xs:boolean">
        <param name="line_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-line-2d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-line-2d(
                                          $line_2,
                                          $line_1,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-line-3d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-line-2d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-touches-line" as="xs:boolean">
        <param name="line_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-touches-line-2d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-line-2d(
                                          $line_2,
                                          $line_1,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-touches-line-3d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-line-2d(
                                          $line_1,
                                          $line_2,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-connected-to-area" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-area-3d(
                                          $line,
                                          $area,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>


    <!-- FROM AREA FUNCTIONS -->
    <function name="keronic:area-connected-to-point" as="xs:boolean">
        <param name="area" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:area-2d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:area-3d-connected-to-point-3d(
                                          $area,
                                          $point,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:area-connected-to-line" as="xs:boolean">
        <param name="area" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:area-2d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:area-3d-connected-to-line-3d(
                                          $area,
                                          $line,
                                          ()
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          ()
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

        <!-- FROM POINT FUNCTIONS WITH THRESHOLD-->
    <function name="keronic:point-connected-to-point-with-threshold" as="xs:boolean">
        <param name="point_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-point-2d(
                                          $point_1,
                                          $point_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point_2,
                                          $point_1,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-point-3d(
                                          $point_1,
                                          $point_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point_1,
                                          $point_2,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-connected-to-line-with-threshold" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-line-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-line-3d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-line-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-touches-line-with-threshold" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-touches-line-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>

                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-touches-line-3d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-touches-line-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:point-connected-to-area-with-threshold" as="xs:boolean">
        <param name="point" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:point-2d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:point-3d-connected-to-area-3d(
                                          $point,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>


    <!-- FROM LINE FUNCTIONS WITH THRESHOLD -->
    <function name="keronic:line-connected-to-point-with-threshold" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-point-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>

                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-point-3d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-touches-point-with-threshold" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-touches-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-touches-line-2d(
                                          $point,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-touches-point-3d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-point-2d(
                                          $line,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-connected-to-line-with-threshold" as="xs:boolean">
        <param name="line_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-line-2d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-line-2d(
                                          $line_2,
                                          $line_1,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-line-3d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-line-2d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-touches-line-with-threshold" as="xs:boolean">
        <param name="line_1" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-touches-line-2d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-line-2d(
                                          $line_2,
                                          $line_1,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-touches-line-3d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-touches-line-2d(
                                          $line_1,
                                          $line_2,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:line-connected-to-area-with-threshold" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:line-2d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:line-3d-connected-to-area-3d(
                                          $line,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>


    <!-- FROM AREA FUNCTIONS WITH THRESHOLD-->
    <function name="keronic:area-connected-to-point-with-threshold" as="xs:boolean">
        <param name="area" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:area-2d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:point-3d-connected-to-area-2d(
                                          $point,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:area-3d-connected-to-point-3d(
                                          $area,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-point-2d(
                                          $area,
                                          $point,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>

    <function name="keronic:area-connected-to-line-with-threshold" as="xs:boolean">
        <param name="area" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <param name="threshold" as="xs:string"/>

        <variable name="d_threshold" select="xs:double($threshold)" as="xs:double"/>
        <variable name="d_dimension_1" select="xs:double($dimension_1)" as="xs:double"/>
        <variable name="d_dimension_2" select="xs:double($dimension_2)" as="xs:double"/>

        <choose>
            <when test="$d_dimension_1 = 2">
                <choose>
                    <when test="$d_dimension_2 = 2">
                        <value-of select="keronic:area-2d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:line-3d-connected-to-area-2d(
                                          $line,
                                          $area,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <when test="$d_dimension_1 = 3">
                <choose>
                    <when test="$d_dimension_2 = 3">
                        <value-of select="keronic:area-3d-connected-to-line-3d(
                                          $area,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </when>
                    <otherwise>
                        <value-of select="keronic:area-3d-connected-to-line-2d(
                                          $area,
                                          $line,
                                          $d_threshold
                                          )"/>
                    </otherwise>
                </choose>
            </when>
            <otherwise>
                <value-of select="false()"/>
            </otherwise>
        </choose>
    </function>


    <function name="keronic:line-start-connected-to-point" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

       <variable name="line_start_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 or
                                      position() = 3 ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-point(
                          tokenize($line_start_point, ' '),
                          $dimension_1,
                          $point,
                          $dimension_2)"/>
    </function>

    <function name="keronic:line-end-connected-to-point" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="point" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <variable name="line_end_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = last() - 2 or
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-point(
                          tokenize($line_end_point, ' '),
                          $dimension_1,
                          $point,
                          $dimension_2)"/>
    </function>

    <function name="keronic:line-start-connected-to-line" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="line_start_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 or
                                      position() = 3 ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-line(
                          tokenize($line_start_point, ' '),
                          $dimension_1,
                          $line_2,
                          $dimension_2)"/>
    </function>

    <function name="keronic:line-end-connected-to-line" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="line_2" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="line_end_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = last() - 2 or
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-line(
                          tokenize($line_end_point, ' '),
                          $dimension_1,
                          $line_2,
                          $dimension_2)"/>
    </function>

    <function name="keronic:line-start-connected-to-area" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>
        <variable name="line_start_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 or
                                      position() = 3 ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = 1 or
                                      position() = 2 ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-area(
                          tokenize($line_start_point, ' '),
                          $dimension_1,
                          $area,
                          $dimension_2)"/>
    </function>

    <function name="keronic:line-end-connected-to-area" as="xs:boolean">
        <param name="line" as="xs:string*"/>
        <param name="dimension_1" as="xs:string"/>
        <param name="area" as="xs:string*"/>
        <param name="dimension_2" as="xs:string"/>

        <variable name="line_end_point">
            <choose>
                <when test="xs:double($dimension_1) = 3">
                    <sequence select="$line[
                                      position() = last() - 2 or
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </when>
                <otherwise>
                    <sequence select="$line[
                                      position() = last() - 1 or
                                      position() = last() ]"/>
                </otherwise>
            </choose>
        </variable>
        <value-of select="keronic:point-connected-to-area(
                          tokenize($line_end_point, ' '),
                          $dimension_1,
                          $area,
                          $dimension_2)"/>
    </function>
</stylesheet>
