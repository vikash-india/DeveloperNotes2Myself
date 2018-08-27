<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:for-each> element loops through each node in a specified node set.
	Syntax: <xsl:for-each select="expression"> 
					 ...
				</xsl:for-each>
	Attributes:
				select: Required. The node set to be processed. This is an XPath expression
	Notes: None
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
							<td>
								<xsl:value-of select="Sports"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
