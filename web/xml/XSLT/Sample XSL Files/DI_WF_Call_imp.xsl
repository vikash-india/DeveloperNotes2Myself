<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:di="http://www.dendrite.com/2004/XTelligent/DataloadInterface" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		<xsl:output cdata-section-elements="Signature"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	
	<xsl:template match="//*[@type_name='Call']">
		<xsl:variable name="op" select="@operation"/>
		<xsl:copy>
		
			<xsl:apply-templates select="@*|* "/>
			
<!-- This will Added the sub entity Event_Address  -->
			<xsl:if test="Address_ID or Address_Line_1 or Address_Line_2 or Address_Line_3 or City or Postal_Area or Region ">
				<xsl:element name="Event_Address">
				<xsl:attribute name="type_name">Event_Address</xsl:attribute>
					<xsl:choose>
						<xsl:when test="$op = 'INSERT'">
							<xsl:attribute name="operation">INSERT</xsl:attribute>
						</xsl:when>
						<xsl:when test="$op = 'REFRESH'">
							<xsl:attribute name="operation">REFRESH</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="operation">UPDATE</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>	
		
</xsl:stylesheet>

