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
				<h2>Great Players</h2>
				<table border="1">
					<tr bgcolor="#99CCFF">
						<th>Name</th>
						<th>Sports</th>
					</tr>
					<xsl:for-each select="PlayersProfile/Player">
						<tr>
							<td>
								<xsl:value-of select="Name"/>
							</td>
							<!-- To insert a multiple conditional test against the XML file, add the <xsl:choose>, <xsl:when>, and <xsl:otherwise> elements to the XSL file -->
							<xsl:choose>
								<xsl:when test="@id &gt; 2">
									<td bgcolor="#FFFFCC">
										<xsl:value-of select="Sports"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="Sports"/>
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
