<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:message> element writes a message to the output. This element is primarily used to report errors.
	Syntax: <xsl:message terminate="yes|no">
						...
				</xsl:message>
	Attributes:
		terminate: Optional. "yes" terminates the processing after the message is written to the output. "no" continues the processing after the message is written to the output. Default is "no".
	Notes: 
		1. This element can contain almost any other XSL element (<xsl:text>, <xsl:value-of>, etc.).
		2. The terminate attribute gives you the choice to either quit or continue the processing when an error occurs.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<xsl:for-each select="catalog/cd">
					<p>Title: <xsl:value-of select="title"/>
						<br/>
						Artist:
					<xsl:if test="artist=''">
						<xsl:message terminate="yes">
							Error: Artist is an empty string!
						</xsl:message>
					</xsl:if>
						<xsl:value-of select="artist"/>
					</p>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
