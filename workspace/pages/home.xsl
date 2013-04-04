<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>

<xsl:template name="merge-data-sources">

    <xsl:variable name="entries">
      <xsl:for-each select="/data/articles-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
            </xsl:call-template>
          </date>
          <class>
            <xsl:text>blog</xsl:text>
          </class>
          <title>
            <xsl:call-template name="truncate">
              <xsl:with-param name="node" select="title" />
              <xsl:with-param name="length" select="25" />
            </xsl:call-template>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/blog/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="content" disable-output-escaping="yes" />
          </text>
          <xsl:choose>
            <xsl:when test="image != ''">
              <image>
                <xsl:value-of select="image/item/image/filename" />
              </image>
            </xsl:when>
            <xsl:otherwise>
              <image>
                <xsl:text>determine_bg.jpg</xsl:text>
              </image>
            </xsl:otherwise>
          </xsl:choose>

        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/books-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
            </xsl:call-template>
          </date>
          <class>
            <xsl:text>books</xsl:text>
          </class>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/books/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:value-of select="synopsis"/>
          </text>
          <image>
            <xsl:value-of select="image/item/image/filename" />
          </image>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/doctrines-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
            </xsl:call-template>
          </date>
          <class>
            <xsl:text>doctrine</xsl:text>
          </class>
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
          </text>
          <image>
            <xsl:text>bibles.jpg</xsl:text>
          </image>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/quotes-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
            </xsl:call-template>
          </date>
          <class>
            <xsl:text>quotes</xsl:text>
          </class>
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
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="commentary"/>
          </text>
          <xsl:choose>
            <xsl:when test="book/item != ''">
              <image>
                <xsl:value-of select="book/item/image/item/image/filename" />
              </image>
            </xsl:when>
            <xsl:when test="string-length(image) &gt; 0">
              <image>
                <xsl:value-of select="image/item/image/filename" />
              </image>
            </xsl:when>
            <xsl:otherwise>
              <image>
                <xsl:text>books.jpg</xsl:text>
              </image>
            </xsl:otherwise>
          </xsl:choose>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/studies-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
            </xsl:call-template>
          </date>
          <class>
            <xsl:text>studies</xsl:text>
          </class>
          <title>
            <xsl:value-of select="title"/>
          </title>
          <uri>
            <xsl:value-of select="$root" />
              <xsl:text>/studies/</xsl:text>
            <xsl:value-of select="title/@handle" />
          </uri>
          <text>
            <xsl:choose>
              <xsl:when test="summary !=''">
                <xsl:value-of select="summary"/>
              </xsl:when>
              <xsl:when test="content !=''">
                <xsl:value-of select="content"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="doctrine/item/content"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="quote[@mode='formatted']"/>
            <xsl:value-of select="commentary"/>
          </text>
          <xsl:if test="image != ''">
            <image>
              <xsl:value-of select="image/item/image/filename" />
            </image>
          </xsl:if>
        </entry>
      </xsl:for-each>

    </xsl:variable>

  <xsl:for-each select="exsl:node-set($entries)/entry">
    <xsl:sort select="date/@timestamp" date-type="number" order="descending" />
    <xsl:copy-of select="." />
  </xsl:for-each>

</xsl:template>


<xsl:template match="data">

  <div class="wrapper">

    <div class="container">

      <div class="row">

        <xsl:variable name="entries">
          <xsl:call-template name="merge-data-sources" />
        </xsl:variable>

        <xsl:for-each select="exsl:node-set($entries)/entry">

          <xsl:call-template name="global-tile">
            <xsl:with-param name="class" select="class" />
            <xsl:with-param name="asset-link" select="uri" />
            <xsl:with-param name="image" select="image" />
            <xsl:with-param name="title" select="title" />
            <xsl:with-param name="date-formatted" select="date" />
            <xsl:with-param name="text" select="text" />
          </xsl:call-template>

        </xsl:for-each>

      </div>

    </div>
  </div>

</xsl:template>


</xsl:stylesheet>