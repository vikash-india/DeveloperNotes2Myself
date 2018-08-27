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
		<xsl:element name="NewPlayersProfile">
			<xsl:for-each select="PlayersProfile/Player">
				<xsl:element name="PlayerDetails">
					<xsl:attribute name="Country"><xsl:value-of select="Country"/></xsl:attribute>
					<!-- Hard coded Attribute -->
					<xsl:attribute name="Rating">1</xsl:attribute>
					<!-- Empty Attribute -->
					<xsl:attribute name="Achievment"/>
					<xsl:value-of select="Name"/>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
