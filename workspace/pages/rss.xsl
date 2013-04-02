<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  extension-element-prefixes="exsl">

<xsl:include href="../utilities/date-time-advanced.xsl" />
<xsl:include href="../utilities/globals.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template name="merge-data-sources">

    <xsl:variable name="entries">
      <xsl:for-each select="/data/articles-all/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m-; %y+; #0h;:#0m;:#0s; GMT'" />
            </xsl:call-template>
          </date>
          <creator>
            <xsl:choose>
              <xsl:when test="author[@items > 1]">
                <xsl:for-each select="author/item">
                  <xsl:value-of select="author/item/name"/>
                  <xsl:if test="position != last">
                    <xsl:text> &amp; </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="author/item/name"/>
              </xsl:otherwise>
            </xsl:choose>
          </creator>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/blog/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="content" disable-output-escaping="yes" />
          </text>
          <xsl:if test="image != ''">
            <image>
              <xsl:value-of select="image/item/image/filename" />
            </image>
          </xsl:if>
          <xsl:for-each select="verses/item">
            <verse>
              <xsl:call-template name="verse-entry" />
            </verse>
          </xsl:for-each>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/doctrines-all/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m-; %y+; #0h;:#0m;:#0s; GMT'" />
            </xsl:call-template>
          </date>
          <creator>
            <xsl:choose>
              <xsl:when test="author[@items > 1]">
                <xsl:for-each select="author/item">
                  <xsl:value-of select="author/item/name"/>
                  <xsl:if test="position != last">
                    <xsl:text> &amp; </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="author/item/name"/>
              </xsl:otherwise>
            </xsl:choose>
          </creator>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/doctrine/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="summary[@mode='formatted']"/>
            <hr />
            <xsl:value-of select="content"/>
          </text>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/quotes-all/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m-; %y+; #0h;:#0m;:#0s; GMT'" />
            </xsl:call-template>
          </date>
          <creator>
            <xsl:text>Jonathan Simcoe</xsl:text>
          </creator>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/quotes/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="commentary" disable-output-escaping="yes" />
          </text>
          <quote>
            <xsl:value-of select="quote" disable-output-escaping="yes" />
          </quote>
          <xsl:choose>
            <xsl:when test="book != ''">
              <image>
                <xsl:value-of select="book/item/image/item/image/filename" />
              </image>
              <author>
                <xsl:value-of select="book/item/author/item/name"/>
              </author>
              <source>
                <xsl:value-of select="$root"/>
                <xsl:text>/books/</xsl:text>
                <xsl:value-of select="book/item/title/@handle"/>
              </source>
              <source-title>
                <xsl:value-of select="book/item/title"/>
              </source-title>
            </xsl:when>
            <xsl:otherwise>
              <author>
                <xsl:value-of select="author/item/name"/>
              </author>
              <source>
                <xsl:value-of select="link"/>
              </source>
              <source-title>
                <xsl:value-of select="source"/>
              </source-title>
            </xsl:otherwise>
          </xsl:choose>
        </entry>
      </xsl:for-each>

    </xsl:variable>

  <xsl:for-each select="exsl:node-set($entries)/entry">
    <xsl:sort select="date/@timestamp" date-type="number" order="descending" />
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
          <dc:creator><xsl:value-of select="creator"/></dc:creator>
          <guid><xsl:value-of select="uri" /></guid>
          <description>
            <xsl:if test="image != ''">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="$root"/>
                  <xsl:text>/workspace/uploads/images/</xsl:text>
                  <xsl:value-of select="image" />
                </xsl:attribute>
              </img>
            </xsl:if>
            <xsl:if test="verse != ''">
              <blockquote>
                <xsl:value-of select="verse"/>
              </blockquote>
            </xsl:if>
            <xsl:if test="quote != ''">
              <blockquote>
                <xsl:value-of select="quote"/>
              </blockquote>
              <cite>
                <xsl:text>—</xsl:text>
                <xsl:value-of select="author"/>
                <xsl:text>, </xsl:text>
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="source"/>
                  </xsl:attribute>
                  <xsl:value-of select="source-title"/>
                </a>
              </cite>
            </xsl:if>
            <xsl:value-of select="text" />
          </description>
        </item>
      </xsl:for-each>

    </channel>
  </rss>
</xsl:template>


</xsl:stylesheet>