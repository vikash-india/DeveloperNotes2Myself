<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xt="http://schemas.dendrite.com/IS/1.0.0/Product_Sales_Force" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*">
		<xsl:variable name="TeamCnt" select="count(//*[@type_name='Product_Sales_Force'])"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="TransactionSetProperties">
				<xsl:copy-of select="TransactionSetProperties/@*|TransactionSetProperties/node()"/>
			</xsl:element>
			<xsl:if test="$TeamCnt > 0">
				<xsl:element name="xt:Partition_Job">
					<xsl:choose>
						<xsl:when test="//*[@operation!='NONE']">
							<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="operation">NONE</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:attribute name="type_name">Partition_Job</xsl:attribute>
					<xsl:element name="Partition_Instruction_List">
						<xsl:attribute name="type_name">Partition_Instruction_List</xsl:attribute>
						<xsl:for-each select="//*[@type_name='Product_Sales_Force'] ">
							<xsl:element name="Partition_Instruction">
								<xsl:variable name="op1" select="@operation"/>
								<xsl:choose>
									<xsl:when test="$op1='NONE'">
										<xsl:attribute name="operation">NONE</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="operation">INSERT</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:attribute name="type_name">Partition_Instruction</xsl:attribute>
								<xsl:element name="Parx_Product_Sales_Force">
									<xsl:attribute name="type_name">Parx_Product_Sales_Force</xsl:attribute>
									<xsl:variable name="op2" select="@operation"/>
									<xsl:choose>
										<xsl:when test="$op2='NONE'">
											<xsl:attribute name="operation">NONE</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="operation">INSERT</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:copy-of select="@*[name() != 'type_name' and name() != 'operation' ] | *"/>
									<xsl:if test="@operation='INSERT' ">
										<xsl:element name="Operation">I</xsl:element>
									</xsl:if>
									<xsl:if test="@operation='DELETE' ">
										<xsl:element name="Operation">D</xsl:element>
									</xsl:if>
									<xsl:if test="@operation='UPDATE' ">
										<xsl:element name="Operation">U</xsl:element>
									</xsl:if>
									<xsl:if test="@operation='REFRESH' ">
										<xsl:element name="Operation">R</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
