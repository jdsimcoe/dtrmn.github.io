<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper books">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">

          <div class="row">
            <h3 class="center">Book Synopses &amp; Reviews</h3>
            <xsl:apply-templates select="/data/books-all/entry[reading='No']"/>
          </div>

          <div class="row">
            <h3 class="center">Currently Reading</h3>
            <xsl:apply-templates select="/data/books-reading/entry"/>
          </div>

        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="/data/books-single/entry"/>
          <xsl:call-template name="back-link"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>

</xsl:template>


<xsl:template match="/data/books-single/entry">
  <div class="row entry">
    <div class="span3">
      <img src="/workspace/img/spacer.gif" style="width:100%; height:100%;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </div>
    <div class="span9">
      <h2>
        <xsl:value-of select="title" />
        <xsl:call-template name="edit-entry">
          <xsl:with-param name="component" select="'books'"/>
        </xsl:call-template>
      </h2>
      <h3>
        <xsl:text>by </xsl:text>
        <xsl:value-of select="author/item/name" />
        <a href="{author/item/link}" class="btn {$root-page} pull-right" target="_blank">More about the Author &#8594;</a>
      </h3>
      <div class="ratings">
        <xsl:call-template name="ratings">
          <xsl:with-param name="i" select="1" />
          <xsl:with-param name="count" select="10" />
          <xsl:with-param name="rating-num" select="rating" />
        </xsl:call-template>
      </div>

      <div class="content">
        <xsl:choose>
          <xsl:when test="reading = 'Yes'">
            <br/>
            <h3>
              This book is currently being read.
            </h3>
          </xsl:when>
          <xsl:otherwise>
            <h4>Synopsis</h4>
            <xsl:value-of select="synopsis[@mode='formatted']" disable-output-escaping="yes" />
            <xsl:if test="review != ''">
              <hr />
              <h3 class="center">Book Review</h3>
              <xsl:value-of select="review[@mode='formatted']" disable-output-escaping="yes" />
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </div>

      <hr />

    </div>
  </div>
</xsl:template>


</xsl:stylesheet>