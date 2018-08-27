<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		 1. How apply-templates can be used to match multiple nested templates
	Arguments:
		1. Run on file 000-PlayersRatings.xml
	Note:
		1. Remove the <xsl:apply-templates /> to check the affect.
		2. The xsl:key instruction names a colorNumKey key as a group of color elements whose cid attribute will be used as an index to look up specific color elements. When an efficient XSLT processor sees this instruction, it should create a hash table in memory or some other data structure to speed these lookups.
		3. The template rule for the shirts element resembles the one in the earlier examples. It has two xsl:apply-templates instructions: one to read in the external xq485.xml document (referring to this document in this example using the colorLookupDoc variable instead of the document's filename) and another to process the shirts element's contents.
		4. A brief template rule for the colors element suppresses this element from being copied to the result tree. Another template rule uses the key() function to look up the color names within the xq485.xml document's colors element.
		5. The template rule for the shirt element looks up the color name and adds it to the result tree followed by a single space (added by an xsl:text element) and the contents of that element. The lookup is performed using a key() function that names the colorNumKey key declared at the beginning of the stylesheet and the color ID of the shirt element being processed as the value to look for in the key. (The color ID is stored in a shirtColorCode variable declared at the beginning of the template.)
		6. Wrapping an xsl:for-each element around the xsl:value-of instruction that calls the key() function solves a small problem with using the key() function to look something up in another document: this function looks for key nodes in the same document as the context node, and without that xsl:for-each instruction, the context node for this xsl:value-of element is the shirt element being processed by the template rule. We're looking for a color element in the xq485.xml document, not in the same document as the shirt node, so we need to make xq485.xml the context node document for the xsl:value-of instruction. Wrapping it with an xsl:for-each instruction that selects xq485.xml (again, referenced using the variable colorLookupDoc) works nicely.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:variable name="RatingLookupDoc" select="document('000-RatingChart.xml')"/>
	<xsl:key name="RatingKey" match="Rating" use="@id"/>
	<xsl:template match="PlayersProfile/Player">
		<xsl:apply-templates select="$RatingLookupDoc"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="Rating"/>
	
	<xsl:template match="PlayerRating">
		<xsl:variable name="PlayerRatingValue" select="."/>
		<xsl:for-each select="$RatingLookupDoc">
			<xsl:value-of select="key('RatingKey',$PlayerRatingValue)"/>
		</xsl:for-each>
		<xsl:text>
		 </xsl:text>
		<xsl:apply-templates/>
		<xsl:text>
</xsl:text>
	</xsl:template>
	<xsl:template match="NickName"/>
	<xsl:template match="DOB"/>
</xsl:stylesheet>
