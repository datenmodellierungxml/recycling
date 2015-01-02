<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="geraete" select="/datenbank/geraeteListe" />
<xsl:variable name="hersteller" select="/datenbank/herstellerListe" />
<xsl:variable name="kunden" select="/datenbank/kundenListe" />
<xsl:variable name="recyclinghof" select="/datenbank/recyclinghofListe" />

<xsl:variable name="lily" select="$kunden/kunde[@kundenID='11112014_35']" />

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
	<h1>Kunde</h1>
    <h3><xsl:value-of select="$lily/adresse/name" /></h3>
   <!-- Check ob eine Strasse eingegeben ist -->
     <xsl:if test="$lily/adresse/strasse">
        <p>Straße: <xsl:value-of select="text()" /></p>
     </xsl:if>
     
     <!-- Check ob eine PLZ eingebeben wurde -->
     <xsl:choose>
     <xsl:when test="$lily/adresse/plz">
     <p>PLZ: <xsl:value-of select="plz" /></p></xsl:when>
     <xsl:otherwise><p>PLZ: <strong style="color:red;">nicht angegeben</strong></p></xsl:otherwise>
     </xsl:choose>
     
     <!-- Check ob eine PLZ eingebeben wurde -->
     <xsl:choose>
     <xsl:when test="$lily/adresse/ort">
     <p>Ort: <xsl:value-of select="text()"/></p></xsl:when>
     </xsl:choose>
    
     <strong>Telefon:</strong>
     <ul>
     <xsl:for-each select="$lily/adresse/telefon">
        <li><xsl:value-of select="text()"/></li>
     </xsl:for-each>
     </ul>
     <p>Möchte sein Geräte <strong><xsl:value-of select="$lily/@geraet"/></strong> zurückgeben.</p>
     <p>Es handelt sich hierbei um ein <strong><xsl:value-of select="$lily/@geraetekategorie"/></strong>.</p>
</div>
	
<div id="recyclinghof">
	<h1>Vorgeschlagene Recyclinghoefe</h1>
	<xsl:for-each select="$recyclinghof/recyclinghof/adresse/plz">
    <xsl:variable name="aktuellplz" select="$recyclinghof/recyclinghof/adresse/plz" />
    <xsl:choose> 
    <xsl:when test="$lily/adresse/plz = $aktuellplz">
    <p>Recyclinghof: <xsl:value-of select="recyclinghof/adresse/name" /></p></xsl:when>
    <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
    </xsl:for-each>
</div>

</div>

<div id="footer"></div>
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>