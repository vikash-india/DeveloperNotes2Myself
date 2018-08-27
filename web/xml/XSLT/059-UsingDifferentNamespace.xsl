<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. How to use different namespace instead of xsl. This XSLT uses Vikash instead of xsl
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. The XSLT namespace has the URI http://www.w3.org/1999/XSL/Transform. This specification uses a prefix of xsl: for referring to elements in the XSLT namespace. XSLT stylesheets are free to use any prefix, provided that there is a namespace declaration that binds the prefix to the URI of the XSLT namespace. 
-->
<Vikash:stylesheet version="1.0" xmlns:Vikash="http://www.w3.org/1999/XSL/Transform">
	<Vikash:template match="/">
		<html>
			<body>
				<h2>Great Players</h2>
				<table border="1">
					<tr bgcolor="#99CCFF">
						<th align="left">Name</th>
						<th align="left">Sports</th>
					</tr>
					<Vikash:for-each select="PlayersProfile/Player">
						<tr>
							<td>
								<Vikash:value-of select="Name"/>
							</td>
							<td>
								<Vikash:value-of select="Sports"/>
							</td>
						</tr>
					</Vikash:for-each>
				</table>
			</body>
		</html>
	</Vikash:template>
</Vikash:stylesheet>
