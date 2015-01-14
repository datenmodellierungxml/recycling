<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="geraete" select="/datenbank/geraeteListe" />
<xsl:variable name="hersteller" select="/datenbank/herstellerListe" />
<xsl:variable name="kunden" select="/datenbank/kundenListe" />
<xsl:variable name="recyclinghof" select="/datenbank/recyclinghofListe" />

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
<li><a href="../kundenliste/datenbank.xml">Kundeliste</a></li>
<li><a href="../plzfehlt/datenbank.xml">PLZ fehlt</a></li>
<li><a href="../recyclinghofexakt/datenbank.xml">Recyclinghof exakt</a></li>
<li><a href="../recyclinghofnahe/datenbank.xml">Recyclinhof in der Nähe</a></li>
</ul>
</div>
<div id="content">
<div id="links">
	<h1>Geräte</h1>
    <xsl:for-each select="$geraete/geraet">
	<p>
    <h3><xsl:value-of select="@geraetBezeichnung" /></h3>
    <p><strong>Kategorie: </strong> <xsl:value-of select="@geraetekategorie"/></p>
    <p><strong>Zustand: </strong> <xsl:value-of select="@zustand"/></p>
    <p><strong>Verschmutzungsgrad: </strong> <xsl:value-of select="@verschmutzungsgrad"/></p>
    <strong>Bestandteile:</strong>
    <ul>
    <xsl:for-each select="bestandteile/bestandteil">
    <li><xsl:value-of select="@name"/> (<xsl:value-of select="@anteil"/>%)</li>
    </xsl:for-each>
    </ul>
    </p>
    	<p><strong>Recyclinggrad: <xsl:value-of select="format-number(sum(bestandteile/bestandteil/@recyclinggrad) div count(bestandteile/bestandteil), '###,###,##0.00')"/> %</strong></p>
    </xsl:for-each>
</div>
	
<!--<div id="recyclinghof">
	<h1>Vorgeschlagener Recyclinghöfe</h1>
	<xsl:for-each select="$recyclinghof">
    <p>
    <h3><xsl:value-of select="$recyclinghof/recyclinghof" /></h3>
    <xsl:value-of select="recyclinghof/adresse"/>
    </p>
	</xsl:for-each>
</div>
-->
</div>

<div id="footer"></div>
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>