<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:attribute-set> element creates a named set of attributes. The attribute-set can be applied as whole to the output document.
	Syntax: <xsl:attribute-set name="name" use-attribute-sets="name-list">
						...
				</xsl:attribute-set>
	Attributes:
		name						: Required. Specifies the name of the attribute-set
		use-attribute-sets	: Optional. A white space separated list of other attribute-sets to use in the attribute-set
	Notes: 
		1. Must be child of <xsl:stylesheet> or <xsl:transform>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Attribute Set should be a a child of xsl:stylesheet or xsl:transform only -->
	<xsl:attribute-set name="PlayersDetails">
		<xsl:attribute name="Rating">1</xsl:attribute>
		<xsl:attribute name="Contemporary">No</xsl:attribute>
	</xsl:attribute-set>
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<!-- Call the attribute-sets -->
		<xsl:element name="NewPlayersProfile"  use-attribute-sets="PlayersDetails" >
			<xsl:for-each select="PlayersProfile/Player">
				<!-- Call the attribute-sets -->
				<xsl:element use-attribute-sets="PlayersDetails" name="Player">
				<xsl:value-of select="Name"/>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
