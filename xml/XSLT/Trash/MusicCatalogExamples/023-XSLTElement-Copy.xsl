<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:copy> element creates a copy of the current node. 
	Syntax: <xsl:copy use-attribute-sets="name-list">
						...
				</xsl:copy>
	Attributes:
		use-attribute-sets: Optional. A white space separated list of attribute-sets to apply to the output node, if the node is an element
	Notes: 
		1. Namespace nodes of the current node are automatically copied as well, but child nodes and attributes of the current node are not automatically copied!
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
					<xsl:element name="Singers">
						<xsl:value-of select="artist"/>
					</xsl:element>
					  <xsl:copy>
						<xsl:apply-templates select="title"/>
					  </xsl:copy>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
