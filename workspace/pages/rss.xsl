<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time-advanced.xsl" />

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="data">
	<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
      <title><xsl:value-of select="$website-name"/></title>
      <link><xsl:value-of select="$root"/></link>
      <description><xsl:value-of select="$website-name"/> Feed</description>
      <language>en-us</language>
      <generator>Symphony (build <xsl:value-of select="$symphony-version"/>)</generator>
      <atom:link href="{$root}/rss/" rel="self" type="application/rss+xml" />

      <xsl:for-each select="/data/articles-all/entry">
        <item>
          <title><xsl:value-of select="title"/></title>
          <link>
            <xsl:value-of select="$root" />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$root-page" />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </link>
          <pubDate>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m+; %y+; #0h;:#0m;:#0s; -0700'" />
            </xsl:call-template>
          </pubDate>
          <guid>
            <xsl:value-of select="$root" />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$root-page" />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </guid>
          <description>
            <xsl:value-of select="content" />
          </description>
        </item>
      </xsl:for-each>

    </channel>
  </rss>
</xsl:template>

</xsl:stylesheet>