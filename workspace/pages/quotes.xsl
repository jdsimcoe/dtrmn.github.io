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
            <i class="glyphicon-comment icon-large"></i>
            <h2>Sounding Off</h2>
            <p class="marketing-byline">While the Scriptures are the primary way we hear from God, it is clear from the Scriptures themselves that nothing is of private interpretation (2 Peter 1:20). This quote board is a place to find encouragement from other Christian leaders and pastors that will help unpack the Scriptures for us.</p>
          </div>
          <hr class="soften" />
          <div class="row">
            <div class="span12">
              <xsl:apply-templates select="/data/quotes-all/entry"/>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span8">
              <xsl:apply-templates select="/data/quotes-single/entry"/>
            </div>
            <div class="span4">
              <h4>From the Blog</h4>
              <hr />
              <xsl:apply-templates select="/data/articles-4-latest/entry [ position() &lt; 3 ]"/>
            </div>
          </div>
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


<xsl:template match="/data/quotes-all/entry">
<div class="span3 quote">
    <a href="{$root}/quotes/{title/@handle}" class="quote-entry">
      <blockquote>
        <xsl:if test="position() = 1">
          <xsl:attribute name="class">
          <xsl:text>latest</xsl:text>
          </xsl:attribute>
        </xsl:if>

        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p>
          <xsl:text>by </xsl:text>
          <xsl:choose>
            <xsl:when test="book != ''">
              <xsl:value-of select="book/item/author"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="author" />
            </xsl:otherwise>
          </xsl:choose>
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
        </xsl:call-template>

      </blockquote>
    </a>
  </div>
</xsl:template>


<xsl:template match="/data/quotes-single/entry">
  <div class="entry">
    <div>
      <span class="badge accent">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
        </xsl:call-template>
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
            </div>
            <div class="span3">
              <a href="{$root}/books/{book/item/title/@handle}">
                <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{book/item/image/item/image/caption}" style="width:100%; height:250px;">
                  <xsl:attribute name="data-responsimage">
                    <xsl:value-of select="book/item/image/item/image/filename" />
                  </xsl:attribute>
                </img>
              </a>
            </div>
          </div>
          <div class="row">
            <hr />
            <xsl:value-of select="commentary" disable-output-escaping="yes" />
          </div>
        </xsl:when>
        <xsl:otherwise>
          <blockquote>
            <xsl:value-of select="quote" disable-output-escaping="yes" />
            <p>
              <xsl:text>—</xsl:text>
              <xsl:value-of select="author" disable-output-escaping="yes" />
              <xsl:text>, </xsl:text>
              <a href="{link}">
                <em>
                  <xsl:value-of select="source" disable-output-escaping="yes" />
                </em>
              </a>
            </p>
          </blockquote>
          <hr />
          <xsl:value-of select="commentary" disable-output-escaping="yes" />
        </xsl:otherwise>
      </xsl:choose>

    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-4-latest/entry">
  <a href="{$root}/blog/{title/@handle}" class="blog-entry">
    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="position() = 1">
            <xsl:text>entry-header latest</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>entry-header</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <h4>
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="title" />
          <xsl:with-param name="length" select="25" />
        </xsl:call-template>
      </h4>
      <p class="blog-date">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
        </xsl:call-template>
      </p>
    </div>
    <p class="content">
      <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="content" />
          <xsl:with-param name="length" select="260" />
      </xsl:call-template>
    </p>
  </a>
</xsl:template>


</xsl:stylesheet>