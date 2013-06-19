<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper doctrine">

    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="row">

            <xsl:for-each select="/data/doctrines-all/entry">

              <xsl:call-template name="global-tile">
                <xsl:with-param name="class" select="$root-page" />
                <xsl:with-param name="title" select="title" />
                <xsl:with-param name="date" select="date" />
                <xsl:with-param name="text" select="summary[@mode='unformatted']" />
              </xsl:call-template>

            </xsl:for-each>
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
    <hr/>
    <div class="content">
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
    <xsl:if test="/data/books-all/entry[@id = //data/doctrines-single/entry/books/item/@id] != ''">
			<hr/>
			<div class="row">
				<div class="span12">
					<h4>Related Books</h4>
				</div>
			</div>
			<div class="row">
				<xsl:apply-templates select="/data/books-all/entry[@id = //data/doctrines-single/entry/books/item/@id]"/>
			</div>
    </xsl:if>
    <div class="back-nav">
      <xsl:call-template name="back-link"/>
    </div>
  </div>
</xsl:template>


</xsl:stylesheet>