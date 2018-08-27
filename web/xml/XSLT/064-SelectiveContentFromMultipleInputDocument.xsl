<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How to create result tree from multiple source/input document.
		2. This copies only the selective content from the second input document to the result tree ie only <Rating id="1">Great</Rating> is copied into the the result tree
	Arguments:
		1. Run on file 000-PlayersRatings.xml
	Note: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/PlayersProfile/Player">
		<Player>
			<xsl:apply-templates select="document('000-PlayersRating.xml')//*[@id='1']"/>
			<xsl:apply-templates/>
		</Player>
	</xsl:template>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
