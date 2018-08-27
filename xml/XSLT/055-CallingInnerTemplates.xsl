<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		 1. How apply-templates can be used to execute multiple nested templates when it wont get executed by default.
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. Remove the <xsl:apply-templates /> to check the affect.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
			<xsl:for-each select="PlayersProfile/Player">
				Name: 	<xsl:value-of select="Name"/> <br/>
			</xsl:for-each>
			<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="PlayersProfile">
			<xsl:for-each select="Player">
				Sports: 	<xsl:value-of select="Sports"/> <br/>
			</xsl:for-each>
			<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="Player">
			<xsl:for-each select=".">
				Country: 	<xsl:value-of select="Country"/> <br/>
			</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
