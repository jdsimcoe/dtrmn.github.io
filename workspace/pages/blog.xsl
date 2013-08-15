<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>
<xsl:include href="../utilities/pagination.xsl"/>


<xsl:template match="data">

  <div class="wrapper blog">
    <div class="container">

      <xsl:choose>
        <xsl:when test="$title = '' or number($title)">
          <div class="row">

            <xsl:for-each select="/data/articles-all/entry">
              <xsl:call-template name="global-tile">
                <xsl:with-param name="class" select="$root-page" />
                <xsl:with-param name="image" select="image" />
                <xsl:with-param name="title" select="title" />
                <xsl:with-param name="date" select="date" />
                <xsl:with-param name="text" select="content[@mode='unformatted']" />
              </xsl:call-template>
            </xsl:for-each>

          </div>

          <div class="row">
            <div class="span12">
              <xsl:call-template name="cd-pagination">
                <xsl:with-param name="pagination" select="/data/articles-all/pagination" />
                <xsl:with-param name="pagination-url" select="'/blog/$'" />
              </xsl:call-template>
            </div>
          </div>

        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span8 offset2">
              <xsl:apply-templates select="/data/articles-single/entry"/>
              <xsl:call-template name="back-link"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>

    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-single/entry">
  <div class="article entry">
    <h4>
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
      <xsl:call-template name="edit-entry">
        <xsl:with-param name="component" select="'articles'"/>
      </xsl:call-template>
    </h4>
    <h1>
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
      </a>
    </h1>
    <hr/>
    <xsl:if test="image != ''">
      <img src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" class="img-round" width="100%">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:if>
    <div class="content">
      <xsl:for-each select="verses/item">
        <xsl:call-template name="verse-entry" />
      </xsl:for-each>
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </div>
  </div>

</xsl:template>



</xsl:stylesheet>