<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:call-template> element calls a named template.
	Syntax: <xsl:call-template name="templatename"> 
						...
				</xsl:call-template>		
	Attributes:
		name: Required. Specifies the name of the template to be called
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="PlayersProfile">
		<html>
			<body>
				<h2>Great Players</h2>
				<!-- This is calling the templates and it can be called using parameters -->
				<xsl:call-template name="MyTemplate"/>
			</body>
		</html>
	</xsl:template>
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
  Sports <span style="color:#6600CC">
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
</xsl:stylesheet>
