<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- ARTICLES
     ======== -->

<xsl:template match="/data/articles-4-latest/entry">
  <xsl:call-template name="article-entry"/>
</xsl:template>


<xsl:template name="article-entry">
  <div>
    <xsl:if test="$root-page = 'home'">
      <xsl:attribute name="class">
        <xsl:text>span3</xsl:text>
      </xsl:attribute>
    </xsl:if>
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
  </div>
</xsl:template>


<!-- QUOTES
     ====== -->

<xsl:template match="/data/quotes-4-latest/entry">
  <xsl:call-template name="quote-entry"/>
</xsl:template>


<xsl:template match="/data/quotes-all/entry">
  <xsl:call-template name="quote-entry"/>
</xsl:template>


<xsl:template name="quote-entry">
  <div>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$root-page = 'home' or $root-page = 'quotes'">
          <xsl:text>span3</xsl:text>
        </xsl:when>
        <xsl:when test="$root-page = 'blog'">
          <xsl:text></xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:attribute>

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
        <p class="author">
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
        <div class="content">
          <xsl:call-template name="truncate">
            <xsl:with-param name="node" select="quote" />
            <xsl:with-param name="length" select="80" />
          </xsl:call-template>
        </div>
      </blockquote>
    </a>
  </div>
</xsl:template>


<!-- DOCTRINES
     ========= -->

<xsl:template match="/data/doctrines-3-latest/entry">
  <xsl:call-template name="doctrine-entry"/>
</xsl:template>

<xsl:template match="/data/doctrines-all/entry">
  <xsl:call-template name="doctrine-entry"/>
</xsl:template>

<xsl:template match="/data/doctrines-all/entry[@id = //data/studies-single/entry/doctrine/item/@id]">
  <xsl:call-template name="doctrine-entry"/>
</xsl:template>


<xsl:template name="doctrine-entry">
  <div>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$root-page = 'home' or $root-page = 'doctrine'">
          <xsl:text>span4 doctrine-tile</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>doctrine-tile</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <a href="{$root}/doctrine/{title/@handle}">
      <h3>
        <xsl:value-of select="title" />
        <span>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() = 1">
                <xsl:text>badge accent</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>badge</xsl:text>
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
        <xsl:value-of select="summary" disable-output-escaping="yes" />
      </div>
      <br />
      <div class="right">Study <strong><xsl:value-of select="title" /> &#8594;</strong></div>
    </a>
  </div>
</xsl:template>


<!-- BOOKS
     ===== -->

<xsl:template match="/data/books-4-latest/entry">
  <xsl:call-template name="book-entry"/>
</xsl:template>


<xsl:template match="/data/books-all/entry[reading='No']">
  <xsl:call-template name="book-entry"/>
</xsl:template>


<xsl:template match="/data/books-reading/entry">
  <xsl:call-template name="book-entry"/>
</xsl:template>

<xsl:template match="/data/books-all/entry[@id = //data/doctrines-single/entry/books/item/@id]">
  <xsl:call-template name="book-entry"/>
</xsl:template>


<xsl:template name="book-entry">
  <xsl:choose>
    <xsl:when test="reading = 'Yes'">
      <div class="span3 book">
        <img src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image/filename" />
          </xsl:attribute>
        </img>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <div class="span3 book">
        <a href="{$root}/books/{title/@handle}" class="book-entry home">
          <div class="metadata">
            <h4>
              <xsl:value-of select="title" />
            </h4>
            <p>
              <xsl:text>by </xsl:text>
              <xsl:value-of select="author" />
              <xsl:if test="review != ''">
                <xsl:text>&#160;</xsl:text>
                <span class="badge">Review</span>
              </xsl:if>
            </p>
            <div class="ratings">
              <xsl:call-template name="ratings">
                <xsl:with-param name="i" select="1" />
                <xsl:with-param name="count" select="10" />
                <xsl:with-param name="rating-num" select="rating" />
              </xsl:call-template>
            </div>
          </div>
          <img src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
            <xsl:attribute name="data-responsimage">
              <xsl:value-of select="image/item/image/filename" />
            </xsl:attribute>
          </img>


        </a>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- STUDIES
     ======= -->



<!-- VERSES
     ====== -->


<xsl:template name="verse-entry">
  <div class="verse center">
    <blockquote>
      <xsl:value-of select="content" />
      <br />
      <cite>
        <xsl:value-of select="passage" />
        <xsl:text> (</xsl:text>
        <xsl:value-of select="version/item/abbreviation" />
        <xsl:text>)</xsl:text>
      </cite>
    </blockquote>
  </div>
</xsl:template>


</xsl:stylesheet>
