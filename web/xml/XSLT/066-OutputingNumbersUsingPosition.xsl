<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. An example to output number based on the position() of the node.
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note: None
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1" indent="yes"/>
	<xsl:template match="Player">
	 <xsl:number value="position()"  level="any"/>. <br/>	<!-- If value is missed then postion() is the default -->
	</xsl:template>
</xsl:stylesheet>
