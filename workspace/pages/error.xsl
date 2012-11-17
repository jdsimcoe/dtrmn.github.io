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
	<div class="container">
    <div class="marketing">
      <i class="glyphicon-th-list icon-large"></i>
      <h2>Browse Our Catalog</h2>
      <p class="marketing-byline">We have a growing catalog of Gospel-centered materials. Below is an introduction to what we offer.</p>
    </div>
  </div>
  <div class="stripe first">
    <div class="container">
      <h3>Recent Bible Doctrines</h3>
      <br />
      <div class="row">
        <xsl:apply-templates select="/data/doctrines-3-latest/entry"/>
        <div class="span4 doctrine">
          <a href="">
            <h3>Coming Soon...</h3>
            <div class="summary"> </div>
          </a>
        </div>
      </div>

    </div>
  </div>

  <div class="stripe second">
    <div class="container">
      <h3>From the Blog</h3>
      <div class="row">
        <xsl:apply-templates select="/data/articles-4-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe third">
    <div class="container">
      <h3>Latest Quotes</h3>
      <div class="row">
        <xsl:apply-templates select="/data/quotes-4-latest/entry"/>
      </div>
    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-4-latest/entry">
  <div class="span3">
    <a href="{$root}/blog/{title/@handle}" class="blog-entry">
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
      <h4>
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="title" />
          <xsl:with-param name="length" select="25" />
        </xsl:call-template>
      </h4>
      <p>
        <xsl:call-template name="truncate">
            <xsl:with-param name="node" select="content" />
            <xsl:with-param name="length" select="290" />
        </xsl:call-template>
      </p>
    </a>
  </div>
</xsl:template>


<xsl:template match="/data/quotes-4-latest/entry">
  <div class="span3">
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
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p>
          <xsl:text>by </xsl:text>
          <xsl:value-of select="cite" />
        </p>
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="quote" />
          <xsl:with-param name="length" select="100" />
        </xsl:call-template>
      </blockquote>
    </a>
  </div>
</xsl:template>


<xsl:template match="/data/doctrines-3-latest/entry">
  <div class="span4 doctrine">
    <a href="{$root}/doctrine/{title/@handle}">
      <h3>
        <xsl:value-of select="title" />
        <span>
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
        </span>
      </h3>
      <div class="summary">
        <xsl:value-of select="summary" />
      </div>
      <br />
      <div class="right">Study <strong><xsl:value-of select="title" /> &#8594;</strong></div>
    </a>
  </div>
</xsl:template>


</xsl:stylesheet>