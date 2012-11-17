<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:include href="../utilities/master.xsl"/>


<xsl:template match="data">
  <div class="wrapper-blog">
    <div class="container">

      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="row">
            <div class="span9">
              <xsl:apply-templates select="/data/articles-all/entry"/>
            </div>
            <div class="span3">
              <h4>Latest Quotes</h4>
              <hr />
              <xsl:apply-templates select="/data/quotes-4-latest/entry"/>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/articles-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-all/entry">
  <div class="article entry">
    <h4>
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
    </h4>
    <h2>
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
      </a>
    </h2>
    <div class="content">
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
  </div>
  <hr class="soften" />
</xsl:template>


<xsl:template match="/data/articles-single/entry">
  <div class="article entry">
    <h4 class="center">
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
    </h4>
    <h1 class="center">
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
      </a>
    </h1>
    <hr class="soften" />
    <xsl:if test="image != ''">
      <img class="img-polaroid" src="{$root}/workspace{image/item/image/@path}/{image/item/image/filename}">
        <xsl:attribute name="alt">
          <xsl:value-of select="image/item/image/caption" />
        </xsl:attribute>
      </img>
      <hr class="soften" />
    </xsl:if>
    <div class="content">
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
  </div>
  <hr class="soften" />
  <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
            <xsl:text>&#8592; Back to </xsl:text>
            <strong>
              <xsl:value-of select="$page-title" />
            </strong>
          </a>
</xsl:template>


<xsl:template match="/data/quotes-4-latest/entry">
  <div class="quote">
    <a href="{$root}/quotes/{title/@handle}" class="blog-entry">
      <blockquote>
        <div class="block">
          <div>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() = 1">
                  <xsl:text>label accent</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>label</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>

            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
            </xsl:call-template>
          </div>
        </div>
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="quote" />
          <xsl:with-param name="length" select="100" />
        </xsl:call-template>
      </blockquote>
    </a>
  </div>
</xsl:template>


</xsl:stylesheet>