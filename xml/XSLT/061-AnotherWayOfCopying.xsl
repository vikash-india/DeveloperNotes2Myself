<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		 1. Another way of copying the input XML File to result XML file without any change
	Arguments:
		1. Run on any XML File
	Note: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
