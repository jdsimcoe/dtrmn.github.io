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
            <div class="span9">
              <xsl:apply-templates select="/data/quotes-single/entry"/>
            </div>
            <div class="span3">
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
    <a href="{$root}/{$root-page}/{title/@handle}" class="blog-entry">
      <blockquote>
        <div class="block">
          <div>
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
          </div>
        </div>
        <h4>
          <xsl:value-of select="title" />
        </h4>
        <p>
          <xsl:text>by </xsl:text>
          <xsl:value-of select="cite" />
        </p>
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="quote" disable-output-escaping="yes" />
          <xsl:with-param name="length" select="100" />
        </xsl:call-template>
      </blockquote>
    </a>
  </div>
</xsl:template>


<xsl:template match="/data/quotes-single/entry">
  <div class="span12 entry">
    <div>
      <span class="label accent">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
        </xsl:call-template>
      </span>
    </div>
    <h3><xsl:value-of select="title" /></h3>
    <div class="content">
      <xsl:value-of select="quote" disable-output-escaping="yes" />
      <xsl:value-of select="commentary" disable-output-escaping="yes" />
    </div>
  </div>
</xsl:template>


<xsl:template match="/data/articles-4-latest/entry">
  <a href="{$root}/blog/{title/@handle}" class="blog-entry">
    <div>
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
    </div>
    <h4>
      <xsl:call-template name="truncate">
        <xsl:with-param name="node" select="title" />
        <xsl:with-param name="length" select="25" />
      </xsl:call-template>
    </h4>
    <p>
      <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="content" />
          <xsl:with-param name="length" select="290" />
      </xsl:call-template>
    </p>
  </a>
  <br />
</xsl:template>


</xsl:stylesheet>