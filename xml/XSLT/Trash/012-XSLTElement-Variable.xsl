<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:variable> element is used to declare a local or global variable.
	Syntax: <xsl:variable name="name" select="expression">
						...
				</xsl:variable>
	Attributes:
	Notes: 
		1. The variable is global if it's declared as a top-level element, and local if it's declared within a template.
		2. Once you have set a variable's value, you cannot change or modify that value!
		3. You can add a value to a variable by the content of the <xsl:variable> element OR by the select attribute!
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Global Variable -->
	<xsl:variable name="Country1">India</xsl:variable>
	<!-- Single Quotes inside double quotes -->
	<xsl:variable name="Country2" select="'USA'"/>
	<!-- Double quotes inside single quotes -->
	<xsl:variable name="Country3" select='"China"'/>
	<xsl:template match="/">
		<!-- Local Variables -->
		<xsl:variable name="TableBorder">0</xsl:variable>
		<xsl:variable name="TableHeader">
			This is the line 1.<br/>
			This is the line 2.
		</xsl:variable>
		<html>
			<body>
				<h2>
					<xsl:value-of select="$Country1"/>
				</h2>
				<h3>
					<xsl:value-of select="$Country2"/>
				</h3>
				<h4>
					<xsl:value-of select="$Country3"/>
				</h4>
				<!-- Multiple Lines does not work -->
				<xsl:value-of select="$TableHeader"/>
				<!-- Use curly braces for using the variable as attribute -->
				<table border="{$TableBorder}">
					<tr bgcolor="#99CCFF">
						<th>Title</th>
						<th>Artist</th>
					</tr>
					<xsl:for-each select="PlayersProfile/Player[Sports='Cricket']">
						<tr>
							<td>
								<xsl:value-of select="Name"/>
							</td>
							<td>
								<xsl:value-of select="Sports"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
