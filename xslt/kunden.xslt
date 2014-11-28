<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">

	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<style type="text/css">
					body{
						font-family: Arial, Helvetica, sans-serif;
						font-size:11pt; 
					}

					table{
						width:100%;
					}

					th{
						paddin-left:2px;
						text-align:left;
						height:30px;
						background-color:#99D6FF;
					}

					td{
						vertical-align: top;
						padding:2px;
						color:#666;
						font-size:10pt;
					}

					#kunden tr:nth-child(odd)		{ background-color:#eee; }
					#kunden tr:nth-child(even)		{ background-color:#fff; }

				</style>
				<title>Kunden</title> 
			</head>
			<body>
				<h1>Kunden</h1>
				<table id="kunden" cellpadding="0" cellspacing="0"> 
					<tr>
						<th>Name</th>
						<th>Strasse</th>
						<th>PLZ</th>
						<th>Ort</th>
						<th>Telefon</th>
					</tr>
					<xsl:apply-templates />
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="kundenListe">
		<xsl:for-each select="./*">
			<tr>
				<td>
					<xsl:value-of select="./adresse/name"/>
				</td>
				<td>
					<xsl:value-of select="./adresse/strasse"/>
				</td>
				<td>
					<xsl:value-of select="./adresse/plz"/>
				</td>
				<td>
					<xsl:value-of select="./adresse/ort"/>
				</td>
				<td>
					<table>
						<xsl:for-each select="./adresse/telefon">
							<tr >
								<td class="trTelefon">
									<xsl:value-of select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
