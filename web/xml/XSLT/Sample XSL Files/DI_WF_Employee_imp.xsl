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
				<xsl:variable name="StatusType" select="Status_Type"/>
				<xsl:variable name="StatusID" select="Employee_Status_ID"/>
				<xsl:variable name="StatusVal" select="Status"/>
				<xsl:if test=" (Status_Type='SMPL' or Status_Type='EMPL')  ">
					<xsl:choose>
						<xsl:when test="Status_Type='SMPL' ">
							<xsl:copy-of select="."/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$StatusVal != 'LEAV' ">
								<xsl:copy>
									<xsl:for-each select="@* | *">
										<xsl:choose>
											<xsl:when test=" name()='Employee_Status_ID' ">
												<xsl:element name="WF_Employee_Status_ID">
													<xsl:copy-of select="text()|@*"/>
												</xsl:element>
											</xsl:when>
											<xsl:when test=" name()='Status' ">
												<xsl:element name="WF_Status">
													<xsl:copy-of select="text()|@*"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:copy-of select="."/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</xsl:copy>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
