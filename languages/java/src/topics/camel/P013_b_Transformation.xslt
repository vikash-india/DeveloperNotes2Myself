<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <!-- Carriage Return Character -->
        <xsl:text>&#xa;</xsl:text>
        <xsl:element name="Singers">
            <!-- Carriage Return Character -->
            <xsl:text>&#xa;</xsl:text>
            <xsl:for-each select="catalog/cd">
                <!-- Tab Character -->
                <xsl:text>&#x9;</xsl:text>
                <xsl:element name="Singer">
                    <xsl:value-of select="artist"/>
                </xsl:element>
                <!-- Carriage Return Character -->
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>