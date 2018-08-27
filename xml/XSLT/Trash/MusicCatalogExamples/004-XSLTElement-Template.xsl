<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition	: An XSL style sheet consists of one or more set of rules that are called templates. Each template contains rules to apply when a specified node is matched.The <xsl:template> element is used to build templates.
	Syntax: 	  <xsl:template name="name" match="pattern" mode="mode" priority="number"> 
						...
					  </xsl:template>
	Attributes:
					name		: Optional. Specifies a name for the template.
					pattern	: Optional. The match pattern for the template. If this attribute is omitted there must be a name attribute
					mode		: Optional. Specifies a mode for this template
					number	: Optional. A number which indicates the numeric priority of the template
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
					<tr>
						<td>.</td>
						<td>.</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
