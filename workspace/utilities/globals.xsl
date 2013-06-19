<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- GLOBAL TILE
     =========== -->

<xsl:template name="global-tile">

  <xsl:param name="class" />
  <xsl:param name="asset-link" />
  <xsl:param name="image" />
  <xsl:param name="title" />
  <xsl:param name="date-formatted" />
  <xsl:param name="date" />
  <xsl:param name="text" />

  <a>
    <xsl:choose>
      <xsl:when test="string-length($asset-link) &gt; 0">
        <xsl:attribute name="href">
          <xsl:value-of select="$asset-link"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="href">
          <xsl:value-of select="$root"/>
          <xsl:text>/</xsl:text>
          <xsl:value-of select="$root-page"/>
          <xsl:text>/</xsl:text>
          <xsl:value-of select="$title/@handle"/>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>

    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="string-length($image) &gt; 0">
            <xsl:text>span4 tile image </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>span4 tile </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$class"/>
      </xsl:attribute>

      <div class="upper">
        <xsl:if test="string-length($image) &gt; 0">
          <xsl:attribute name="style">
            <xsl:text>background: url(</xsl:text>
            <xsl:value-of select="$root"/>
            <xsl:text>/image/2/800/400/5/0/uploads/images/</xsl:text>
            <xsl:value-of select="$image"/>
            <xsl:text>) 50% 0 no-repeat; background-size: 400px;</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <div class="overlay">
          <h3>
            <xsl:value-of select="$title"/>
          </h3>
          <div class="content">
            <xsl:call-template name="truncate">
              <xsl:with-param name="node" select="$text" />
              <xsl:with-param name="length" select="170" />
            </xsl:call-template>
          </div>
        </div>
        <div class="category">
          <xsl:value-of select="$class"/>
          <span class="pull-right date">
            <xsl:choose>
              <xsl:when test="string-length($date-formatted) &gt; 0">
                <xsl:value-of select="$date-formatted"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="format-date">
                  <xsl:with-param name="date" select="$date/date/start/@iso" />
                  <xsl:with-param name="format" select="'%d; %m-; %y+;'" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </span>
        </div>
      </div>
    </div>
  </a>


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
  <xsl:call-template name="book-entry-large"/>
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

<xsl:template name="book-entry-large">
  <xsl:choose>
    <xsl:when test="reading = 'Yes'">
      <div class="span5 book">
        <img src="/workspace/img/spacer.gif" alt="{image/item/image/caption}" style="width:100%; height:400px;">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image/filename" />
          </xsl:attribute>
        </img>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="position() = 1">
        <div class="span1">&#160;</div>
      </xsl:if>
      <div class="span5 book">
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
      <cite class="esv-ignore">
        <xsl:value-of select="passage" />
        <xsl:text> (</xsl:text>
        <xsl:value-of select="version/item/abbreviation" />
        <xsl:text>)</xsl:text>
      </cite>
    </blockquote>
  </div>
</xsl:template>


<!-- BACK LINK
     ========= -->


<xsl:template name="back-link">
  <hr/>
  <a href="{$root}/{$root-page}" class="btn btn-large {$root-page}">
    <xsl:text>&#8592; Back to </xsl:text>
    <strong>
      <xsl:value-of select="$page-title" />
    </strong>
  </a>
</xsl:template>


<!-- DISQUS
     ====== -->
<xsl:template name="disqus">
  <div id="disqus_thread"></div>
  <script type="text/javascript">
      var disqus_shortname = 'dtrmn';
      (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
  </script>
</xsl:template>

</xsl:stylesheet>
