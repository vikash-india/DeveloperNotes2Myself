<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//TransactionSetProperties">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
			<xsl:variable name="SARCount" select="count(..//*[@type_name='Sales_Area_Relation'])"/>
			<xsl:variable name="Oper" select="count(..//*[@operation='REFRESH']) "/>
			<xsl:variable name="SARType" select="..//Sales_Area_Relation_Type"/>
			<xsl:if test="$Oper > 0 and $SARCount > 0 and $SARType='OCOV' ">
					<xsl:element name="Refresh_Response">true</xsl:element>
					<xsl:element name="Refresh_Request_Originator"/>
					<xsl:element name="Subscriber_List">
						<xsl:element name="ALL"/>
					</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
