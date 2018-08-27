<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Definition: 
	Syntax: 
						...
		
	Attributes:
	Notes: None
-->

<!-- 
	The XSLT namespace has the URI http://www.w3.org/1999/XSL/Transform
	This specification uses a prefix of xsl: for referring to elements in the XSLT namespace. 
	XSLT stylesheets are free to use any prefix, provided that there is a namespace declaration that binds the prefix to the URI of the XSLT namespace. 
-->
<vikash:stylesheet version="1.0" xmlns:vikash="http://www.w3.org/1999/XSL/Transform">
	<vikash:template match="/">
		<html>
			<body>
				<h2>My CD Collection</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th align="left">Title</th>
						<th align="left">Artist</th>
					</tr>
					<vikash:for-each select="catalog/cd">
						<tr>
							<td>
								<vikash:value-of select="title"/>
							</td>
							<td>
								<vikash:value-of select="artist"/>
							</td>
						</tr>
					</vikash:for-each>
				</table>
			</body>
		</html>
	</vikash:template>
</vikash:stylesheet>
