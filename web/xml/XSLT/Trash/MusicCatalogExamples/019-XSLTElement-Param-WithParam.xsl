<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: 
	Syntax: 
						...
		
	Attributes:
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="catalog">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<xsl:call-template name="MyTemplate">
					<xsl:with-param name="param"  select="cd"/>
			  </xsl:call-template>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="MyTemplate">
	<!-- Parameter to this template -->
	<xsl:param name="param" />
	<xsl:for-each select="$param">
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
