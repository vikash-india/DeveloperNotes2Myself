<!-- 
	Definition: The <xsl:namespace-alias> element is used to replace a namespace in the style sheet to a different namespace in the output.
	Syntax: <xsl:namespace-alias stylesheet-prefix="prefix|#default" result-prefix="prefix|"#default"/> 
	Attributes:
		stylesheet-prefix	: Required. Specifies the namespace you wish to change
		result-prefix			: Required. Specifies the desired namespace for the output
	Notes: 
		1. <xsl:namespace-alias> is a top-level element, and must be a child node of <xsl:stylesheet> or <xsl:transform>.

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wxsl="http://www.w3schools.com/w3style.xsl">
	<xsl:namespace-alias stylesheet-prefix="wxsl" result-prefix="xsl"/>
	<xsl:template match="/">
		<wxsl:stylesheet>
			<xsl:apply-templates/>
			<xsl:element name="NewPlayersProfile">
				<xsl:for-each select="PlayersProfile/Player">
					<xsl:element name="PlayerName">
						<xsl:value-of select="Name"/>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</wxsl:stylesheet>
	</xsl:template>
</xsl:stylesheet>
