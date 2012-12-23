<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper-books">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <i class="glyphicon-bookmark icon-large"></i>
            <h2>Book Snyposes &amp; Reviews</h2>
            <p class="marketing-byline">Here you will find snyposes and reviews of books that we recommend. While the Scriptures stand as the sole source of Divine inpsiration, books can help us see Biblical truth that we didn't see before.</p>
          </div>
          <hr class="soften" />
          <br />

          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/books-all/entry[reading='No']"/>
            </div>
          </div>

          <hr class="soften" />
          <div class="row">
            <div class="span12">
              <h3 class="center">Currently Reading</h3>
              <br />
              <xsl:apply-templates select="/data/books-reading/entry"/>
            </div>
          </div>

          <br /><br /><br />

        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="/data/books-single/entry"/>
          <hr class="soften" />
          <a href="{$root}/{$root-page}" class="btn btn-primary btn-large">
            <xsl:text>&#8592; Back to </xsl:text>
            <strong>
              <xsl:value-of select="$page-title" />
            </strong>
          </a>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>

</xsl:template>


<xsl:template match="/data/books-single/entry">
  <div class="row entry">
    <div class="span3">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" style="width:100%; height:400px;">
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

      <a href="{author/item/link}" class="btn" target="_blank">More about the Author &#8594;</a>

    </div>
  </div>
</xsl:template>


</xsl:stylesheet>