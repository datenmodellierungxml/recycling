<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<link href="responsive.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
	<div id="head"></div>
    <!--<nav>
		<ul>
			<li><a href="home.html">Produkte</a></li>
			<li><a href="products.html">Recyclingh&ouml;fe</a></li>
			<li><a href="about.html">Hersteller</a></li>
			<li><a href="help.html">Kunden</a></li>
		</ul>
	</nav>-->
<div id="content">

<div id="hersteller">
	<h1>Produkte</h1>
    <h2>Anzahl:</h2>
    <xsl:for-each select="datenbank/produktListe/produkt">
	<xsl:sort select="@produktBezeichnung" />
	<p>
    <h3><xsl:value-of select="@produktBezeichnung" /></h3>
    <xsl:value-of select="hersteller"/>
    </p>
    </xsl:for-each>
</div>
	
<div id="recyclinghof">
	<h3>Recyclingh&ouml;fe</h3>
	<p>Recyclinghof 1</p>
	<p>Recyclinghof 2</p>
	<p>Recyclinghof 3</p>
	<p>Recyclinghof 4</p>
</div>
</div>
<div id="footer"></div>
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>


<!--<xsl:template match="/">
<html>
<head>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<div id="head">JJT Recycling</div>
<xsl:for-each select="datenbank/produktListe/produkt">
<xsl:sort select="@produktBezeichnung" />
<div id="produkt">
<h2><xsl:value-of select="@produktBezeichnung" /></h2>
<div id="hersteller"><xsl:value-of select="hersteller"/></div>
</div>
</xsl:for-each>
</div>
</body>
</html>
</xsl:template>
-->