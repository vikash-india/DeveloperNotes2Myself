<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xt="http://schemas.dendrite.com/IS/1.0.0/Customer_Sales_Area" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*">
		<xsl:variable name="TeamCnt" select="count(//*[@type_name='Customer_Sales_Area'])"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="TransactionSetProperties">
				<xsl:copy-of select="TransactionSetProperties/@*|TransactionSetProperties/node()"/>
			</xsl:element>
			<xsl:if test="$TeamCnt > 0">
				<xsl:for-each select="//*[@type_name='Customer_Sales_Area'] ">
					<xsl:element name="xt:Partition_Instruction_Staging">
						<xsl:variable name="op1" select="@operation"/>
						<xsl:variable name="ActivityStatus" select="Activity_Status"/>
						<xsl:attribute name="objectId"><xsl:value-of select=".//@objectId"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="$op1='NONE'">
								<xsl:attribute name="operation">NONE</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="operation">INSERT</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:attribute name="type_name">Partition_Instruction_Staging</xsl:attribute>
						<xsl:copy-of select="*"/>

						<xsl:choose>
							<xsl:when test="$op1='INSERT' ">
								<xsl:element name="Operation">I</xsl:element>
							</xsl:when >
							<xsl:when test="$op1='DELETE' ">
								<xsl:element name="Operation">D</xsl:element>
							</xsl:when >
							<xsl:when test="$op1='REFRESH' and $ActivityStatus='CURR' ">
										<xsl:element name="Operation">I</xsl:element>
							</xsl:when>
							<xsl:when test="$op1='REFRESH' and $ActivityStatus='PAST' ">
										<xsl:element name="Operation">D</xsl:element>
							</xsl:when>
							<xsl:when test="$op1='REFRESH' and $ActivityStatus='FUTR' ">
										<xsl:element name="Operation">D</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:for-each>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
