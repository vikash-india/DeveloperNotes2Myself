<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ts="http://schemas.dendrite.com/IS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xtc="http://schemas/dendrite/xt/core" xmlns:xtd="http://schemas/dendrite/xt/datatypes" xmlns:dts="http://schemas/dendrite/xt/database" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Order']">
		<xsl:copy>
			<xsl:apply-templates select="@* | *"/>
			<xsl:for-each select=".//Order_Detail[1]/*">
				<xsl:copy-of select="."/>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Order_Detail_List"/>	
</xsl:stylesheet>
