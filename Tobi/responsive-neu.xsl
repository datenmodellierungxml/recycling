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
    <nav>
		<ul>
			<li><a href="home.html">Ger&auml;te</a></li>
			<li><a href="products.html">Recyclinghöfe</a></li>
			<li><a href="about.html">Hersteller</a></li>
			<li><a href="help.html">Kunden</a></li>
		</ul>
	</nav>
<div id="content">

<div id="hersteller">
	<h1>Produkte</h1>
    <xsl:for-each select="$geraete/geraet">
	<p>
    <h3><xsl:value-of select="@geraetBezeichnung" /></h3>
    <p><xsl:value-of select="@zustand"/></p>
    <p><xsl:value-of select="@geraetkategorie"/></p>
    <p><xsl:value-of select="@verschmutzungsgrad"/></p>
    
    <xsl:for-each select="bestandteile/bestandteil">
    <p><xsl:value-of select="@name"/></p>
    </xsl:for-each>
    
    </p>
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