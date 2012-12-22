<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper-doctrine">

    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <i class="glyphicon-book icon-large"></i>
            <h2>Why Study Doctrines of the Bible?</h2>
            <p class="marketing-byline">Studying Biblical doctrine is how we engage with the God of the Universe. Our depth in knowing God and in being like God is related to how rightly know Him. God has revelead himself in the Scriptures so we can know Him, worship Him and follow Him into mission.</p>
            <hr class="soften" />
            <br />
          </div>

          <div class="row">
            <xsl:apply-templates select="/data/doctrines-all/entry"/>
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


<xsl:template match="doctrines-single/entry">
  <div class="container entry span8 offset2">
    <xsl:call-template name="edit-entry">
      <xsl:with-param name="component" select="'doctrines'"/>
    </xsl:call-template>
    <div class="title-label">The <strong>Doctrine</strong> of</div>
    <h1>
      <span>
        <xsl:value-of select="title" />
      </span>
    </h1>
    <div class="summary">
      <xsl:value-of select="summary" disable-output-escaping="yes" />
    </div>
    <hr class="soften" />
    <div class="content">
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
    <hr class="soften" />
    <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
      <xsl:text>&#8592; Back to </xsl:text>
      <strong>
        <xsl:value-of select="$page-title" />
      </strong>
    </a>
  </div>
</xsl:template>


</xsl:stylesheet>