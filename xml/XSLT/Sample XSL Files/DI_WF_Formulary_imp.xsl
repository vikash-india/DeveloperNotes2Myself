<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[@type_name='Formulary']">
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			
			<xsl:choose>
				<xsl:when test="Activity_Status = 'CURR' and  $op='UPDATE'">
					<xsl:apply-templates select="@* |* [name() != 'Activity_Status'] "/>
				</xsl:when>
				<xsl:otherwise>
							<xsl:apply-templates select="@*|* "/>
				</xsl:otherwise>
			</xsl:choose>
		
		<!-- This will Add the sub entity Formulary_Sub -->
			<xsl:if test="Formulary_Description or Update_Frequency or Physician_Impact or Last_Update_Date">
				<xsl:element name="Formulary_Sub">
					<xsl:attribute name="type_name">Formulary_Sub</xsl:attribute>
					<xsl:choose>
						<xsl:when test="$op = 'INSERT'">
								<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:when test="$op = 'REFRESH'">
								<xsl:attribute name="operation">REFRESH</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
								<xsl:attribute name="operation">REFRESH</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="ExtarctInfoFromFormulary"/>
				</xsl:element>
			</xsl:if>
			
	</xsl:copy>
	</xsl:template>
	
	<!-- This will add info from Prof  to PRES or NonPres.Ensure context is Professional when calling this template -->
	<xsl:template name="ExtarctInfoFromFormulary">
		<xsl:if test="Formulary_Description">
			<xsl:copy-of select="Formulary_Description"/>
		</xsl:if>
		<xsl:if test="Update_Frequency">
			<xsl:copy-of select="Update_Frequency"/>
		</xsl:if>
		<xsl:if test="Physician_Impact">
			<xsl:copy-of select="Physician_Impact"/>
		</xsl:if>
		<xsl:if test="Last_Update_Date">
			<xsl:copy-of select="Last_Update_Date"/>
		</xsl:if>
		<xsl:if test="Formulary_Type">
			<xsl:copy-of select="Formulary_Type"/>
		</xsl:if>
	</xsl:template>
	
	</xsl:stylesheet>
