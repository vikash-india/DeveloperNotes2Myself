<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:text> element is used to write literal text to the output.
	Syntax: <xsl:text disable-output-escaping="yes|no">
						...
				</xsl:text>
	Attributes:
		disable-output-escaping: Optional. "yes" indicates that special characters (like "<") should be output as is. "no" indicates that special characters (like "<") should be output as "&lt;". Default is "no". This attribute is not supported by Netscape 6
	Notes: 
		1. This element may contain literal text, entity references, and #PCDATA.
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
						<th>Text</th>
					</tr>
					<!-- The XSL <xsl:for-each> element can be used to select every XML element of a specified node-set. -->
					<xsl:for-each select="catalog/cd">
						<tr>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<td>
								<xsl:value-of select="artist"/>
								<!-- This is used to output the literla text -->
								<xsl:text>, </xsl:text>
								<xsl:value-of select="country"/>
							</td>
							<td>
								<xsl:text disable-output-escaping="yes"> Write anything including &gt; &lt; &amp; </xsl:text>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
