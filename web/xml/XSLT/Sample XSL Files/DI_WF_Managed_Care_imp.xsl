<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[@type_name='Managed_Care']">
		<xsl:variable name="CustType" select="Managed_Care_Type"/>
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
	<!--		<xsl:apply-templates select="@* | node()"/> -->
			
			<xsl:choose>
				<xsl:when test="Activity_Status = 'CURR' and  $op='UPDATE'">
						<xsl:apply-templates select="@* |* [name() != 'Activity_Status'] "/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@*|* "/>
				</xsl:otherwise>
			</xsl:choose>

			<!-- This will Added the sub entity Managed_Care_Sub  -->
			<xsl:if test="Accreditation_Agency or Rx_Mail_Percent or Rx_Retail_Percent or Rx_Retail_Percent or Member_Count or NCQA_Status or NCQA_Review_Date or Federally_Qualified_Flag or Plan_Count or Market_Area or Financial_Type or Model_Type or MCO_Type or Profit_Status or Physician_Rx_Control or Plan_Level or Fiscal_Year or Account_Owner or Total_Membership_Comment or Risk_Supplement">
				<xsl:element name="Managed_Care_Sub">
				<xsl:attribute name="type_name">Managed_Care_Sub</xsl:attribute>
					<xsl:choose>
						<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>	
					<xsl:call-template name="ExtarctInfoFromManagedCareSub"/>
				</xsl:element>
			</xsl:if>
			
			<!-- To update the External_ID_1 / External_ID_2 / External_ID_3 / External_ID_4 / External_ID_5 fields based on the Customer_Identifier ID_Type with ID_Value  -->
			<xsl:for-each select=".//Customer_Identifier">
				<xsl:variable name="Cust_ID_op" select="@operation"/>
				<xsl:if test="ID_Type = 'CLT1'">
					<xsl:choose>
						<xsl:when test="$Cust_ID_op = 'DELETE'">
							<xsl:element name="WF_External_ID_1">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="WF_External_ID_1">
								<xsl:value-of select="ID_Value"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="ID_Type = 'CLT2'">
					<xsl:choose>
						<xsl:when test="$Cust_ID_op = 'DELETE'">
							<xsl:element name="WF_External_ID_2">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="WF_External_ID_2">
								<xsl:value-of select="ID_Value"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="ID_Type = 'FTID'">
					<xsl:choose>
						<xsl:when test="$Cust_ID_op = 'DELETE'">
							<xsl:element name="WF_External_ID_3">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="WF_External_ID_3">
								<xsl:value-of select="ID_Value"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="ID_Type = 'CLT3'">
					<xsl:choose>
						<xsl:when test="$Cust_ID_op = 'DELETE'">
							<xsl:element name="WF_External_ID_4">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="WF_External_ID_4">
								<xsl:value-of select="ID_Value"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="ID_Type = 'CLT4'">
					<xsl:choose>
						<xsl:when test="$Cust_ID_op = 'DELETE'">
							<xsl:element name="WF_External_ID_5">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="WF_External_ID_5">
								<xsl:value-of select="ID_Value"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>		
	<xsl:template match="Customer_Identifier_List"/>
	
	<!-- This will add info from Organization to Hospital  -->
	<xsl:template name="ExtarctInfoFromManagedCareSub">
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
		<xsl:if test="AMC_Managed_Care_ID">
			<xsl:copy-of select="AMC_Managed_Care_ID">
			</xsl:copy-of>
		</xsl:if>	
	</xsl:template>
	
	<xsl:template match="//Address">
	   <xsl:variable name="add_op" select="@operation"/>
		<xsl:copy>
			<xsl:choose>
				<xsl:when test="Activity_Status = 'CURR' and  $add_op='UPDATE'">
					<xsl:for-each select="@*| *[name() != 'Activity_Status'] ">
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@* | * "/>
				</xsl:otherwise>
			</xsl:choose>		 
			<xsl:element name="Affiliation">
				<xsl:choose>
					<xsl:when test="$add_op = 'DELETE' ">
						<xsl:attribute name="operation">UPDATE</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="operation"><xsl:value-of select="$add_op"/></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="type_name">Affiliation</xsl:attribute>
			</xsl:element>
		</xsl:copy>	
	</xsl:template>
    
</xsl:stylesheet>
