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

  <div class="wrapper-doctrine">

    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <p class="marketing-byline">Studying Biblical doctrine is how we engage with the God of the Universe. Our depth in knowing God and in being like God is related to how rightly know Him. God has revelead himself in the Scriptures so we can know Him, worship Him and follow Him into mission.</p>
            <hr class="soften" />
            <br />
          </div>

          <div class="row">
            <xsl:apply-templates select="/data/doctrines-all/entry"/>
            <div class="span4 doctrine">
              <a href="">
                <h3>Coming Soon...</h3>
                <div class="summary"> </div>
              </a>
            </div>
            <div class="span4 doctrine">
              <a href="">
                <h3>Coming Soon...</h3>
                <div class="summary"> </div>
              </a>
            </div>
            <div class="span4 doctrine">
              <a href="">
                <h3>Coming Soon...</h3>
                <div class="summary"> </div>
              </a>
            </div>
            <div class="span4 doctrine">
              <a href="">
                <h3>Coming Soon...</h3>
                <div class="summary"> </div>
              </a>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="doctrines-single/entry"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>

  </div>
</xsl:template>

<xsl:template match="/data/doctrines-all/entry">
  <div class="span4 doctrine">
    <a href="{$root}/{$root-page}/{title/@handle}">
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

<xsl:template match="doctrines-single/entry">
  <div class="container entry">
    <div class="title-label">The <strong>Doctrine</strong> of</div>
    <h1>
      <span><xsl:value-of select="title" /></span>
    </h1>
    <div class="summary">
      <xsl:value-of select="summary" disable-output-escaping="yes" />
    </div>
    <hr class="soften" />
    <div class="content">
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
    <hr class="soften" />
    <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">&#8592; Back</a>
  </div>
</xsl:template>


</xsl:stylesheet>