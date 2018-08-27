<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- 
	Definition: The <xsl:apply-imports> element applies a template rule from an imported style sheet.
	Syntax: <xsl:apply-imports/>
	Attributes: None
	Notes: 
		1. Template rules in imported style sheets have lower precedence than template rules in main style sheets. The <xsl:apply-imports> is used when we want to use a template rule from the imported style sheet rather than an equivalent rule in the main style sheet.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="000-ExternalStyleSheet.xsl"/>
	<xsl:template match="/">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<xsl:apply-imports/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

