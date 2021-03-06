<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:comment> element is used to create a comment node in the result tree.
	Syntax: <xsl:comment>
						...
				</xsl:comment>
	Attributes: None
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:comment>This is a comment!</xsl:comment>
		<xsl:element name="NewPlayersProfile">
			<xsl:for-each select="PlayersProfile/Player">
					<xsl:element name="PlayerName">
						<xsl:value-of select="Name"/>
					</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
