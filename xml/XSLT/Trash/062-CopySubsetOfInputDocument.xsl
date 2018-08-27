<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
	Purpose: 
		1. The Result tree is a subset of the Source Tree.
		2. The element names in the result tree is different from source tree.
		3. Some of the elements in source tree are attributes in the result tree.
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<NewPlayersProfile>
			<xsl:for-each select="PlayersProfile/Player">
				<Player>
					<xsl:element name="PlayerName">
						<xsl:attribute name="Sports"><xsl:value-of select="Sports"/></xsl:attribute>
						<xsl:attribute name="Country"><xsl:value-of select="Country"/></xsl:attribute>
						<xsl:value-of select="Name"/>
					</xsl:element>
				</Player>
			</xsl:for-each>
		</NewPlayersProfile>
	</xsl:template>
</xsl:stylesheet>
