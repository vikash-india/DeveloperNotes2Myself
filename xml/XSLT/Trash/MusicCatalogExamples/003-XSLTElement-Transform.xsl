<!-- 
	Definition: The root element that declares the document to be an XSL style sheet is <xsl:stylesheet> or <xsl:transform>.
	Note: 
		1. <xsl:stylesheet> and <xsl:transform> are completely synonymous and either can be used.
		2. To get access to the XSLT elements, attributes and features we must declare the XSLT namespace at the top of the document.
		3. The xmlns:xsl="http://www.w3.org/1999/XSL/Transform" points to the official W3C XSLT namespace. If you use this namespace, you must also include the attribute version="1.0".
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
</xsl:transform>
