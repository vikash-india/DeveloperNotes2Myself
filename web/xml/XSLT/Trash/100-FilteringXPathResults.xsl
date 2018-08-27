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
					<!-- We can also filter the output from the XML file by adding a criterion to the select attribute in the <xsl:for-each> element. -->
					<!-- Legal Operators are = 		!= 		&lt; 		&gt; -->
					<xsl:for-each select="catalog/cd[artist='Bob Dylan']">
						<tr>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<td>
								<xsl:value-of select="artist"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
