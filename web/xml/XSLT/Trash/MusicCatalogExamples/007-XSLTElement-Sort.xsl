<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:sort> element is used to sort the output.
	Syntax: <xsl:sort select="expression" lang="language-code" data-type="text|number|qname" order="ascending|descending" case-order="upper-first|lower-first"/>
	Attributes:
		select			: Optional. Specifies which node/node-set to sort on
		lang				: Optional. Specifies which language is to be used by the sort
		data-type	: Optional. Specifies the data-type of the data to be sorted. Default is "text"
		order			: Optional. Specifies the sort order. Default is "ascending"
		case-order	: Optional. Specifies whether upper- or lowercase letters are to be ordered first
	Notes: 
		1. <xsl:sort> is always within <xsl:for-each> or <xsl:apply-templates>.
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
						<xsl:sort select="artist"/>
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
