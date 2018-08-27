<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ts="http://schemas.dendrite.com/IS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xtc="http://schemas/dendrite/xt/core" xmlns:xtd="http://schemas/dendrite/xt/datatypes" xmlns:dts="http://schemas/dendrite/xt/database" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Professional']">
		<xsl:choose>
			<xsl:when test="../TransactionSetProperties/Refresh_Response='true' and  Activity_Status='PAST' ">
				<xsl:copy>
					<xsl:apply-templates select="@*"/>
					<xsl:apply-templates select="*[name() != 'Suffix_Name']"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="TypeName" select="@type_name"/>
				<xsl:variable name="ProfType" select="Professional_Type"/>
				<xsl:variable name="CID" select="./Customer_ID"/>
				<xsl:variable name="PrescriberCnt" select="count(.//Prescriber)"/>
				<xsl:variable name="NonPrescriberCnt" select="count(.//Non_Prescriber)"/>
				<xsl:variable name="PersonCnt" select="count(.//Person)"/>
				<xsl:variable name="op">
					<xsl:choose>
						<xsl:when test="@operation = 'NONE' and  ($PrescriberCnt > 0  or $NonPrescriberCnt > 0 or $PersonCnt > 0 )">UPDATE</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@operation"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:copy>
					<xsl:choose>
						<xsl:when test="(@operation = 'NONE' and  ($PrescriberCnt > 0  or $NonPrescriberCnt > 0 or $PersonCnt > 0 ))">
							<!--<xsl:attribute name="type_name"><xsl:value-of select="$TypeName"/></xsl:attribute>-->
							<xsl:attribute name="operation">UPDATE</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="operation"><xsl:value-of select="@operation"/></xsl:attribute>
							<!--<xsl:apply-templates select="@*"/>-->
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="@*[name() != 'operation']"/>
					<xsl:if test="$ProfType = 'PRES'">
						<xsl:if test="Suffix_Name">
							<xsl:element name="Contact_Suffix">
								<xsl:apply-templates select="Suffix_Name/@* | Suffix_Name/text()"/>
							</xsl:element>
						</xsl:if>
					</xsl:if>
					<xsl:apply-templates select="*[name() != 'Suffix_Name'] "/>
					<xsl:if test="($ProfType = 'PRES' or $ProfType = 'NPRS' )">
						<xsl:if test="Specialty_1 or Prescriber/Specialty_2 or Prescriber/Specialty_3">
							<xsl:if test="( not(Specialty_1/@xsi:nil) or (Prescriber/Specialty_2 and not(Prescriber/Specialty_2/@xsi:nil)) or( Prescriber/Specialty_3 and  not(Prescriber/Specialty_3/@xsi:nil)) )">
								<xsl:element name="Professional_Specialty_List">
									<xsl:attribute name="type_name">Professional_Specialty_List</xsl:attribute>
									<xsl:for-each select="Specialty_1|Prescriber/Specialty_2|Prescriber/Specialty_3 ">
										<xsl:call-template name="CreateProfessionalSpecialty">
											<xsl:with-param name="operation" select="$op"/>
											<xsl:with-param name="CustID" select="$CID"/>
										</xsl:call-template>
									</xsl:for-each>
								</xsl:element>
							</xsl:if>
						</xsl:if>
					</xsl:if>
					<!-- Added for the Customer_Identifier in case of External ID's data exists in the Professional -->
					<xsl:if test="($ProfType = 'PRES' or $ProfType = 'NPRS')">
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
					</xsl:if>
					<!-- Update the Professional fields related to Prescriber entity from the Prescriber sub-entity -->
					<xsl:for-each select=".//Prescriber">
						<xsl:if test="Title">
							<xsl:copy-of select="Title">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Gender">
							<xsl:copy-of select="Gender">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Patients_Per_Day">
							<xsl:copy-of select="Patients_Per_Day">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Day">
							<xsl:copy-of select="Birth_Day">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Month">
							<xsl:copy-of select="Birth_Month">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Year">
							<xsl:copy-of select="Birth_Year">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Speaker_Status">
							<xsl:copy-of select="Speaker_Status">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Optout_Indicator">
							<xsl:copy-of select="Optout_Indicator">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Optout_Date">
							<xsl:copy-of select="Optout_Date"/>
						</xsl:if>
						<xsl:if test="Optout_Change_Date">
							<xsl:copy-of select="Optout_Change_Date"/>
						</xsl:if>
					</xsl:for-each>
					<!-- Update the Professional fields related to Non_Prescriber entity from the Non_Prescriber sub-entity -->
					<xsl:for-each select=".//Non_Prescriber">
						<xsl:if test="Title">
							<xsl:copy-of select="Title">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Gender">
							<xsl:copy-of select="Gender">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Contact_Suffix">
							<xsl:copy-of select="Contact_Suffix">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Day">
							<xsl:copy-of select="Birth_Day">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Month">
							<xsl:copy-of select="Birth_Month">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Birth_Year">
							<xsl:copy-of select="Birth_Year">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Speaker_Status">
							<xsl:copy-of select="Speaker_Status">
							</xsl:copy-of>
						</xsl:if>
						<xsl:if test="Professional_Suffix">
							<xsl:copy-of select="Professional_Suffix">
							</xsl:copy-of>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="($ProfType = 'PRES')">
						<xsl:for-each select=".//Person">
							<xsl:if test="Professional_Suffix">
								<xsl:copy-of select="Professional_Suffix">
								</xsl:copy-of>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
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
					<xsl:element name="ID_Type">ME</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_2' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT1</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_3' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">CLT2</xsl:element>
					<xsl:element name="ID_Value">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'WF_External_ID_4' and not(@xsi:nil)">
				<xsl:element name="Customer_Identifier">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Customer_Identifier</xsl:attribute>
					<xsl:element name="ID_Type">AOA</xsl:element>
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
	<xsl:template name="CreateProfessionalSpecialty">
		<xsl:param name="operation"/>
		<xsl:param name="CustID"/>
		<xsl:variable name="nodeName" select="name()"/>
		<xsl:choose>
			<xsl:when test="name() = 'Specialty_1' and not(@xsi:nil)">
				<xsl:element name="Professional_Specialty">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Professional_Specialty</xsl:attribute>
					<xsl:copy-of select="$CustID"/>
					<xsl:element name="Specialty_Type">PRIM</xsl:element>
					<xsl:element name="Specialty">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'Specialty_2' and not(@xsi:nil)">
				<xsl:element name="Professional_Specialty">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Professional_Specialty</xsl:attribute>
					<xsl:copy-of select="$CustID"/>
					<xsl:element name="Specialty_Type">SEC</xsl:element>
					<xsl:element name="Specialty">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="name() = 'Specialty_3'  and not(@xsi:nil)">
				<xsl:element name="Professional_Specialty">
					<xsl:attribute name="operation"><xsl:value-of select="$operation"/></xsl:attribute>
					<xsl:attribute name="type_name">Professional_Specialty</xsl:attribute>
					<xsl:copy-of select="$CustID"/>
					<xsl:element name="Specialty_Type">TERR</xsl:element>
					<xsl:element name="Specialty">
						<xsl:copy-of select="text()|@*"/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Specialty_1">
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
	<xsl:template match="Prescriber">
	</xsl:template>
	<xsl:template match="Non_Prescriber">
	</xsl:template>
	<xsl:template match="Person">
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
