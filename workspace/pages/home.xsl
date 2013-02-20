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
              <xsl:with-param name="format" select="'%m-; %d;'" />
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
          <image>
            <xsl:value-of select="image/item/image/filename" />
          </image>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/books-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%m-; %d;'" />
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
          <cover>
            <xsl:value-of select="image/item/image/filename" />
          </cover>
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/doctrines-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%m-; %d;'" />
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
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/quotes-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%m-; %d;'" />
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
        </entry>
      </xsl:for-each>

      <xsl:for-each select="/data/studies-12-latest/entry">
        <entry>
          <date timestamp="{date}">
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%m-; %d;'" />
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
        </entry>
      </xsl:for-each>

    </xsl:variable>

  <xsl:for-each select="exsl:node-set($entries)/entry">
    <xsl:sort select="date/@timestamp" date-type="number" order="descending" />
    <xsl:copy-of select="." />
  </xsl:for-each>

</xsl:template>


<xsl:template match="data">

  <div class="container">

    <div class="row main">

      <xsl:variable name="entries">
        <xsl:call-template name="merge-data-sources" />
      </xsl:variable>

      <xsl:for-each select="exsl:node-set($entries)/entry">
        <div>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="string-length(image) &gt; 0">
                <xsl:text>span4 tile image </xsl:text>
                <xsl:value-of select="class"/>
              </xsl:when>
              <xsl:when test="string-length(cover) &gt; 0">
                <xsl:text>span4 tile cover </xsl:text>
                <xsl:value-of select="class"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>span4 tile </xsl:text>
                <xsl:value-of select="class"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <a href="{uri}">
            <div class="upper">
              <xsl:if test="image != ''">
                <xsl:attribute name="style">
                  <xsl:text>background: url(</xsl:text>
                  <xsl:text>/workspace/uploads/images/</xsl:text>
                  <xsl:value-of select="image"/>
                  <xsl:text>) 50% 0 no-repeat; background-size: 400px;</xsl:text>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="cover != ''">
                <xsl:attribute name="style">
                  <xsl:text>background: url(</xsl:text>
                  <xsl:text>/workspace/uploads/images/</xsl:text>
                  <xsl:value-of select="cover"/>
                  <xsl:text>) 50% 25% no-repeat; background-size: 400px;</xsl:text>
                </xsl:attribute>
              </xsl:if>
              <h3>
                <xsl:value-of select="title"/>
                <span class="pull-right"><xsl:value-of select="date" /></span>
              </h3>
              <div class="content">
                <xsl:call-template name="truncate">
                  <xsl:with-param name="node" select="text" />
                  <xsl:with-param name="length" select="170" />
                </xsl:call-template>
              </div>
            </div>

            <div class="lower">
              <h4>
                <xsl:value-of select="class"/>
              </h4>
            </div>
          </a>
        </div>
      </xsl:for-each>

    </div>

  </div>

</xsl:template>


</xsl:stylesheet>