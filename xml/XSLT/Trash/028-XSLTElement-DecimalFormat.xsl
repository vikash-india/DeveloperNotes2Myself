<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:decimal-format> element defines the characters and symbols to be used when converting numbers into strings, with the format-number() function.
	Syntax: <xsl:decimal-format name="name" decimal-separator="char"  grouping-separator="char"  infinity="string" minus-sign="char" NaN="string" percent="char" per-mille="char" zero-digit="char" digit="char" pattern-separator="char"/> 
	Attributes:
		name						: Optional. Specifies a name for this format
		decimal-separator	: Optional. Specifies the decimal point character. Default is "."
		grouping-separator	: Optional. Specifies the thousands separator character. Default is ","
		infinity						: Optional. Specifies the string used to represent infinity. Default is "Infinity"
		minus-sign				: Optional. Specifies the character to represent negative numbers. Default is "-"
		NaN							: Optional. Specifies the string used when the value is not a number". Default is "NaN"
		percent					: Optional. Specifies the percentage sign character. Default is "%"
		per-mille					: Optional. Specifies the per thousand sign character. Default is "%o"
		zero-digit					: Optional. Specifies the digit zero character. Default is "0"
		digit							: Optional. Specifies the character used to indicate a place where a digit is required. Default is #
		pattern-separator	: Optional. Specifies the character used to separate positive and negative subpatterns in a format pattern. Default is ";"
	Notes: 
		1. All countries do not use the same characters for separating the decimal part from the integer part, and for grouping digits. With the <xsl:decimal-format> element you can change special characters to other symbols.
		2. This element is a top level element.
		3. The format-number() function can refer to the <xsl:decimal-format> element by name.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
	<xsl:template match="/">
		<html>
			<body>
				<xsl:value-of select="format-number(26825.8, '#.###,00', 'euro')"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
