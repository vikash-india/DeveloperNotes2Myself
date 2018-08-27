<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Sample_Transaction']">
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
			<xsl:if test="From_Address_Line1 or From_Address_Line2 or From_City or From_Region or From_Postal_Area or From_Country or To_Address_Line1 or To_Address_Line2 or To_City or To_Region or To_Postal_Area or To_Country">
				<xsl:element name="Sample_Shipment_Address_List">
					<xsl:attribute name="type_name">Sample_Shipment_Address_List</xsl:attribute>
					<xsl:if test="From_Address_Line1 or From_Address_Line2 or From_City or From_Region or From_Postal_Area or From_Country">
						<xsl:element name="Sample_Shipment_Address">
							<xsl:attribute name="type_name">Sample_Shipment_Address</xsl:attribute>
							<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
							<xsl:element name="Type">FROM</xsl:element>
							<xsl:element name="Line_1_Address">
								<xsl:value-of select="From_Address_Line1"/>
							</xsl:element>
							<xsl:element name="Line_2_Address">
								<xsl:value-of select="From_Address_Line2"/>
							</xsl:element>
							<xsl:element name="City">
								<xsl:value-of select="From_City"/>
							</xsl:element>
							<xsl:element name="Region">
								<xsl:value-of select="From_Region"/>
							</xsl:element>
							<xsl:element name="Postal_Area">
								<xsl:value-of select="From_Postal_Area"/>
							</xsl:element>
							<xsl:element name="Postal_Area_2">
								<xsl:value-of select="From_Postal_Ext"/>
							</xsl:element>
							<xsl:element name="Country">
								<xsl:value-of select="From_Country"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:if test="To_Address_Line1 or To_Address_Line2 or To_City or To_Region or To_Postal_Area or To_Country">
						<xsl:element name="Sample_Shipment_Address">
							<xsl:attribute name="type_name">Sample_Shipment_Address</xsl:attribute>
							<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
							<xsl:element name="Type">TO</xsl:element>
							<xsl:element name="Line_1_Address">
								<xsl:value-of select="To_Address_Line1"/>
							</xsl:element>
							<xsl:element name="Line_2_Address">
								<xsl:value-of select="To_Address_Line2"/>
							</xsl:element>
							<xsl:element name="City">
								<xsl:value-of select="To_City"/>
							</xsl:element>
							<xsl:element name="Region">
								<xsl:value-of select="To_Region"/>
							</xsl:element>
							<xsl:element name="Postal_Area">
								<xsl:value-of select="To_Postal_Area"/>
							</xsl:element>
							<xsl:element name="Postal_Area_2">
								<xsl:value-of select="To_Postal_Ext"/>
							</xsl:element>
							<xsl:element name="Country">
								<xsl:value-of select="To_Country"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
