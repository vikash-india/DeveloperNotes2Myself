<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:processing-instruction> element writes a processing instruction to the output.
	Syntax: <xsl:processing-instruction name="process-name">
						...
				</xsl:processing-instruction>
	Attributes:
		name: Required. Specifies the name of the processing instruction 
	Notes: None
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:processing-instruction name="xml-stylesheet">href="style.css" type="text/css"</xsl:processing-instruction>
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
					<xsl:element name="Singers">
						<xsl:value-of select="artist"/>
					</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
