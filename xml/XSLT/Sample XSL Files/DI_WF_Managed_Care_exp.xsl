<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Managed_Care']">
		<xsl:choose>
			<xsl:when test="../TransactionSetProperties/Refresh_Response='true' and  Activity_Status='PAST' ">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="ProfType" select="Managed_Care_Type"/>
				<xsl:variable name="TypeName" select="@type_name"/>
				<xsl:variable name="op" select="@operation"/>
				<xsl:copy>
					<xsl:choose>
						<xsl:when test="$op = 'NONE' and (.//Managed_Care_Sub) ">
							<xsl:attribute name="type_name"><xsl:value-of select="$TypeName"/></xsl:attribute>
							<xsl:attribute name="operation">UPDATE</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="@*"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="node()"/>
					<!-- Added for the Customer_Identifier in case of Customer_Sub_Type data exists in the Managed_Care -->
					<xsl:if test="WF_External_ID_1 or WF_External_ID_2 or WF_External_ID_3 or WF_External_ID_4 or WF_External_ID_5 ">
						<xsl:if test="not(WF_External_ID_1/@xsi:nil) or not(WF_External_ID_2/@xsi:nil) or not(WF_External_ID_3/@xsi:nil) or not(WF_External_ID_4/@xsi:nil) or not(WF_External_ID_5/@xsi:nil) ">
							<xsl:element name="Customer_Identifier_List">
								<xsl:attribute name="type_name">Customer_Identifier_List</xsl:attribute>
								<xsl:for-each select="WF_External_ID_1|WF_External_ID_2|WF_External_ID_3|WF_External_ID_4|WF_External_ID_5">
									<xsl:call-template name="CreateCustomerIdentifier">
										<xsl:with-param name="operation" select="$op"/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:element>
						</xsl:if>
					</xsl:if>
					<!-- Update the Managed_Care fields related to Manage_Care_Sub entity from the Manage_Care_Sub sub-entity -->
					<xsl:for-each select=".//Managed_Care_Sub">
						<xsl:if test="Accreditation_Agency">
							<xsl:copy-of select="Accreditation_Agency">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Rx_Mail_Percent">
							<xsl:copy-of select="Rx_Mail_Percent">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Rx_Retail_Percent">
							<xsl:copy-of select="Rx_Retail_Percent">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Rx_In_House_Percent">
							<xsl:copy-of select="Rx_In_House_Percent">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Member_Count">
							<xsl:copy-of select="Member_Count">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="NCQA_Status">
							<xsl:copy-of select="NCQA_Status">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="NCQA_Review_Date">
							<xsl:copy-of select="NCQA_Review_Date">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Federally_Qualified_Flag">
							<xsl:copy-of select="Federally_Qualified_Flag">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Plan_Count">
							<xsl:copy-of select="Plan_Count">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Market_Area">
							<xsl:copy-of select="Market_Area">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Financial_Type">
							<xsl:copy-of select="Financial_Type">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Model_Type">
							<xsl:copy-of select="Model_Type">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="MCO_Type">
							<xsl:copy-of select="MCO_Type">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Profit_Status">
							<xsl:copy-of select="Profit_Status">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Physician_Rx_Control">
							<xsl:copy-of select="Physician_Rx_Control">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Plan_Level">
							<xsl:copy-of select="Plan_Level">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Fiscal_Year">
							<xsl:copy-of select="Fiscal_Year">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Account_Owner">
							<xsl:copy-of select="Account_Owner">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Total_Membership_Comment">
							<xsl:copy-of select="Total_Membership_Comment">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Risk_Supplement">
							<xsl:copy-of select="Risk_Supplement">
							</xsl:copy-of>
						</xsl:if>
					</xsl:for-each>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CreateCustomerIdentifier">
		<xsl:param name="operation"/>
		<xsl:variable name="nodeName" select="name()"/>
		<xsl:choose>
			<xsl:when test="name() = 'WF_External_ID_1' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT1</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_2' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT2</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_3' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">FTID</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_4' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT3</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_5' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT4</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="WF_External_ID_1">
	</xsl:template>
	<xsl:template match="WF_External_ID_2">
	</xsl:template>
	<xsl:template match="WF_External_ID_3">
	</xsl:template>
	<xsl:template match="WF_External_ID_4">
	</xsl:template>
	<xsl:template match="WF_External_ID_5">
	</xsl:template>
	<xsl:template match="Managed_Care_Sub">
	</xsl:template>
	<xsl:template match="//Address">
		<xsl:variable name="op" select="@operation"/>
		<xsl:variable name="TypeName" select="@type_name"/>
		<xsl:copy>
			<xsl:choose>
				<xsl:when test="$op = 'NONE' ">
					<xsl:attribute name="type_name"><xsl:value-of select="$TypeName"/></xsl:attribute>
					<xsl:attribute name="operation">UPDATE</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@*"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="*[name() != 'Affiliation']"/>
			<xsl:for-each select="Affiliation">
				<xsl:if test="DEA_Number">
					<xsl:copy-of select="DEA_Number"/>
				</xsl:if>
				<xsl:if test="DEA_Expiration_Date">
					<xsl:copy-of select="DEA_Expiration_Date"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
