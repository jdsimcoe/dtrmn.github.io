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

  <div class="container">
    <div class="marketing">

      <h1>What is Determine?</h1>
      <p class="marketing-byline">Like Paul declared above, our goal is to make the Gospel of Jesus Christ known, treasured and embraced in every facet of life. We are striving to do this in the following ways:</p>
      <div class="row grid first">
        <div class="span4">
          <span class="logo icon-large">a</span>
          <h2>The Gospel</h2>
          <p>Determine is primarily about <a href="{$root}/about">the Gospel</a> and seeing the deep realities of what God accomplished for us being moved into our everyday lives. We, like Paul declared in 1 Corinthians 2:2, want to make everything we do in life about Jesus Christ.</p>
        </div>
        <div class="span4">
          <i class="glyphicon-book icon-large"></i>
          <h2>Surveys of Bible doctrine</h2>
          <p>In addition to the regular articles and notes, we wanted to offer something different for visitors in the form of short surveys of <a href="{$root}/doctrine">Biblical doctrine</a>. These pieces will highlight a theological subject for more rigorous study and application.</p>
        </div>
        <div class="span4">
          <span class="logo icon-large">b</span>
          <h2>Studies to dive deeper</h2>
          <p>Another way to get encouraged is to follow along with the <a href="{$root}/foundations">Foundations</a> curriculum we are developing. We are doing this study at our <a href="http://atheycreek.com/">local church</a> and offering the discussion questions and summaries free of charge for visitors.</p>
        </div>
      </div>
      <div class="row grid second">
        <div class="span4">
          <i class="glyphicon-list-alt icon-large"></i>
          <h2>Gospel-centered articles</h2>
          <p>Our <a href="{$root}/blog">blog articles</a> are longer pieces centered on the Gospel to help you deepen your relationship with Christ and your love of the Scriptures.</p>
        </div>
        <div class="span4">
          <i class="glyphicon-comment icon-large"></i>
          <h2>Helpful quotes</h2>
          <p><a href="{$root}/quotes">Quotes</a> are usually short sound-bites from Gospel-centered preachers and scholars with short bits of commentary and reflection.</p>
        </div>
        <div class="span4">
          <i class="glyphicon-bookmark icon-large"></i>
          <h2>Book reviews <span class="label">Coming Soon</span></h2>
          <p>Soon we will have reviews of relevant Christian books that we have found helpful in pursuing Christ and growing in our love for Him.</p>
        </div>
      </div>

    </div>
  </div>

  <div class="stripe first">
    <div class="container">
      <h3>Bible Doctrines</h3>
      <div class="row">
        <xsl:apply-templates select="/data/doctrines-3-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe second">
    <div class="container">
      <h3>From the Blog</h3>
      <div class="row">
        <xsl:apply-templates select="/data/articles-4-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe third">
    <div class="container">
      <h3>Latest Quotes</h3>
      <div class="row">
        <xsl:apply-templates select="/data/quotes-4-latest/entry"/>
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template match="/data/articles-4-latest/entry">
  <div class="span3">
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
  </div>
</xsl:template>


<xsl:template match="/data/quotes-4-latest/entry">
  <div class="span3">
    <a href="{$root}/quotes/{title/@handle}" class="blog-entry">
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
          <xsl:with-param name="node" select="quote" />
          <xsl:with-param name="length" select="100" />
        </xsl:call-template>
      </blockquote>
    </a>
  </div>
</xsl:template>


<xsl:template match="/data/doctrines-3-latest/entry">
  <div class="span4 doctrine">
    <a href="{$root}/doctrine/{title/@handle}">
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


</xsl:stylesheet>