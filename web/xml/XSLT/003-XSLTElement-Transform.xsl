<!--
	Definition: The root element that declares the document to be an XSL style sheet is <xsl:stylesheet> or <xsl:transform>.
	Syntax: 	  <xsl:transform id="name" version="version" extension-element-prefixes="list" exclude-result-prefixes="list">
						...
					  </xsl:transform>
	Attributes:
					version									: Required. Specifies the XSLT version of the style sheet
					extension-element-prefixes	: Optional. A white space separated list of namespace prefixes used for extension elements. This attribute is not supported by Netscape 6
					exclude-result-prefixes			: Optional. A white space separated list of namespace prefixes that should not be sent to the output
					id												: Optional. A unique id for the style sheet. This attribute is not supported by Netscape 6
	Note: 
		1. <xsl:stylesheet> and <xsl:transform> are completely synonymous and either can be used.
		2. To get access to the XSLT elements, attributes and features we must declare the XSLT namespace at the top of the document.
		3. The xmlns:xsl="http://www.w3.org/1999/XSL/Transform" points to the official W3C XSLT namespace. If you use this namespace, you must also include the attribute version="1.0".
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
</xsl:transform>
