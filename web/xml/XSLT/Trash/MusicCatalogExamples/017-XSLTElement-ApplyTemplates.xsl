<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:apply-templates> element applies a template to the current element or to the current element's child nodes. If we add a select attribute to the <xsl:apply-templates> element it will process only the child element that matches the value of the attribute. We can use the select attribute to specify in which order the child nodes are to be processed.
	Syntax: <xsl:apply-templates select="expression" mode="name">
						...
				</xsl:apply-templates>
	Attributes:
		select	: Optional. Specifies the nodes to be processed. An asterisk selects the entire node-set. If this attribute is omitted, all child nodes of the current node will be selected
		mode	: Optional. If there are multiple ways of processing defined for the same element, distinguishes among them
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
					<xsl:element name="Singers">
						<xsl:apply-templates select="artist"/>
					</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
