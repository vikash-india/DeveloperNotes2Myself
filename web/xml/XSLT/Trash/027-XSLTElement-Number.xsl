<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:number> element is used to determine the integer position of the current node in the source. It is also used to format a number.
	Syntax: <xsl:number count="expression" level="single|multiple|any" from="expression" value="expression" format="formatstring" lang="languagecode" letter-value="alphabetic|traditional" grouping-separator="character" grouping-size="number"/>
	Attributes:
		count						: Optional. An XPath expression that specifies what nodes are to be counted
		level						: Optional. Controls how the sequence number is assigned. Can be one of the following: single (default) OR multiple OR any (not supported by Netscape 6) 
		from						: Optional. An XPath expression that specifies where the counting will start
		value						: Optional. Specifies a user-provided number that is used in place of a sequence generated number
		format						: Optional. Defines the output format for the number. Can be one of the following:
											format="1" results in 1 2 3 . . 
											format="01" results in 01 02 03 (not supported by Netscape 6) 
											format="a" results in a b c . . (not supported by Netscape 6) 
											format="A" results in A B C. . (not supported by Netscape 6) 
											format="i" results in i ii iii iv . . (not supported by Netscape 6) 
											format="I" results in I II III IV . . (not supported by Netscape 6) 
		lang							: Optional. Specifies the language alphabet to be used for the numbering (Not supported by Netscape 6)
		letter-value				: Optional. Specifies whether the numbering in the selected language is alphabetic or traditional. The default is alphabetic
		grouping-separator	: Optional. Specifies what character should be used to separate groups of digits. The default is the comma
		grouping-size			: Optional. Specifies how many digits are in the groups that are being separated by the character specified in the grouping-separator attribute. The default is 3
	Notes: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<xsl:number value="250000" grouping-separator="."/>
				<br/>
				<xsl:number value="250000" grouping-size="2" grouping-separator="."/>
				<br/>
				<xsl:number  value="12" grouping-size="1" grouping-separator="#" format="I"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
