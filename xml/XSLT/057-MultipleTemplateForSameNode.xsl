<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. An example to show that the multiple template for the same node ends up on executing the last template. Even the priority does not work.
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1" indent="yes"/>
	<xsl:template match="/" priority="0">
Root Matched from Template 1
	</xsl:template>
	<xsl:template match="/" priority="3">
Root Matched from Template 2
	</xsl:template>
	<xsl:template match="/" priority="2">
Root Matched from Template 3
	</xsl:template>
</xsl:stylesheet>
