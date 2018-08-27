<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ts="http://schemas.dendrite.com/IS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instances" xmlns:xtc="http://schemas/dendrite/xt/core" xmlns:xtd="http://schemas/dendrite/xt/datatypes" xmlns:dts="http://schemas/dendrite/xt/database" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//*[@type_name='Order']">
		<xsl:variable name="operation" select="@operation"/>
		<xsl:variable name="ObjID" select="@objectId"/>
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="*[name() != 'Order_Line_Number' and name() != 'Product_Value' and name() != 'Product_Name' and name() != 'Order_Detail_Status' and name() != 'Order_Detail_Status_Reason' and name() != 'Expected_Delivery_Date' and name() != 'Expected_Shipment_Date' and name() != 'Requested_Unit_Of_Measure' and name() != 'Requested_Quantity' and name() != 'Shipped_Quantity' ] "/>
			<xsl:if test="Order_Line_Number or Product_Value or Product_Name or Order_Detail_Status or Order_Detail_Status_Reason or Expected_Delivery_Date or Expected_Shipment_Date or Requested_Unit_Of_Measure or Requested_Quantity or Shipped_Quantity">
				<xsl:element name="Order_Detail_List">
					<xsl:attribute name="type_name">Order_Detail_List</xsl:attribute>
						<!--xsl:call-template name="CreateCustomerIdentifier">
								<xsl:with-param name="operation" select="$op"/>
						</xsl:call-template-->
						<xsl:element name="Order_Detail">
							<xsl:attribute name="operation">
								<xsl:value-of select="$operation"/>
							</xsl:attribute>
							<xsl:attribute name="objectId">
								<xsl:value-of select="$ObjID"/>
							</xsl:attribute>
							<xsl:attribute name="type_name">Order_Detail</xsl:attribute>
							<xsl:for-each select="Order_Line_Number | Product_Value | Product_Name | Order_Detail_Status | Order_Detail_Status_Reason | Expected_Delivery_Date | Expected_Shipment_Date | Requested_Unit_Of_Measure | Requested_Quantity | Shipped_Quantity">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
