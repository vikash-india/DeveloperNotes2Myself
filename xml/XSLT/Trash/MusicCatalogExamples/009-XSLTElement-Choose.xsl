<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:choose> element is used in conjunction with <xsl:when> and <xsl:otherwise> to express multiple conditional tests.
	Syntax: <xsl:choose> 
					...
				</xsl:choose>
	Attributes: None
	Notes: 
		1. If no <xsl:when> is true, the content of <xsl:otherwise> is processed.
		2. If no <xsl:when> is true, and no <xsl:otherwise> element is present, nothing is created.
		3. For simple conditional testing, use the <xsl:if> element instead.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Title</th>
						<th>Artist</th>
					</tr>
					<xsl:for-each select="catalog/cd">
						<tr>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<!-- To insert a multiple conditional test against the XML file, add the <xsl:choose>, <xsl:when>, and <xsl:otherwise> elements to the XSL file -->
							<xsl:choose>
								<xsl:when test="price &gt; 10">
									<td bgcolor="#ff00ff">
										<xsl:value-of select="artist"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="artist"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
