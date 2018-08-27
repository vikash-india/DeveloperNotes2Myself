<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. An example to show the Input tree is traversed and each node is checked against any template existing for that node and executed. 
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1.	Remove or add <xsl:apply-templates/> to check the affect
		2. <xsl:apply-templates/> should be used to force inner template match or it will be supressed
		3. Using <xsl:apply-templates/> when there is no sub child will given an error while transforming
		4. The Attribute @id template is not matched.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1" indent="yes"/>
	<xsl:template match="/">
Root Matched: 
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="PlayersProfile">
Players Profile Matched
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Player">
Player Matched
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="@id">
ID Matched
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="NickName">
NickName Matched

	</xsl:template>
	<xsl:template match="Sports">
Sports Matched

	</xsl:template>
	<xsl:template match="Country">
Country Matched

	</xsl:template>
	<xsl:template match="DOB">
DOB Matched

	</xsl:template>
	<xsl:template match="Debut">
Debut Matched

	</xsl:template>
	<xsl:template match="Income">
Income Matched

	</xsl:template>
	<xsl:template match="Remarks">
Remarks Matched

	</xsl:template>
</xsl:stylesheet>
