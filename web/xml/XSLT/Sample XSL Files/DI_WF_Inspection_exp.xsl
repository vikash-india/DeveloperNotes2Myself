<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface"  
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="//*[@type_name='Inspection']">
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="name()='Address_Line1' and @xsi:nil ">
						<xsl:element name="Address_Line1">N/A</xsl:element>
					</xsl:when>
					<xsl:when test="name()='City' and @xsi:nil ">
						<xsl:element name="City">N/A</xsl:element>
					</xsl:when>
					<!--<xsl:when test="name()='Region' and @xsi:nil ">
						<xsl:element name="Region">AL</xsl:element>
					</xsl:when> -->
					<xsl:when test="name()='WF_Comments_Climate' or name()='WF_Comments_Secured'  or name()='WF_Result_Secured' or name()='WF_Result_Climate' ">
					</xsl:when>
					<xsl:otherwise>
						<xsl:copy-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:element name="Inspection_Detail_List">
				<xsl:attribute name="type_name">Inspection_Detail_List</xsl:attribute>
				<xsl:element name="Inspection_Detail">
					<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
					<xsl:attribute name="type_name">Inspection_Detail</xsl:attribute>
					<xsl:element name="Inspection_Parameter_ID">1</xsl:element>
					<xsl:element name="Result">
						<xsl:value-of select="WF_Result_Secured"/>
					</xsl:element>
					<xsl:element name="Comment">
						<xsl:value-of select="WF_Comments_Secured"/>
					</xsl:element>
					<xsl:element name="External_ID_1">
						<xsl:value-of select="External_ID_1"/>
					</xsl:element>
				</xsl:element>	
				<xsl:element name="Inspection_Detail">
					<xsl:attribute name="operation"><xsl:value-of select="$op"/></xsl:attribute>
					<xsl:attribute name="type_name">Inspection_Detail</xsl:attribute>
					<xsl:element name="Inspection_Parameter_ID">2</xsl:element>
					<xsl:element name="Result">
						<xsl:value-of select="WF_Result_Climate"/>
					</xsl:element>
					<xsl:element name="Comment">
						<xsl:value-of select="WF_Comments_Climate"/>
					</xsl:element>
					<xsl:element name="External_ID_1">
						<xsl:value-of select="External_ID_1"/>
					</xsl:element>
				</xsl:element>	
			</xsl:element>
		</xsl:copy>
	</xsl:template>

		<!-- Remove the Inspection Detail elements fron Inspection message -->
	<xsl:template match="WF_Result_Secured">
	</xsl:template>
	<xsl:template match="WF_Comments_Secured">
	</xsl:template>
	<xsl:template match="WF_Result_Climate">
	</xsl:template>
	<xsl:template match="WF_Comments_Climate">
	</xsl:template>

</xsl:stylesheet>
