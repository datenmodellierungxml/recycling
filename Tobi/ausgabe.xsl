<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="hersteller" select="./herstellerListe"

<xsl:template match="/">
<html>
<head>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--<div id="container">
<div id="head">JJT Recycling</div>
<xsl:apply-templates/>
</div>-->
</body>
</html>
</xsl:template>

<xsl:template match="produkt">
<xsl:apply-templates select="hersteller"/>
<xsl:apply-templates select="recyclinghof"/>
</xsl:template>

<xsl:template match="hersteller">
<div id="hersteller">
<p><xsl:value-of select="."/></p>
</div>
</xsl:template>

<xsl:template match="recyclinghof">
<div id="recyclinghof">
<xsl:for-each select=".">
<p><xsl:value-of select="."/></p>
</xsl:for-each>
</div>
</xsl:template>

</xsl:stylesheet>