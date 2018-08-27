<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:key> element is a top-level element which declares a named key that can be used in the style sheet with the key() function.
	Syntax: <xsl:key name="name" match="pattern" use="expression"/>
	Attributes:
		name	: Required. Specifies the name of the key
		match	: Required. Defines the nodes to which the key will be applied
		use		: Required. The value of the key for each of the nodes
	Notes: 
		1. A key does not have to be unique!
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="artistKey" match="catalog/cd" use="artist"/>
	<xsl:template match="/">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Title</th>
						<th>Artist</th>
					</tr>
						<xsl:for-each select="key('artistKey','Bob Dylan')">
							<tr>
								<td>
									<xsl:value-of select="title"/>
								</td>
								<td>
									<xsl:value-of select="artist"/>
								</td>
							</tr>
						</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
