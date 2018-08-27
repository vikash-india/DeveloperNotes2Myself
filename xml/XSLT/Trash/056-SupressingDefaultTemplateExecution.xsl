<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How to supress default templates from being executed
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. The empty elements <xsl:template match="NickName" />,	<xsl:template match="Sports" />  etc supresses the execution of the default templates from being executed.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
	<xsl:template match="/">
		<List>
			<xsl:apply-templates/>
		</List>
	</xsl:template>
	<xsl:template match="NickName" />
	<xsl:template match="Sports" />
	<xsl:template match="Country" />
	<xsl:template match="DOB" />
	<xsl:template match="Debut" />
	<xsl:template match="Income" />
	<xsl:template match="Remarks" />
</xsl:stylesheet>
