<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: 
	Syntax: 
						...
		
	Attributes:
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
					<!-- The element Loop is not supported by XSLT. So Fallback code will be executed -->
					<xsl:loop select="PlayersProfile/Player">
						<xsl:fallback>
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
						</xsl:fallback>
					</xsl:loop>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
