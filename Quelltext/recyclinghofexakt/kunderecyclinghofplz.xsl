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
<link href="../css/responsive.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<div id="head">
<ul>
<li><a href="../index.html">Startseite</a></li>
<li><a href="../geraeteliste/datenbank.xml">Geräteliste</a></li>
<li><a href="../herstellerliste/datenbank.xml">Herstellerliste</a></li>
<li><a href="../kundenliste/datenbank.xml">Kundenliste</a></li>
<li><a href="../plzfehlt/datenbank.xml">PLZ fehlt</a></li>
<li><a href="../recyclinghofexakt/datenbank.xml">Recyclinghof exakt</a></li>
<li><a href="../recyclinghofnahe/datenbank.xml">Recyclinhof in der Nähe</a></li>
</ul>
</div> 
<div id="content">

<div id="links">
	<h1>Kunde</h1>
    <h3><xsl:value-of select="$lily/adresse/name" /></h3>
   <!-- Check ob eine Strasse eingegeben ist -->
     <xsl:if test="$lily/adresse/strasse">
        <p>Straße: <xsl:value-of select="$lily/adresse/strasse" /></p>
     </xsl:if>
     
     <!-- Check ob eine PLZ eingebeben wurde -->
     <xsl:choose>
     <xsl:when test="$lily/adresse/plz">
     <p>PLZ: <xsl:value-of select="$lily/adresse/plz" /></p></xsl:when>
     <xsl:otherwise><p>PLZ: <strong style="color:red;">nicht angegeben</strong></p></xsl:otherwise>
     </xsl:choose>
     
     <!-- Check ob eine PLZ eingebeben wurde -->
     <xsl:choose>
     <xsl:when test="$lily/adresse/ort">
     <p>Ort: <xsl:value-of select="$lily/adresse/ort"/></p></xsl:when>
     </xsl:choose>
    
     <strong>Telefon:</strong>
     <ul>
     <xsl:for-each select="$lily/adresse/telefon">
        <li><xsl:value-of select="text()"/></li>
     </xsl:for-each>
     </ul>
</div>
	
<div id="rechts">
	<h1>Vorgeschlagene Recyclinghoefe</h1>
	<xsl:for-each select="$recyclinghof/recyclinghof">
    <xsl:variable name="aktuellplz" select="adresse/plz" />
    <xsl:choose> 
    <xsl:when test="$lily/adresse/plz = $aktuellplz">
    <h3><xsl:value-of select="adresse/name" /></h3>
    <p>Straße: <xsl:value-of select="adresse/strasse" /></p>
    <p>Ort: <xsl:value-of select="adresse/plz" />&#160;<xsl:value-of select="adresse/ort" /></p>
    <p>Öffnungszeiten:</p>
    <ul>
    <xsl:for-each select="oeffnungszeiten">
    <li><xsl:value-of select="text()" /></li>
    </xsl:for-each>
    </ul>
    <p></p></xsl:when>
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