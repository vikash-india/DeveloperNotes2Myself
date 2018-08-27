<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:include> element is a top-level element that includes the contents of one style sheet into another.
	Syntax: <xsl:include href="URI"/>
	Attributes:
		href: Required. Specifies the URI of the style sheet to include
	Notes: 
		1. An included style sheet has the same precedence as the including style sheet.
		2. This element must appear as a child node of <xsl:stylesheet> or <xsl:transform>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="000-ExternalStyleSheet.xsl"/>
	<xsl:template match="catalog">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<xsl:call-template name="MyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
