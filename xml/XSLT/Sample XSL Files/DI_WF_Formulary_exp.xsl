<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Formulary']">
		<xsl:choose>
			<xsl:when test="../TransactionSetProperties/Refresh_Response='true' and  Activity_Status='PAST' ">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="op" select="@operation"/>
				<xsl:variable name="TypeName" select="@type_name"/>
				<xsl:variable name="FormularyCnt" select="count(.//Formulary_Sub)"/>
				<xsl:copy>
					<xsl:choose>
						<xsl:when test="($op = 'NONE' and  ($FormularyCnt > 0 ))">
							<xsl:attribute name="type_name"><xsl:value-of select="$TypeName"/></xsl:attribute>
							<xsl:attribute name="operation">UPDATE</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="@*"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="node()"/>
					<!-- Update the Formulary Top-level entity with fields from Formulary_Sub entity  -->
					<xsl:for-each select=".//Formulary_Sub">
						<xsl:if test="Formulary_Description">
							<xsl:copy-of select="Formulary_Description">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Update_Frequency">
							<xsl:copy-of select="Update_Frequency">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Physician_Impact">
							<xsl:copy-of select="Physician_Impact">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Last_Update_Date">
							<xsl:copy-of select="Last_Update_Date">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Formulary_Type">
							<xsl:copy-of select="Formulary_Type">
							</xsl:copy-of>
						</xsl:if>
					</xsl:for-each>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Formulary_Sub">
	</xsl:template>
</xsl:stylesheet>
