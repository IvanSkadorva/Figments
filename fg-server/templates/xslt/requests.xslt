<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="requests-by-category" match="request" use="@category" />

    <xsl:template match="/">
        <div>
            <h3>Stats</h3>
                <!-- //student[count(. |  key('students-by-group', @group)[1] ) = 1 -->
                <!-- //student[@group=9] -->
                <h4>Total requests:<xsl:value-of select="count(//request)"/></h4>

                <xsl:apply-templates select="//request[generate-id(.) = generate-id(key('requests-by-category', @category)[1] )]"/>
        </div>
    </xsl:template>

    <xsl:template match="request">
        <h5>Tea <xsl:value-of select="@category"/></h5>
        <h6>Total: <xsl:value-of select="count(//request[@category = current()/@category])"/></h6>
        <ul>
            <xsl:apply-templates select="key('requests-by-category', @category)" mode="grouping"/>
        </ul>
    </xsl:template>

    <xsl:template match="request" mode="grouping">
        <li><xsl:value-of select="@date"/> -
            <xsl:value-of select="@product"/>
        </li>
    </xsl:template>

</xsl:stylesheet>