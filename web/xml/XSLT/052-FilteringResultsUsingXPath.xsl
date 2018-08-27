<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How to use XPath expressions to filter the result for tranformation
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. XPath functions and complex XPath expressions can be used in patterns while using various XSL Elements.
		2. Other legal operators that can be used are = != &lt; &gt;
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
					<xsl:for-each select="PlayersProfile/Player[Sports='Cricket']">
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
