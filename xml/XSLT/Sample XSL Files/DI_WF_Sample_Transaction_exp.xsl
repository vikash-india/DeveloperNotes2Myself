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
			<xsl:for-each select="//*[@type_name='Sample_Transaction']">
				<xsl:if test="@operation='REFRESH' ">
					<xsl:element name="Refresh_Response">true</xsl:element>
					<xsl:element name="Refresh_Request_Originator"></xsl:element>
					<xsl:element name="Subscriber_List">
						<xsl:element name="ALL"/>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
