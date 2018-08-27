<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Professional']">
		<xsl:variable name="ProfType" select="Professional_Type"/>
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			<xsl:choose>
				<xsl:when test="$op='NONE' and (.//Professional_Specialty/Specialty_Type = 'PRIM' or .//Customer_Identifier )">
					<xsl:attribute name="operation">UPDATE</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="Activity_Status = 'CURR' and  $op='UPDATE'">
					<xsl:for-each select="@*[name() != 'operation'  ] | *[name() != 'Activity_Status' and name() != 'Specialty'] ">
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@* [name() != 'operation'  ] | *[ name() != 'Specialty'] "/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="$ProfType = 'PRES'">
				<xsl:if test="Contact_Suffix">
					<xsl:element name="Suffix_Name">
						<xsl:apply-templates select="Contact_Suffix/@* | Contact_Suffix/text()"/>
					</xsl:element>
				</xsl:if>
			</xsl:if>
			<xsl:for-each select=".//Professional_Specialty">
				<xsl:variable name="sp_op" select="@operation"/>
				<xsl:if test="Specialty_Type = 'PRIM'">
					<xsl:choose>
						<xsl:when test="$sp_op = 'DELETE'">
							<xsl:element name="Specialty_1">
								<xsl:attribute name="xsi:nil">true</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="Specialty_1">
								<xsl:value-of select="Specialty"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<!-- To update the  External_ID_1 / External_ID_2 / External_ID_3 / External_ID_4 / External_ID_5 
			fields based on the Customer_Identifier ID_Type with ID_Value  -->
			<xsl:for-each select=".//Customer_Identifier">
				<xsl:variable name="Cust_ID_op" select="@operation"/>
				<xsl:if test="ID_Type = 'ME'">
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
				<xsl:if test="ID_Type = 'CLT1'">
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
				<xsl:if test="ID_Type = 'CLT2'">
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
				<xsl:if test="ID_Type = 'AOA'">
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
			<!-- This will Add the sub entity Prescriber or Non_Prescriber basedon the Professional_Type AND VALUES FOR SPECIALY  -->
			<xsl:choose>
				<xsl:when test="$ProfType='NPRS'">
					<xsl:if test="Title or Gender or Birth_Day or Birth_Month or Birth_Year or Speaker_Status or Contact_Suffix">
						<xsl:element name="Non_Prescriber">
							<xsl:attribute name="type_name">Non_Prescriber</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="ExtarctInfoFromProfessionalNPRS"/>
							<xsl:call-template name="ExtarctInfoFromProfessionalSpecialty"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$ProfType='PRES'">
					<xsl:if test="Title or Gender or Birth_Day or Birth_Month  or Birth_Year or Speaker_Status or Patients_Per_Day or Optout_Indicator or Optout_Date or Optout_Change_Date or .//Professional_Specialty/Specialty_Type = 'SEC' or .//Professional_Specialty/Specialty_Type = 'TERR'">
						<xsl:element name="Prescriber">
							<xsl:attribute name="type_name">Prescriber</xsl:attribute>
							<xsl:choose>
								<xsl:when test="$op = 'INSERT'">
									<xsl:attribute name="operation">INSERT</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="operation">REFRESH</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="ExtarctInfoFromProfessional"/>
							<xsl:call-template name="ExtarctInfoFromProfessionalSpecialty"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
			<xsl:if test="Professional_Suffix">
				<xsl:element name="Person">
					<xsl:attribute name="type_name">Person</xsl:attribute>
					<xsl:choose>
						<xsl:when test="$op = 'INSERT'">
							<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="operation">REFRESH</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="ExtarctInfoFromPerson"/>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Customer_Identifier_List"/>
	<xsl:template match="Professional_Specialty_List"/>

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
	
	<!-- This will add info from Prof Specilty to PRES -->
	<xsl:template name="ExtarctInfoFromProfessionalSpecialty">
		<xsl:for-each select=".//Professional_Specialty">
			<xsl:variable name="sp_op" select="@operation"/>
			<xsl:if test="Specialty_Type = 'SEC'">
				<xsl:choose>
					<xsl:when test="$sp_op = 'DELETE'">
						<xsl:element name="Specialty_2">
							<xsl:attribute name="xsi:nil">true</xsl:attribute>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="Specialty_2">
							<xsl:value-of select="Specialty"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="Specialty_Type = 'TERR'">
				<xsl:choose>
					<xsl:when test="$sp_op = 'DELETE'">
						<xsl:element name="Specialty_3">
							<xsl:attribute name="xsi:nil">true</xsl:attribute>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="Specialty_3">
							<xsl:value-of select="Specialty"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- This will add info from Prof  to PRES or NonPres.Ensure context is Professional when calling this template -->
	<xsl:template name="ExtarctInfoFromProfessionalNPRS">
		<xsl:if test="Title">
			<xsl:copy-of select="Title"/>
		</xsl:if>
		<xsl:if test="Gender">
			<xsl:copy-of select="Gender"/>
		</xsl:if>
		<xsl:if test="Birth_Day">
			<xsl:copy-of select="Birth_Day"/>
		</xsl:if>
		<xsl:if test="Birth_Month">
			<xsl:copy-of select="Birth_Month"/>
		</xsl:if>
		<xsl:if test="Birth_Year">
			<xsl:copy-of select="Birth_Year"/>
		</xsl:if>
		<xsl:if test="Speaker_Status">
			<xsl:copy-of select="Speaker_Status"/>
		</xsl:if>
		<!--This is applicable to only PRES but since this template gets called for both.it will be added to both.
   Xtelligent metadata for NPRS entity has no placeholder for this element so it gets ignored -->
		<xsl:if test="Patients_Per_Day">
			<xsl:copy-of select="Patients_Per_Day"/>
		</xsl:if>
		<!--This is applicable to only to NPRS  but since this template gets called for both.it will be added to both.
   Xtelligent metadata for PRES entity has no placeholder for this element so it gets ignored -->
		<xsl:if test="Contact_Suffix">
			<xsl:copy-of select="Contact_Suffix"/>
		</xsl:if>
		<xsl:if test="Professional_Suffix">
			<xsl:copy-of select="Professional_Suffix"/>
		</xsl:if>
	</xsl:template>
	<!-- This will add info from Prof  to PRES or NonPres.Ensure context is Professional when calling this template -->
	<xsl:template name="ExtarctInfoFromProfessional">
		<xsl:if test="Title">
			<xsl:copy-of select="Title"/>
		</xsl:if>
		<xsl:if test="Gender">
			<xsl:copy-of select="Gender"/>
		</xsl:if>
		<xsl:if test="Birth_Day">
			<xsl:copy-of select="Birth_Day"/>
		</xsl:if>
		<xsl:if test="Birth_Month">
			<xsl:copy-of select="Birth_Month"/>
		</xsl:if>
		<xsl:if test="Birth_Year">
			<xsl:copy-of select="Birth_Year"/>
		</xsl:if>
		<xsl:if test="Speaker_Status">
			<xsl:copy-of select="Speaker_Status"/>
		</xsl:if>
		<xsl:if test="Optout_Indicator">
			<xsl:copy-of select="Optout_Indicator"/>
		</xsl:if>
		<xsl:if test="Optout_Date">
			<xsl:copy-of select="Optout_Date"/>
		</xsl:if>
		<xsl:if test="Optout_Change_Date">
			<xsl:copy-of select="Optout_Change_Date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ExtarctInfoFromPerson">
		<xsl:if test="Professional_Suffix">
			<xsl:copy-of select="Professional_Suffix"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
