<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//Employee_Status_List">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:for-each select="Employee_Status">
				<xsl:if test="Employee_Status_ID and not(Employee_Status_ID/@xsi:nil) and Status and not(Status/@xsi:nil)">
					<xsl:element name="Employee_Status">
						<xsl:apply-templates select="@*"/>
						<xsl:element name="Employee_Status_ID">
							<xsl:apply-templates select="Employee_Status_ID/@* | Employee_Status_ID/text()"/>
						</xsl:element>
						<xsl:element name="Status_Type">SMPL</xsl:element>
						<xsl:element name="Status">
							<xsl:apply-templates select="Status/@* | Status/text()"/>
						</xsl:element>
						<xsl:element name="Activity_Status">
							<xsl:apply-templates select="Activity_Status/@* | Activity_Status/text()"/>
						</xsl:element>
						<xsl:element name="Effective_Date">
							<xsl:apply-templates select="Effective_Date/@* | Effective_Date/text()"/>
						</xsl:element>
						<xsl:element name="End_Date">
							<xsl:apply-templates select="End_Date/@* | End_Date/text()"/>
						</xsl:element>
						<xsl:element name="External_ID_1">
							<xsl:apply-templates select="External_ID_1/@* | External_ID_1/text()"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<xsl:if test="WF_Employee_Status_ID and not(WF_Employee_Status_ID/@xsi:nil) and WF_Status and not(WF_Status/@xsi:nil)">
					<xsl:element name="Employee_Status">
						<xsl:apply-templates select="@*"/>
						<xsl:element name="Employee_Status_ID">
							<xsl:apply-templates select="WF_Employee_Status_ID/@* | WF_Employee_Status_ID/text()"/>
						</xsl:element>
						<xsl:element name="Status_Type">EMPL</xsl:element>
						<xsl:element name="Status">
							<xsl:apply-templates select="WF_Status/@* | WF_Status/text()"/>
						</xsl:element>
						<xsl:element name="Activity_Status">
							<xsl:apply-templates select="Activity_Status/@* | Activity_Status/text()"/>
						</xsl:element>
						<xsl:element name="Effective_Date">
							<xsl:apply-templates select="Effective_Date/@* | Effective_Date/text()"/>
						</xsl:element>
						<xsl:element name="End_Date">
							<xsl:apply-templates select="End_Date/@* | End_Date/text()"/>
						</xsl:element>
						<xsl:element name="External_ID_1">
							<xsl:apply-templates select="External_ID_1/@* | External_ID_1/text()"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
