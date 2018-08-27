<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:import> element is a top-level element that is used to import the contents of one style sheet into another.
	Syntax: <xsl:import href="URI"/>
	Attributes:
		href: Required. Specifies the URI of the style sheet to import
	Notes:
		1. An imported style sheet has lower precedence than the importing style sheet.
		2. This element must appear as the first child node of <xsl:stylesheet> or <xsl:transform>.
		3. Netscape 6 does not support import precedence, so this element will behave equivalent to <xsl:include>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="000-ExternalStyleSheet.xsl"/>
	<xsl:template match="catalog">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<xsl:call-template name="MyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
