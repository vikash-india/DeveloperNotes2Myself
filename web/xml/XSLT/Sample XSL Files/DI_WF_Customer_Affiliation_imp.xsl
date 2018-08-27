<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[@type_name='Customer_Affiliation']">
		<xsl:variable name="op" select="@operation"/>

		<xsl:choose>
			<xsl:when test="Activity_Status = 'CURR' and  $op='UPDATE'">
				<xsl:copy>
					<xsl:for-each select="@* | *[name() != 'Activity_Status']">
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- This code will check the Address_ID, if Address_ID is xsi:nil='true the it will add the element WF_Address_ID with xsi:nil='true' -->
	<xsl:template match="//*[@type_name='Customer_Affiliation']">
			<xsl:copy>
				<xsl:apply-templates select="@* | node()"/>
				<xsl:if test="Address_ID/@xsi:nil = 'true' ">
					<xsl:element name="WF_Address_ID">
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:element>					
				</xsl:if>
			</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
