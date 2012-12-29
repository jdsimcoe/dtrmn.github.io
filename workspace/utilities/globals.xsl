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
        <xsl:when test="$root-page = 'home'">
          <xsl:text>span3</xsl:text>
        </xsl:when>
        <xsl:when test="$root-page = 'quotes'">
          <xsl:text>span3 quote</xsl:text>
        </xsl:when>
        <xsl:when test="$root-page = 'blog'">
          <xsl:text>quote</xsl:text>
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
        <xsl:call-template name="truncate">
          <xsl:with-param name="node" select="quote" />
          <xsl:with-param name="length" select="80" />
        </xsl:call-template>
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
          <xsl:text>span4 doctrine</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>doctrine</xsl:text>
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
        <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
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
            <hr class="soften" />
            <div class="ratings">
              <xsl:call-template name="ratings">
                <xsl:with-param name="i" select="1" />
                <xsl:with-param name="count" select="10" />
                <xsl:with-param name="rating-num" select="rating" />
              </xsl:call-template>
            </div>
          </div>
          <img class="img-polaroid" src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
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

<xsl:template match="/data/studies-all/entry">
  <xsl:call-template name="studies-entry"/>
</xsl:template>


<xsl:template match="/data/studies-all/entry[doctrine/item/@id = //data/doctrines-single/entry/@id]">
  <xsl:call-template name="studies-single-entry"/>
</xsl:template>


<xsl:template name="studies-entry">
  <tr>
    <td><xsl:value-of select="position()" /></td>
    <td>
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
        <xsl:if test="upcoming = 'Yes'">
          <xsl:text>&#160;&#160;</xsl:text>
          <span class="badge badge-inverse">UPCOMING</span>
        </xsl:if>
      </a>
    </td>
    <td><xsl:value-of select="doctrine" /></td>
    <td>
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="date/date/start/@iso" />
        <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
      </xsl:call-template>
    </td>
  </tr>
</xsl:template>


<xsl:template name="studies-single-entry">
  <div>
    <a href="{$root}/foundations/{title/@handle}">
      <span class="badge">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="date/date/start/@iso" />
          <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
        </xsl:call-template>
      </span>
      <h2>
        <span class="logo">b</span>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="title" />
        <xsl:text>&#8594;</xsl:text>
      </h2>
    </a>
  </div>
</xsl:template>


</xsl:stylesheet>
