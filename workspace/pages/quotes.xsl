<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper quotes">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">

          <div class="row">

            <xsl:for-each select="/data/quotes-all/entry">
              <xsl:choose>
                  <xsl:when test="string-length(image) &gt; 0">
                    <xsl:call-template name="global-tile">
                      <xsl:with-param name="class" select="$root-page" />
                      <xsl:with-param name="image" select="image/item/image/filename" />
                      <xsl:with-param name="title" select="title" />
                      <xsl:with-param name="date" select="date" />
                      <xsl:with-param name="text" select="quote" />
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="global-tile">
                      <xsl:with-param name="class" select="$root-page" />
                      <xsl:with-param name="image" select="book/item/image/item/image/filename" />
                      <xsl:with-param name="title" select="title" />
                      <xsl:with-param name="date" select="date" />
                      <xsl:with-param name="text" select="quote" />
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>


            </xsl:for-each>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/quotes-single/entry"/>
            </div>
          </div>
          <xsl:call-template name="back-link"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>

</xsl:template>


<xsl:template match="/data/quotes-single/entry">
  <div class="entry">
    <div>
      <span class="badge accent">
        <span class="esv-ignore">
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date/date/start/@iso" />
            <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
          </xsl:call-template>
        </span>
      </span>
    </div>
    <h3>
      <xsl:value-of select="title" />
      <xsl:call-template name="edit-entry">
        <xsl:with-param name="component" select="'quotes'"/>
      </xsl:call-template>
    </h3>
    <div class="content">

      <xsl:choose>
        <xsl:when test="book != ''">
          <div class="row">
            <div class="span9">
              <blockquote>
                <xsl:value-of select="quote" disable-output-escaping="yes" />
                <p>
                  <xsl:text>—</xsl:text>
                  <xsl:value-of select="book/item/author" disable-output-escaping="yes" />
                  <xsl:text>, </xsl:text>
                  <a href="{$root}/books/{book/item/title/@handle}">
                    <em>
                      <xsl:value-of select="book/item/title" disable-output-escaping="yes" />
                    </em>
                  </a>
                </p>
              </blockquote>
              <hr />
              <xsl:value-of select="commentary" disable-output-escaping="yes" />
            </div>
            <div class="span3">
              <a href="{$root}/books/{book/item/title/@handle}">
                <img src="/workspace/img/spacer.gif" alt="{book/item/image/item/image/caption}" width="100%">
                  <xsl:attribute name="data-responsimage">
                    <xsl:value-of select="book/item/image/item/image/filename" />
                  </xsl:attribute>
                </img>
              </a>
            </div>
          </div>
        </xsl:when>
        <xsl:when test="image != ''">
          <div class="row">
            <div class="span9">
              <blockquote>
                <xsl:value-of select="quote" disable-output-escaping="yes" />
                <p>
                  <xsl:text>—</xsl:text>
                  <xsl:value-of select="author" disable-output-escaping="yes" />
                  <xsl:if test="source != ''">
                    <xsl:text>, </xsl:text>
                    <a href="{link}" target="_blank">
                      <em>
                        <xsl:value-of select="source" disable-output-escaping="yes" />
                      </em>
                    </a>
                  </xsl:if>
                </p>
              </blockquote>
              <hr />
              <xsl:value-of select="commentary" disable-output-escaping="yes" />
            </div>
            <div class="span3">
              <a href="{link}" target="_blank">
                <img src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" class="img-round" width="100%">
                  <xsl:attribute name="data-responsimage">
                    <xsl:value-of select="image/item/image/filename" />
                  </xsl:attribute>
                </img>
              </a>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <blockquote>
            <xsl:value-of select="quote" disable-output-escaping="yes" />
            <p>
              <xsl:text>—</xsl:text>
              <xsl:value-of select="author" disable-output-escaping="yes" />
              <xsl:if test="source != ''">
                <xsl:text>, </xsl:text>
                <a href="{link}">
                  <em>
                    <xsl:value-of select="source" disable-output-escaping="yes" />
                  </em>
                </a>
              </xsl:if>
            </p>
          </blockquote>
          <hr />
          <xsl:value-of select="commentary" disable-output-escaping="yes" />
        </xsl:otherwise>
      </xsl:choose>

    </div>
  </div>
</xsl:template>


</xsl:stylesheet>