<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Purpose: 
		1. An example of complex sorting using the various options available in XSLT
	Arguments:
		1. Run on file 000-PlayersProfile.xml
	Note:
		1. 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Great Players</h2>
				<table border="1">
					<tr bgcolor="#99CCFF">
						<th>ID</th>
						<th>Name</th>
						<th>Nick Name</th>
						<th>Sports</th>
						<th>Country</th>
						<th>DOB</th>
						<th>Debut</th>
						<th>Income</th>
					</tr>
					<xsl:for-each select="PlayersProfile/Player">
						<!-- <xsl:sort />	  																												Sorts in ascending order on the string version of the Player element. Change the Order in <td> check -->
						<!-- <xsl:sort select="Name"/>																							Sorts in ascending order of Name field 	-->
						<!-- <xsl:sort select="Sports" order="descending"/>															Sorts in descending order of Sports field	-->
						<!-- <xsl:sort select="@id" order="descending"/>						 										Sorts in descending order of ID field. Sorting can be done on attributes as well	-->
						<!-- <xsl:sort select="Income"/>																							Sorts in ascending order by treating Income field as alphanumeric instead of numbers -->
						<!-- <xsl:sort select="Income" data-type="number"/>															Sorts in ascending order by treating Income field as numbers -->
						<!-- <xsl:sort select="Income" data-type="number" order="descending"/>						Sorts in descending order by treating Income field as numbers -->
						<!-- <xsl:sort select="Remarks"/>																						Sorts on field which is not even displayed. In effect the select can have any complex XPath expression -->
		
						<!-- <xsl:sort select="Sports" data-type="text"/> 
							<xsl:sort select="Country" data-type="text"/>																Sorts on multiple field Sports and Country-->

						<!-- Sorting on Date by using Substring function and making the datatype as number -->
						<!--<xsl:sort select="substring(DOB,7,4)" data-type="number"/>  Year  -->
						<!--<xsl:sort select="substring(DOB,3,2)" data-type="number"/>  Month -->
						<!--<xsl:sort select="substring(DOB,1,2)" data-type="number"/>  Day   -->
						<tr>
							<td>
								<xsl:value-of select="@id"/>
							</td>
						
							<td>
								<xsl:value-of select="Name"/>
							</td>
							<td>
								<xsl:value-of select="NickName"/>
							</td>

							<td>
								<xsl:value-of select="Sports"/>
							</td>
							<td>
								<xsl:value-of select="Country"/>
							</td>							
							<td>
								<xsl:value-of select="DOB"/>
							</td>
							<td>
								<xsl:value-of select="Debut"/>
							</td>
							<td>
								<xsl:value-of select="Income"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
