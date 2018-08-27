<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:strip-space> element is used to define the elements for which white space should be removed.
	Syntax: <xsl:strip-space elements="list-of-element-names"/>
	Attributes:
		elements: Required. A white space separated list of element names for which white space should be preserved/removed. The list can also contain "*" and "prefix:*" so that all elements or all elements from a particular namespace can be joined
	Notes: 
		1. The <xsl:preserve-space> element is used to define the elements for which white space should be preserved.
		2. Preserving white space is the default setting, so using the <xsl:preserve-space> element is only necessary if  the <xsl:strip-space> element is used.
		3. The <xsl:preserve-space> element and the <xsl:strip-space> element are top-level elements.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="Name NickName Sports Country"/>
	<xsl:preserve-space elements="DOB Debut"/>
	<xsl:template match="/">
		<html>
			<body>
				<xsl:for-each select="PlayersProfile/Player">
					<p>
						<xsl:value-of select="Name"/>
						<br/>
						<xsl:value-of select="Sports"/>
						<br/>
						<xsl:value-of select="Country"/>
						<br/>
						<xsl:value-of select="NickName"/>
						<br/>
						<xsl:value-of select="DOB"/>
						<br/>
						<xsl:value-of select="Debut"/>
					</p>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
