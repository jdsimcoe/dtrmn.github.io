<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl">

<xsl:import href="../utilities/date-time-advanced.xsl" />

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template name="merge-data-sources">

    <xsl:variable name="entries">
      <xsl:for-each select="/data/articles-all/entry">
        <entry>
          <date>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m+; %y+; #0h;:#0m;:#0s; -0700'" />
            </xsl:call-template>
          </date>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/blog/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="content"/>
          </text>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/doctrines-all/entry">
        <entry>
          <date>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m+; %y+; #0h;:#0m;:#0s; -0700'" />
            </xsl:call-template>
          </date>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/doctrine/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="summary"/>
            <hr />
            <xsl:value-of select="content"/>
          </text>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/quotes-all/entry">
        <entry>
          <date>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m+; %y+; #0h;:#0m;:#0s; -0700'" />
            </xsl:call-template>
          </date>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/quotes/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="quote"/>
            <xsl:value-of select="commentary"/>
          </text>
        </entry>
      </xsl:for-each>

    </xsl:variable>

  <xsl:for-each select="exsl:node-set($entries)/entry">
    <xsl:sort select="date" date-type="number" order="descending" />
    <xsl:copy-of select="." />
  </xsl:for-each>

</xsl:template>

<xsl:template match="/">
	<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
      <title><xsl:value-of select="$website-name"/></title>
      <link><xsl:value-of select="$root"/></link>
      <description><xsl:value-of select="$website-name"/> Feed</description>
      <language>en-us</language>
      <generator>Symphony (build <xsl:value-of select="$symphony-version"/>)</generator>
      <atom:link href="{$root}/rss/" rel="self" type="application/rss+xml" />

      <xsl:variable name="entries">
        <xsl:call-template name="merge-data-sources" />
      </xsl:variable>

      <xsl:for-each select="exsl:node-set($entries)/entry">
        <item>
          <title><xsl:value-of select="title"/></title>
          <link><xsl:value-of select="uri" /></link>
          <pubDate><xsl:value-of select="date" /></pubDate>
          <guid><xsl:value-of select="uri" /></guid>
          <description><xsl:value-of select="text" /></description>
        </item>
      </xsl:for-each>

    </channel>
  </rss>
</xsl:template>


</xsl:stylesheet>