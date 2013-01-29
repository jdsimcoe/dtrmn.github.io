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
      <br/>
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


<!--

Title Case

<xsl:variable name="CatName">
  <xsl:call-template name="TitleCase">
    <xsl:with-param name="text" select="translate(normalize-space($ypcategoryname),
'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
  </xsl:call-template>
</xsl:variable>

-->


<xsl:template name="TitleCase">
  <xsl:param name="text" />
  <xsl:param name="lastletter" select="' '"/>

  <xsl:if test="$text">
    <xsl:variable name="thisletter" select="substring($text,1,1)"/>
    <xsl:choose>
      <xsl:when test="$lastletter=' '">
        <xsl:value-of select="translate($thisletter,'abcdefghijklmnopqrstuvwxyz',
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$thisletter"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="TitleCase">
      <xsl:with-param name="text" select="substring($text,2)"/>
      <xsl:with-param name="lastletter" select="$thisletter"/>
    </xsl:call-template>
  </xsl:if>

</xsl:template>


<!--

Search and replace

-->


<xsl:template name="string-replace-all">
  <xsl:param name="text" />
  <xsl:param name="replace" />
  <xsl:param name="by" />
  <xsl:choose>
    <xsl:when test="contains($text,$replace)">
      <xsl:value-of select="substring-before($text,$replace)" />
      <xsl:value-of select="$by" />
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="substring-after($text,$replace)" />
        <xsl:with-param name="replace" select="$replace" />
        <xsl:with-param name="by" select="$by" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!--

Book ratings

-->


<xsl:template name="ratings">

  <xsl:param name="i" />
  <xsl:param name="count" />
  <xsl:param name="rating-num" />

  <xsl:if test="$i &lt;= $count">
    <xsl:choose>
      <xsl:when test="$i &lt;= $rating-num">
       <i class="glyphicon-star"></i>
      </xsl:when>
      <xsl:otherwise>
       <i class="glyphicon-star light"></i>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>

  <xsl:if test="$i &lt;= $count">
    <xsl:call-template name="ratings">
      <xsl:with-param name="i">
        <xsl:value-of select="$i + 1"/>
      </xsl:with-param>
      <xsl:with-param name="count">
        <xsl:value-of select="$count"/>
      </xsl:with-param>
      <xsl:with-param name="rating-num">
        <xsl:value-of select="$rating-num"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>


<!--

Edit links

-->

<xsl:template name="edit-entry">

  <xsl:param name="component" />
  <xsl:param name="link">
    <xsl:value-of select="$root" />
    <xsl:text>/symphony/publish/</xsl:text>
    <xsl:value-of select="$component" />
    <xsl:text>/edit/</xsl:text>
    <xsl:value-of select="@id" />
    <xsl:text>/</xsl:text>
  </xsl:param>
  <xsl:param name="class" />

  <xsl:if test="$cookie-username">
    <a href="{$link}" target="_blank" class="edit right float">
      <span class="badge">EDIT</span>
    </a>
  </xsl:if>

</xsl:template>


<!--

Global Pagination

-->

<xsl:template name="cd-pagination">

  <xsl:param name="pagination"     select="$pagination" />
  <xsl:param name="pagination-url" select="$pagination-url" />

  <xsl:call-template name="pagination">
    <xsl:with-param name="pagination" select="$pagination" />
    <xsl:with-param name="pagination-url" select="$pagination-url" />
    <xsl:with-param name="show-range" select="5" />
    <xsl:with-param name="label-previous" select="'←'" />
    <xsl:with-param name="label-next" select="'→'" />
    <xsl:with-param name="class-pagination" select="'pagination pagination-large'" />
    <xsl:with-param name="class-page" select="''" />
    <xsl:with-param name="class-next" select="'next'" />
    <xsl:with-param name="class-previous" select="'prev'" />
    <xsl:with-param name="class-selected" select="'active'" />
    <xsl:with-param name="class-disabled" select="'disabled'" />
    <xsl:with-param name="class-ellipsis" select="'disabled'" />
  </xsl:call-template>

</xsl:template>


</xsl:stylesheet>