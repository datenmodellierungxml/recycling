<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="geraete" select="/datenbank/geraeteListe" />
<xsl:variable name="hersteller" select="/datenbank/herstellerListe" />
<xsl:variable name="kunden" select="/datenbank/kundenListe" />
<xsl:variable name="recyclinghof" select="/datenbank/recyclinghofListe" />

<xsl:template match="/">
<html>
<head>
<link href="responsive.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
	<div id="head"></div>
   
<div id="content">

<div id="geraete">
	<h1>Kunden</h1>
    <xsl:for-each select="$kunden/kunde">
    <xsl:sort select="@kundenID"/>
	<p>
    <h3><xsl:value-of select="position()" />. Kunde</h3>
    <p><strong>Kunden-ID: </strong><xsl:value-of select="@kundenID"/></p>
    <p><strong>Name: </strong><xsl:value-of select="adresse/name"/></p>
    <p><strong>Straße: </strong><xsl:value-of select="adresse/strasse"/></p>
    <p><strong>PLZ: <xsl:value-of select="adresse/plz"/>&#160;</strong><strong>Ort: </strong><xsl:value-of select="adresse/ort"/></p>
    <p><strong>Gerät: </strong><xsl:value-of select="@geraet"/></p>
    <p><strong>Gerätekategorie: </strong><xsl:value-of select="@geraetekategorie"/></p>
    <strong>Telefonnummern:</strong>
    <ul>
        <xsl:for-each select="adresse/telefon">
        <li><xsl:value-of select="text()"/></li>
     </xsl:for-each>
    </ul>
    </p>
    </xsl:for-each>
</div>
	
</div>

<div id="footer"></div>
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>