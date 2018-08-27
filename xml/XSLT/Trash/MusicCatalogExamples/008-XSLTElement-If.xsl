<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:if> element contains a template that will be applied only if a specified condition is true.
	Syntax: <xsl:if test="expression">
						...
				</xsl:if>
	Attributes:
		test: Required. Specifies the condition to be tested
	Notes: 
		1. Use <xsl:choose> in conjunction with <xsl:when> and <xsl:otherwise> to express multiple conditional tests.
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
						<!-- To add a conditional test, add the <xsl:if> element inside the <xsl:for-each> element in the XSL file -->
						<!-- The value of the required test attribute contains the expression to be evaluated. -->
						<xsl:if test="price &gt; 10">
							<tr>
								<td>
									<xsl:value-of select="title"/>
								</td>
								<td>
									<xsl:value-of select="artist"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
