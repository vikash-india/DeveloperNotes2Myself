<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:value-of> element element extracts the value of a selected node and add it to the output
	Syntax: <xsl:value-of select="expression" disable-output-escaping="yes|no"/>
	Attributes:
				select								: Required. An XPath expression that specifies which node/attribute to extract the value from
				disable-output-escaping	: Optional. "yes" indicates that special characters (like "<") should be output as is. "no" indicates that special characters (like "<") should be output as "&lt;". Default is "no" 
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
					<tr>
						<td>
							<xsl:value-of select="PlayersProfile/Player/Name"/>
						</td>
						<td>
							<xsl:value-of select="PlayersProfile/Player/Sports"/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>