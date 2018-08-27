<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!-- This code will check the Address_ID, if WF_Address_ID is xsi:nil='true the it will add the element Address_ID with xsi:nil='true' -->
	<xsl:template match="//*[@type_name='Customer_Affiliation']">
		<xsl:choose>
			<xsl:when test="../TransactionSetProperties/Refresh_Response='true' and  Activity_Status='PAST' ">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
					<xsl:if test="WF_Address_ID/@xsi:nil = 'true' ">
						<xsl:element name="Address_ID">
							<xsl:attribute name="xsi:nil">true</xsl:attribute>
						</xsl:element>
					</xsl:if>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="WF_Address_ID"/>
</xsl:stylesheet>
