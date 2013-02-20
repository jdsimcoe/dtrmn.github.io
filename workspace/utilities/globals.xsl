<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- GLOBAL TILE
     =========== -->

<xsl:template name="global-tile">

  <xsl:param name="image" />
  <xsl:param name="title" />
  <xsl:param name="date" />
  <xsl:param name="text" />

  <a href="{$root}/{$root-page}/{$title/@handle}">

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="string-length(image) &gt; 0">
            <xsl:text>span4 tile image </xsl:text>
            <xsl:value-of select="$root-page"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>span4 tile </xsl:text>
            <xsl:value-of select="$root-page"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>



        <div class="upper">
          <xsl:if test="image != ''">
            <xsl:attribute name="style">
              <xsl:text>background: url(</xsl:text>
              <xsl:text>/workspace/uploads/images/</xsl:text>
              <xsl:value-of select="image"/>
              <xsl:text>) 50% 0 no-repeat; background-size: 400px;</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <h3>
            <xsl:value-of select="$title"/>
            <span class="pull-right">
              <xsl:call-template name="format-date">
                <xsl:with-param name="date" select="$date/date/start/@iso" />
                <xsl:with-param name="format" select="'%m-; %d;'" />
              </xsl:call-template>
            </span>
          </h3>
          <div class="content">
            <xsl:call-template name="truncate">
              <xsl:with-param name="node" select="$text" />
              <xsl:with-param name="length" select="170" />
            </xsl:call-template>
          </div>
        </div>

        <div class="lower">
          <h4>
            <xsl:value-of select="$root-page"/>
            <span class="pull-right">→</span>
          </h4>
        </div>



    </div>
  </a>

</xsl:template>


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
