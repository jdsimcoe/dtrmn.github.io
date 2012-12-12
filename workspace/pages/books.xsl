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

  <div class="wrapper-quotes">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="marketing">
            <i class="glyphicon-bookmark icon-large"></i>
            <h2>Book Snyposes &amp; Reviews</h2>
            <p class="marketing-byline">Here you will find snyposes and reviews of books that we recommend. While the Scriptures stand as the sole source of Divine inpsiration, books can help us see Biblical truth that we didn't see before.</p>
          </div>
          <hr class="soften" />
          <div class="row">
            <div class="span12">
               <xsl:apply-templates select="/data/books-all/entry"/>
            </div>
          </div>
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


 <xsl:template match="/data/books-all/entry">
  <div class="span3 book">
    <a href="{$root}/books/{title/@handle}" class="book-entry">

      <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:350px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>

<!--       <h4>
        <xsl:value-of select="title" />
      </h4>
      <p>
        <xsl:text>by </xsl:text>
        <xsl:value-of select="author" />
      </p>
      <p>
        <xsl:value-of select="synopsis[@mode='unformatted']" />
      </p>
      <xsl:variable name="quote-raw">
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="quote[@mode='unformatted']" disable-output-escaping="yes" />
          <xsl:with-param name="length" select="100" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$quote-raw" />
        <xsl:with-param name="replace" select="'>'" />
        <xsl:with-param name="by" select="''" />
      </xsl:call-template> -->

    </a>
  </div>
</xsl:template>


<xsl:template match="/data/books-single/entry">
  <div class="row">
    <div class="span3">
      <img class="img-polaroid" src="/workspace/img/spacer.gif" style="width:100%; height:350px;">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="image/item/image/filename" />
        </xsl:attribute>
      </img>
    </div>
    <div class="span9">
      <h2>
        <xsl:value-of select="title" />
      </h2>
      <h3>
        <xsl:text>by </xsl:text>
        <a href="{author/item/link}" target="_blank">
          <xsl:value-of select="author/item/name" />
        </a>
      </h3>

      <h4>Synopsis</h4>
      <div class="synopsis">
        <xsl:value-of select="synopsis[@mode='formatted']" disable-output-escaping="yes" />
      </div>

    </div>
  </div>
</xsl:template>

</xsl:stylesheet>