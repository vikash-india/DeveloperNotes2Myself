<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:otherwise> element specifies a default action for the <xsl:choose> element. This action will take place when none of the <xsl:when> conditions apply.
	Syntax: 	<xsl:otherwise>
						...
					</xsl:otherwise>
	Attributes: None
	Notes: None
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
