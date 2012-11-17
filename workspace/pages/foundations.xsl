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

  <div class="wrapper-studies">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/studies-all/entry"/>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span9">
              <xsl:apply-templates select="/data/studies-single/entry"/>
            </div>
            <div class="span3">
              <h4>Recent Doctrines</h4>
              <hr class="soften" />
              <xsl:apply-templates select="/data/doctrines-3-latest/entry"/>
            </div>
          </div>
          <hr class="soften" />
          <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">&#8592; Back</a>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>


</xsl:template>

<xsl:template match="/data/studies-all/entry">
  <h2>
    <xsl:value-of select="title" />
  </h2>
</xsl:template>


<xsl:template match="/data/studies-single/entry">

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