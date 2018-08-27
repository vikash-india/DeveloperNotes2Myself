<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How does multiple nested templates gets called and executed
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. Each time the <Player> template is matched, the sub elements <Name> and <Sports> will also get called. 
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Great Players</h2>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Player">
		<p>
			<xsl:apply-templates select="Name"/>
			<xsl:apply-templates select="Sports"/>
		</p>
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
