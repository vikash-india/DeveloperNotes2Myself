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
					<xsl:for-each  select="catalog/cd">
						<!-- To sort the output, simply add an <xsl:sort> element inside the <xsl:for-each>  -->
						<!-- The select attribute indicates what XML element to sort on. -->
						<!-- Complex Sorting can be done by setting up different Attributes value  -->
				<!--
					<xsl:sort select="artist" order="descending"/>
					<xsl:sort select="artist" order="descending" case-order="lower-first"/>
					<xsl:sort select="artist" order="ascending" case-order="upper-first"/>
				-->
					<xsl:sort select="artist" case-order="lower-first"/>
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
