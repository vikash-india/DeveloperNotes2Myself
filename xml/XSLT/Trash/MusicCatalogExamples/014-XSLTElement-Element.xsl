<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:element> element is used to create an element node in the output document.
	Syntax: <xsl:element name="name" namespace="URI" use-attribute-sets="namelist">
						...
				</xsl:element>
	Attributes:
		name						: Required. Specifies the name of the element to be created (the value of the name attribute can be set to an expression that is computed at run-time, like this: <xsl:element name="{$country}" />
		namespace				: Optional. Specifies the namespace URI of the element (the value of the namespace attribute can be set to an expression that is computed at run-time, like this: <xsl:element name="{$country}" namespace="{$someuri}"/>
		use-attribute-sets	: Optional. A white space separated list of attribute-sets containing attributes to be added to the element
	Notes: None
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="SingerList">
			<xsl:for-each select="catalog/cd">
					<xsl:element name="Singers">
						<xsl:value-of select="artist"/>
					</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
