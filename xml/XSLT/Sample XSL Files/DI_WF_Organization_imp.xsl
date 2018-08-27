<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Organization']">
		<xsl:variable name="OrgType" select="Organization_Type"/>
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			<xsl:choose>
				<xsl:when test="$op='NONE' and ( .//Customer_Identifier )">
					<xsl:attribute name="operation">UPDATE</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="@*[name() != 'operation'] "/>
			<!-- This will Added the sub entity Hospital or Department or Pharmacy based on the Professional_Type -->
			<xsl:choose>
				<xsl:when test="$OrgType='HOSP' or $OrgType='HGRP' or $OrgType='WHOL'">
					<xsl:if test=".//Organization_Medical_School or Organization_Subtype or Resident_Count or Total_Bed_Count">
						<xsl:element name="Hospital">
							<xsl:attribute name="type_name">Hospital</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="ExtarctInfoFromHosp"/>
							<xsl:call-template name="ExtarctInfoFromMedicalSchool"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$OrgType='DEPT' ">
					<xsl:if test="Facility_Count or Organization_Name">
						<xsl:element name="Department">
							<xsl:attribute name="type_name">Department</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="ExtarctInfoFromDept"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$OrgType='PHAR' or $OrgType='IHS' or $OrgType='GPO' ">
					<xsl:if test="Organization_Subtype or Rx_Volume_Range or Home_Health_Care_Flag or Third_Party_Rx or Computerized or Classification_Trade or Outlet_Count or Nursing_Home_Count">
						<xsl:element name="Pharmacy">
							<xsl:attribute name="type_name">Pharmacy</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="ExtarctInfoFromPhar">
								<xsl:with-param name="OrgType" select="$OrgType"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
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
				<xsl:if test="ID_Type = 'DDD'">
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
				<xsl:if test="ID_Type = 'HIN'">
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
				<xsl:if test="ID_Type = 'IMS'">
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
			<xsl:apply-templates select="* [name() != 'Activity_Status' and name() != 'Organization_Subtype' and name() != 'Funding_Type'] "/>
			<xsl:if test="Activity_Status != 'CURR' or  $op !='UPDATE'">
				<xsl:copy-of select="Activity_Status"/>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="Funding_Type and $OrgType = 'HOSP'">
					<xsl:element name="Organization_Subtype">
						<xsl:apply-templates select="Funding_Type/@* | Funding_Type/text()"/>
					</xsl:element>
				</xsl:when>
        <xsl:when test="Organization_Subtype and $OrgType = 'HOSP' ">
        </xsl:when>
        <xsl:when test="Specialty and $OrgType = 'GRP'">
					<xsl:element name="Organization_Subtype">
						<xsl:apply-templates select="Specialty/@* | Specialty/text()"/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$OrgType != 'HOSP' or $OrgType != 'GRP'">
					<xsl:copy-of select="Organization_Subtype"/>
				</xsl:when>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Customer_Identifier_List"/>
	<xsl:template match="Organization_Medical_School_List"/>
	<!-- <xsl:template match="Organization_Subtype"/> -->
	<!-- This will add info from Medical School to Hospital-->
	<xsl:template name="ExtarctInfoFromMedicalSchool">
		<xsl:for-each select=".//Organization_Medical_School">
			<xsl:variable name="MedSch_op" select="@operation"/>
			<xsl:choose>
				<xsl:when test="$MedSch_op = 'DELETE'">
					<xsl:element name="Medical_School_Name">
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:element>
					<xsl:element name="Org_Medical_School_ID">
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:element>
					<xsl:element name="External_ID_1">
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="Medical_School_Name">
						<xsl:value-of select="Medical_School_Name"/>
					</xsl:element>
					<xsl:if test="Org_Medical_School_ID">
						<xsl:element name="Org_Medical_School_ID">
							<xsl:value-of select="Org_Medical_School_ID"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="External_ID_1">
						<xsl:value-of select="External_ID_1"/>
					</xsl:element>
					<xsl:element name="Master_Identifier">
						<xsl:value-of select="Master_Identifier"/>
					</xsl:element>
					<xsl:if test="$MedSch_op = 'REFRESH' and ../../Data_Source='BOB' ">
						<xsl:element name="NeedToGenGlbMSID">
							<xsl:value-of select="1"/>
						</xsl:element>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- This will add info from Organization to Hospital  -->
	<xsl:template name="ExtarctInfoFromHosp">
		<xsl:if test="Organization_Subtype">
			<xsl:copy-of select="Organization_Subtype"/>
		</xsl:if>
		<xsl:if test="Specialty">
			<xsl:copy-of select="Specialty"/>
		</xsl:if>
		<xsl:if test="Resident_Count">
			<xsl:copy-of select="Resident_Count"/>
		</xsl:if>
		<xsl:if test="Total_Bed_Count">
			<xsl:copy-of select="Total_Bed_Count"/>
		</xsl:if>
	</xsl:template>
	<!-- This will add info from Organization to Department -->
	<xsl:template name="ExtarctInfoFromDept">
		<xsl:if test="Facility_Count">
			<xsl:copy-of select="Facility_Count"/>
		</xsl:if>
		<xsl:if test="Organization_Name">
			<xsl:copy-of select="Organization_Name"/>
		</xsl:if>
	</xsl:template>
	<!-- This will add info from Organization to Pharmacy  -->
	<xsl:template name="ExtarctInfoFromPhar">
		<xsl:param name="OrgType"/>
		<xsl:if test="Rx_Volume_Range">
			<xsl:copy-of select="Rx_Volume_Range"/>
		</xsl:if>
		<xsl:if test="Home_Health_Care_Flag">
			<xsl:copy-of select="Home_Health_Care_Flag"/>
		</xsl:if>
		<xsl:if test="Third_Party_Rx">
			<xsl:copy-of select="Third_Party_Rx"/>
		</xsl:if>
		<xsl:if test="Computerized">
			<xsl:copy-of select="Computerized"/>
		</xsl:if>
		<xsl:if test="Classification_Trade">
			<xsl:copy-of select="Classification_Trade"/>
		</xsl:if>
		<xsl:if test="Outlet_Count">
			<xsl:copy-of select="Outlet_Count"/>
		</xsl:if>
		<xsl:if test="Nursing_Home_Count">
			<xsl:copy-of select="Nursing_Home_Count"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="//Address">
		<xsl:variable name="add_op" select="@operation"/>
		<!--Below condition is added for checking the Address is affiliated, if Address is affiliated then we are ignoring the address to consume-->
		<xsl:if test="not(Owner_Customer_Identifier) or Owner_Customer_Identifier = ../../Customer_ID or Owner_Customer_Identifier='' ">
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
