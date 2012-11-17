<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--

Truncate

USAGE:

  <xsl:apply-templates select="description" mode="truncate" />

-->

<xsl:strip-space elements="*" />
<!-- limit: the truncation limit -->
<xsl:variable name="limit" select="250" />
<!-- t: Total number of characters in the set -->
<xsl:variable name="t" select="string-length(normalize-space(//body))" />


<xsl:template match="*" mode="truncate">

  <xsl:variable name="preceding-strings">
    <xsl:copy-of select="preceding::text()[ancestor::body]" />
  </xsl:variable>
  <!-- p: number of characters up to the current node -->
  <xsl:variable name="p" select="string-length(normalize-space($preceding-strings))" />

  <xsl:if test="$p &lt; $limit">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*" mode="truncate" />
      <xsl:apply-templates mode="truncate" />
    </xsl:element>
  </xsl:if>

</xsl:template>


<xsl:template match="text()" mode="truncate">

  <xsl:variable name="preceding-strings">
    <xsl:copy-of select="preceding::text()[ancestor::body]" />
  </xsl:variable>
  <!-- p: number of characters up to the current node -->
  <xsl:variable name="p" select="string-length(normalize-space($preceding-strings))" />
  <!-- c: number of characters including current node -->
  <xsl:variable name="c" select="$p + string-length(.)" />

  <xsl:choose>
    <xsl:when test="$limit &lt;= $c">
      <xsl:value-of select="substring(., 1, ($limit - $p))" disable-output-escaping="yes" />
      <xsl:text>&#160;..</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="." />
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template match="@*" mode="truncate">

  <xsl:attribute name="{name(.)}"><xsl:value-of select="." /></xsl:attribute>

</xsl:template>


<!--

Truncate

USAGE:

  <xsl:call-template name="truncate" />

  <xsl:call-template name="truncate">
    <xsl:with-param name="node" select="[xpath]" />
    <xsl:with-param name="length" select="250" />
  </xsl:call-template>

-->

<xsl:template name="truncate">

  <xsl:param name="node" select="." />
  <xsl:param name="length" select="250" />

  <xsl:choose>
    <xsl:when test="string-length($node) > $length">
      <xsl:value-of select="substring($node, 0, $length)" disable-output-escaping="yes" />
      <xsl:text>&#160;..</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$node" disable-output-escaping="yes" />
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!--

Upper or lowercase in English

http://stackoverflow.com/questions/3053828/lowercase-conversion-in-xsl

To convert a string to lower case or uppercase you can use the XPath 1.0 function translate:

First define your alphabets for lower case and upper case letters. Note that the position of each pair of characters needs to be the same:

<xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

Then you can convert to upper case:
<xsl:value-of select="translate($toconvert,$en-lowercase-letters,$en-uppercase-letters)"/>

or to lower case
<xsl:value-of select="translate($toconvert,$en-uppercase-letters,$en-lowercase-letters)"/>

-->

<xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>


</xsl:stylesheet>