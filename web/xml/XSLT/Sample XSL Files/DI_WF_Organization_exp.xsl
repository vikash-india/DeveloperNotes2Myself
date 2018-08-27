<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Organization']">
		<xsl:choose>
			<xsl:when test="../TransactionSetProperties/Refresh_Response='true' and  Activity_Status='PAST' ">
				<xsl:copy>
					<xsl:apply-templates select="@*"/>
					<xsl:apply-templates select="*[name() != 'Organization_Subtype']"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="OrgType" select="Organization_Type"/>
				<xsl:variable name="TypeName" select="@type_name"/>
				<xsl:variable name="HospCnt" select="count(.//Hospital)"/>
				<xsl:variable name="DeptCnt" select="count(.//Department)"/>
				<xsl:variable name="PharCnt" select="count(.//Pharmacy)"/>
				<xsl:variable name="op">
					<xsl:choose>
						<xsl:when test="@operation = 'NONE' and  ($HospCnt > 0  or $DeptCnt > 0 or $PharCnt > 0 )">UPDATE</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@operation"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:copy>
					<xsl:choose>
						<xsl:when test="@operation = 'NONE' and ($HospCnt > 0  or $DeptCnt > 0 or $PharCnt > 0)">
							<xsl:attribute name="type_name"><xsl:value-of select="$TypeName"/></xsl:attribute>
							<xsl:attribute name="operation">UPDATE</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="@*"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="$OrgType = 'HOSP' and  $op='REFRESH' ">
							<xsl:if test="Organization_Subtype">
								<xsl:element name="Funding_Type">
									<xsl:apply-templates select="Organization_Subtype/@* | Organization_Subtype/text()"/>
								</xsl:element>
							</xsl:if>
							<xsl:apply-templates select="@* |* [name() != 'Organization_Subtype'] "/>
						</xsl:when>
						<xsl:when test="$OrgType = 'GRP' ">
							<xsl:if test="Organization_Subtype">
								<xsl:element name="Specialty">
									<xsl:apply-templates select="Organization_Subtype/@* | Organization_Subtype/text()"/>
								</xsl:element>
							</xsl:if>
							<xsl:apply-templates select="@* |* [name() != 'Organization_Subtype'] "/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="node() "/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="($op = 'REFRESH'  and (.//Hospital/Medical_School_Name and .//Hospital/Org_Medical_School_ID ))">
						<xsl:element name="Organization_Medical_School_List">
							<xsl:attribute name="type_name">Organization_Medical_School_List</xsl:attribute>
							<xsl:for-each select=".//Hospital/Medical_School_Name ">
								<xsl:call-template name="CreateMedicalSchool">
									<xsl:with-param name="operation" select="$op"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:element>
					</xsl:if>
					<!-- Added for the Customer_Identifier in case of External ID's data exists in the Professional -->
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
					<!-- Update the Organization fields related to Hospital entity from the Hospital sub-entity -->
					<xsl:for-each select=".//Hospital">
						<xsl:if test="Organization_Subtype">
							<xsl:copy-of select="Organization_Subtype">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Specialty">
							<xsl:copy-of select="Specialty">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Resident_Count">
							<xsl:copy-of select="Resident_Count">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Total_Bed_Count">
							<xsl:copy-of select="Total_Bed_Count">
							</xsl:copy-of>
						</xsl:if>
					</xsl:for-each>
					<!-- Update the Organization fields related to Department entity from the Department sub-entity -->
					<xsl:for-each select=".//Department">
						<xsl:if test="Facility_Count">
							<xsl:copy-of select="Facility_Count">
							</xsl:copy-of>
						</xsl:if>
					</xsl:for-each>
					<!-- Update the Organization fields related to Pharmacy entity from the Pharmacy sub-entity -->
					<xsl:for-each select=".//Pharmacy">
						<xsl:if test="Rx_Volume_Range">
							<xsl:copy-of select="Rx_Volume_Range">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Home_Health_Care_Flag">
							<xsl:copy-of select="Home_Health_Care_Flag">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Third_Party_Rx">
							<xsl:copy-of select="Third_Party_Rx">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Computerized">
							<xsl:copy-of select="Computerized">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Classification_Trade">
							<xsl:copy-of select="Classification_Trade">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Outlet_Count">
							<xsl:copy-of select="Outlet_Count">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Nursing_Home_Count">
							<xsl:copy-of select="Nursing_Home_Count">
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
					<xsl:element name="ID_Type">DDD</xsl:element>
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
					<xsl:element name="ID_Type">HIN</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_5' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">IMS</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CreateMedicalSchool">
		<xsl:param name="operation"/>
		<xsl:variable name="nodeName" select="name()"/>
		<xsl:element name="Organization_Medical_School">
			<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
			<xsl:attribute name="type_name">Organization_Medical_School</xsl:attribute>
			<xsl:choose>
				<xsl:when test="name() = 'Medical_School_Name'">
					<xsl:element name="Medical_School_Name">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
					<xsl:if test="//Hospital/Org_Medical_School_ID">
						<xsl:copy-of select="//Hospital/Org_Medical_School_ID"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:element>
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
	<xsl:template match="Hospital">
	</xsl:template>
	<xsl:template match="Department">
	</xsl:template>
	<xsl:template match="Pharmacy">
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
