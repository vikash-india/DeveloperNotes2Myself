<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: The <xsl:output> element defines the format of the output document.
	Syntax: <xsl:output method="xml|html|text|name" version="string" encoding="string" omit-xml-declaration="yes|no" standalone="yes|no" doctype-public="string" doctype-system="string" cdata-section-elements="namelist" indent="yes|no" media-type="string"/>
	Attributes:
		method							: Optional. Defines the output format. The default is XML (but if the first child of the root node is <html> and there are no preceding text nodes, then the default is HTML).Netscape 6 only supports "html" and "xml"
		version							: Optional. Sets the W3C version number for the output format (only used with method="html" or method="xml")
		encoding							: Optional. Sets the value of the encoding attribute in the output
		omit-xml-declaration		: Optional. "yes" specifies that the XML declaration (<?xml...?>) should be omitted in the output. "no" specifies that the XML declaration should be included in the output. The default is "no"
		standalone						: Optional. "yes" specifies that a standalone declaration should occur in the output. "no" specifies that a standalone declaration should not occur in the output. The default is "no". This attribute is not supported by Netscape 6
		doctype-public				: Optional. Sets the value of the PUBLIC attribute of the DOCTYPE declaration in the output
		doctype-system				: Optional. Sets the value of the SYSTEM attribute of the DOCTYPE declaration in the output
		cdata-section-elements	: Optional. A white-space separated list of elements whose text contents should be written as CDATA sections
		indent								: Optional. "yes" indicates that the output should be indented according to its hierarchic structure. "no" indicates that the output should not be indented according to its hierarchic structure. This attribute is not supported by Netscape 6
		media-type						: Optional. Defines the MIME type of the output. The default is "text/xml". This attribute is not supported by Netscape 6
	Notes: 
		1. <xsl:output> is a top-level element, and must appear as a child node of <xsl:stylesheet> or <xsl:transform>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes"/>
</xsl:stylesheet>
