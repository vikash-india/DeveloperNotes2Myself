<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
	xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances"
	>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		<xsl:template match="@* | node()">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
		</xsl:template>
		<xsl:template match="//*[@type_name='Refresh_Request']">
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			<xsl:for-each select="@* | *">
				<xsl:if test=" name()!='Include_Children' ">
					<xsl:if test="name()!='Response_Destination' ">
						<xsl:copy-of select="."/>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<xsl:element name="Include_Children">
				<xsl:copy-of select="Include_Children/@*"/>
				<xsl:choose>
					<xsl:when test="Include_Children='true'">
						<xsl:value-of select="1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="0"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			
			<!-- Merge  the Response_Destination fields to Refresh_Request entity  --> 
			<xsl:choose>
				<xsl:when test=".//Response_Destination/@All_Subscribers = 'true'">
					<xsl:element name="Destination_Application1">ALL</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test=".//Destination_Application[1]">
						<xsl:element name="Destination_Application1">
							<xsl:value-of select=".//Destination_Application[1]"/>
						</xsl:element>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test=".//Destination_Application[2]">
				<xsl:element name="Destination_Application2">
					<xsl:value-of select=".//Destination_Application[2]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test=".//Destination_Application[3]">
				<xsl:element name="Destination_Application3">
					<xsl:value-of select=".//Destination_Application[3]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test=".//Destination_Application[4]">
				<xsl:element name="Destination_Application4">
					<xsl:value-of select=".//Destination_Application[4]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test=".//Destination_Application[5]">
				<xsl:element name="Destination_Application5">
					<xsl:value-of select=".//Destination_Application[5]"/>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
