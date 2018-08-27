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
		<xsl:for-each select="Player">
			<p>
				<xsl:apply-templates select="Name"/>
				<xsl:apply-templates select="Sports"/>
			</p>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="Name">
  Name: <span style="color:#CC3300">
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
	<xsl:template match="Sports">
  Sports: <span style="color:#6600CC">
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
</xsl:stylesheet>
