<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xt="http://schemas.dendrite.com/IS/1.0.0/Sales_Area_Relation" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*">
		<xsl:variable name="TeamCnt" select="count(//*[@type_name='Sales_Area_Relation'])"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:element name="TransactionSetProperties">
				<xsl:copy-of select="TransactionSetProperties/@*|TransactionSetProperties/node()"/>
			</xsl:element>
			<xsl:if test="$TeamCnt > 0">
				<xsl:element name="xt:Partition_Job">
					<xsl:choose>
						<xsl:when test="//*[@operation!='NONE'] and //Sales_Area_Relation_Type='OCOV' ">
							<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="operation">NONE</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:attribute name="objectId"><xsl:value-of select="//@objectId"/></xsl:attribute>
					<xsl:attribute name="type_name">Partition_Job</xsl:attribute>
					<xsl:element name="Partition_Instruction_List">
						<xsl:attribute name="type_name">Partition_Instruction_List</xsl:attribute>
						<xsl:for-each select="//*[@type_name='Sales_Area_Relation'] ">
							<xsl:element name="Partition_Instruction">
								<xsl:variable name="op1" select="@operation"/>
								<xsl:choose>
									<xsl:when test="$op1='NONE' or .//Sales_Area_Relation_Type!='OCOV' ">
										<xsl:attribute name="operation">NONE</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="operation">INSERT</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:attribute name="type_name">Partition_Instruction</xsl:attribute>
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
								<xsl:element name="Type"><xsl:value-of select=".//Sales_Area_Relation_Type"/></xsl:element>
								<xsl:choose>
									<xsl:when test=".//Sales_Area_Relation_Type='OCOV' ">
										<xsl:element name="Sales_Area_Relation">
											<xsl:attribute name="operation">NONE</xsl:attribute>
											<xsl:attribute name="type_name">Sales_Area_Relation</xsl:attribute>
											<xsl:copy-of select="*"/>
											<xsl:element name="Parx_Alignment_Assignment">
												<xsl:variable name="op2" select="@operation"/>
												<xsl:choose>
													<xsl:when test="$op2='NONE'">
														<xsl:attribute name="operation">NONE</xsl:attribute>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="operation">INSERT</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:attribute name="type_name">Parx_Alignment_Assignment</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name="Sales_Area_Relation">
											<xsl:attribute name="operation"><xsl:value-of select="@operation"/></xsl:attribute>
											<xsl:attribute name="type_name">Sales_Area_Relation</xsl:attribute>
											<xsl:copy-of select="*"/>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
