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
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Title</th>
						<th>Artist</th>
					</tr>
					<!-- The element Loop is not supported by XSLT. So Fallback code will be executed -->
					<xsl:loop select="catalog/cd">
						<xsl:fallback>
							<xsl:for-each select="catalog/cd">
								<tr>
									<td>
										<xsl:value-of select="title"/>
									</td>
									<td>
										<xsl:value-of select="artist"/>
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
