<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:attribute> element is used to add attributes to elements.
	Syntax: <xsl:attribute name="attributename" namespace="uri">
						...
				</xsl:attribute>
	Attributes:
		name			: Required. Specifies the name of the attribute
		namespace	: Optional. Defines the namespace URI for the attribute
	Notes: 
		1. The <xsl:attribute> element replaces existing attributes with equivalent  names.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
				<xsl:element name="Singers">
					<xsl:attribute name="country"><xsl:value-of select="country"/></xsl:attribute>
					<!-- Hard coded Attribute -->
					<xsl:attribute name="Language">English</xsl:attribute>
					<!-- Empty Attribute -->
					<xsl:attribute name="Rating"/>
					<xsl:value-of select="artist"/>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
