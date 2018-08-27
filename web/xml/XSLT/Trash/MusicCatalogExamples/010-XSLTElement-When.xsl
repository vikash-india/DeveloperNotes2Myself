<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:when> element is used to specify an action for the <xsl:choose> element. The <xsl:when> element evaluates an expression, and if it returns true, an action is performed.
	Syntax: 	<xsl:when test="boolean-expression">
						...
					</xsl:when>
	Attributes:
		test: Required. Specifies a Boolean expression to be tested
	Notes: 
		1. The <xsl:when> element is used in conjunction with <xsl:choose> and <xsl:otherwise> to express multiple conditional tests.
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
							<!-- The code above will add a pink background color to the "Artist" column WHEN the price of the CD is higher than 10, and a grey background-color WHEN the price of the CD is higher than 9 and lower or equal to 10. -->
							<xsl:choose>
								<xsl:when test="price &gt; 10">
									<td bgcolor="#ff00ff">
										<xsl:value-of select="artist"/>
									</td>
								</xsl:when>
								<xsl:when test="price &gt; 9">
									<td bgcolor="#cccccc">
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
