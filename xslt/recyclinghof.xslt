<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">

	<xsl:template match="/">
		<html>
			<body>
				<table> 
					<xsl:apply-templates />
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="recyclinghofListe">
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
					<xsl:value-of select="./adresse/telefon"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
</xsl:stylesheet>