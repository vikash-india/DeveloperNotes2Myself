<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How to create result tree from multiple source/input document.
		2. This copies all the content of the second input document into each of the element of result tree.
	Arguments:
		1. Run on file 000-PlayersRatings.xml
	Note:
		1. The first template's rule's second xsl:apply-templates instruction copies the contents of a player element to the result tree 
		2. Before that second xsl:apply-templates instruction, however, is another xsl:apply-templates instruction with a select attribute. This attribute's value calls the document() function and names the XML document as its one argument. 
		3. The function reads this XML document in and parses it as an XML document, and the xsl:apply-templates instruction tells the XSLT processor to apply any relevant template rules to it. The stylesheet's second template is the relevant template, and it processes the XML document's contents the same way that it processes the source tree document's content: copying it all to the result tree.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/PlayersProfile/Player">
		<Player>
			<xsl:apply-templates select="document('000-RatingChart.xml.xml')"/>
			<xsl:apply-templates/>
		</Player>
	</xsl:template>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
