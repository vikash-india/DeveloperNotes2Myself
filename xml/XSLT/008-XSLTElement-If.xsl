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
				<h2>Great Players</h2>
				<table border="1">
					<tr bgcolor="#99CCFF">
						<th>Name</th>
						<th>Sports</th>
					</tr>
					<xsl:for-each select="PlayersProfile/Player">
						<xsl:if test="@id &gt; 2">
							<tr>
								<td>
									<xsl:value-of select="Name"/>
								</td>
								<td>
									<xsl:value-of select="Sports"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
