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
	<h1>Geräte</h1>
    <xsl:for-each select="$kunden/kunde">
    <h3><xsl:value-of select="adresse/name" /></h3>
     <xsl:when test="adresse/strasse/ != ''">
        <p>Strasse: <xsl:value-of select="adresse/strasse"/></p></xsl:when>
     <xsl:otherwise></xsl:otherwise>
    <p>PLZ: <xsl:value-of select="adresse/plz"/></p>
    <p>Ort: <xsl:value-of select="adresse/ort"/></p>
    <strong>Telefon:</strong>
    <ul>
    <xsl:for-each select="adresse">
    <li><xsl:value-of select="telefon"/></li>
    </xsl:for-each>
    </ul>
    </xsl:for-each>
</div>
	
<div id="recyclinghof">
	<h1>Vorgeschlagener Recyclinghöfe</h1>
	<xsl:for-each select="$recyclinghof">
    <p>
    <h3><xsl:value-of select="$recyclinghof/recyclinghof" /></h3>
    <xsl:value-of select="recyclinghof/adresse"/>
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