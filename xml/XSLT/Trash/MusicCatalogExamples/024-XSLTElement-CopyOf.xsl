<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:copy-of> element creates a copy of the current node.
	Syntax: <xsl:copy-of select="expression"/>
	Attributes:
		select: Required. Specifies what to be copied
	Notes: 
		1. Namespace nodes, child nodes, and attributes of the current node are automatically copied as well!
		2. This element can be used to insert multiple copies of the same node into different places in the output.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
				<xsl:element name="Singers">
					<xsl:value-of select="artist"/>
				</xsl:element>
				<xsl:copy-of select="."/>				
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
