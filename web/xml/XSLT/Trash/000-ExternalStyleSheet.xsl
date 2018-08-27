<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: 
	Syntax: 
						...
		
	Attributes:
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="MyTemplate">
		<xsl:for-each select="cd">
			<p>
				<xsl:apply-templates select="title"/>
				<xsl:apply-templates select="artist"/>
			</p>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="title">
  Title: <span style="color:#ff0000">
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
	<xsl:template match="artist">
  Artist: <span style="color:#00ff00">
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
</xsl:stylesheet>
