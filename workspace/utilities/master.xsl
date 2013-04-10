<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="toolkit.xsl"/>
<xsl:include href="date-time-advanced.xsl" />

<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />


<xsl:param name="cookie-username" />

<xsl:template match="/">

  <xsl:variable name="version">1.2.7</xsl:variable>

  <html lang="en">
  <head>
    <xsl:choose>
      <xsl:when test="$page-title = 'Home' or $page-title = 'Error'">
        <title>Determine</title>
      </xsl:when>
      <xsl:otherwise>
        <title>
          <xsl:if test="$title != ''">
            <xsl:variable name="title-spaced">
              <xsl:choose>
                <xsl:when test="number($title)">
                  <xsl:text>Page </xsl:text>
                  <xsl:value-of select="$title" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="$title" />
                    <xsl:with-param name="replace" select="'-'" />
                    <xsl:with-param name="by" select="' '" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="TitleCase">
              <xsl:with-param name="text" select="translate(normalize-space($title-spaced),
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
            </xsl:call-template>
            <xsl:text> | </xsl:text>
          </xsl:if>
          <xsl:text>Determine | </xsl:text>
          <xsl:value-of select="//data/page-data/entry/title" />
        </title>
      </xsl:otherwise>
    </xsl:choose>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Gospel-centered writing, articles, doctrine and studies to build up the body of Jesus Christ." />
    <meta name="keywords" content="Gospel, Jesus Christ, Jesus, Scripture, Gospel-centered" />
    <meta name="author" content="Jonathan and Colsey Simcoe" />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/img/spacer.gif" data-loading="{$workspace}/img/loading.gif" />

    <link href="{$workspace}/css/dtrmn.{$version}.css" rel="stylesheet" />
    <link href="{$workspace}/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$workspace}/img/apple-touch-icon-precomposed.png" />

    <script type="text/javascript" src="{$workspace}/js/dtrmn.{$version}.js"></script>

    <script type="text/javascript">
      <xsl:comment>
        var _gaq=[["_setAccount","UA-4548059-3"],["_trackPageview"]];
        (function(d,t){
          var g=d.createElement(t), s=d.getElementsByTagName(t)[0];
          g.async=1;
            g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g,s)
        }(document,"script"));
      </xsl:comment>
    </script>
  </head>

  <body class="{$root-page}">
    <xsl:apply-templates select="data/navigation"/>
    <div class="jumbotron subhead">
      <xsl:if test="$page-title != 'Home'">
        <div class="page-headers">
          <div class="container">
            <h1>
              <a>
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="$root-page = 'error'">
                      <xsl:value-of select="$root" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$root" />
                      <xsl:text>/</xsl:text>
                      <xsl:value-of select="$root-page" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="//data/page-data/entry/title" />
              </a>
            </h1>
            <p class="lead">
              <xsl:value-of select="//data/page-data/entry/description" />
            </p>
          </div>
        </div>
      </xsl:if>
      <xsl:if test="$page-title = 'Home'">
        <div class="container">
          <div class="row">
            <div class="span10">
              <div id="featureCarousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">
                  <div class="active item page-headers">
                    <div class="container">
                      <h1><a href="{$root}"><xsl:value-of select="$website-name" /></a></h1>
                      <p class="lead">Knowing Christ and Him crucified (<span class="esv-ignore">1 Corinthians 2:2</span>)</p>
                    </div>
                  </div>
                  <xsl:for-each select="//data/inspiration-all/entry">
                    <div class="item">
                      <p class="vision"><xsl:value-of select="content" /></p>
                      <br/>
                      <cite>
                        <xsl:value-of select="cite" />
                      </cite>
                    </div>
                  </xsl:for-each>
                </div>
              </div>
            </div>
          </div>
        </div>
      </xsl:if>
    </div>

    <div id="content">

      <xsl:apply-templates />

    </div>

    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="span2">
            <a href="{root}" class="logo">
              <span class="icon-large">D</span>
            </a>
            <ul class="nav nav-list">
              <xsl:apply-templates select="data/navigation/page"/>
            </ul>
          </div>
          <div class="span6">
            <h5>Inspiration</h5>
            <xsl:for-each select="//data/inspiration-random/entry">
              <div class="inspiration">
                <blockquote>
                  <xsl:value-of select="content" />
                </blockquote>
                <cite>
                  <span>
                    <xsl:value-of select="cite" />
                  </span>
                </cite>
                <xsl:if test="position() = 1">
                  <hr/>
                </xsl:if>
              </div>
            </xsl:for-each>
          </div>
          <div class="span4">
            <h5>The Gospel</h5>
            <p class="lead">The Gospel is the good news that God saves sinners from God's wrath to eternal life with Him through the death, burial, and resurrected life of Jesus Christ. God offers this to all freely and invites us into His life through repentance and faith.</p>
            <a href="{root}/gospel" class="btn">Read More <strong>&#8594;</strong></a>
          </div>
        </div>
      </div>
    </footer>

    <div class="baseline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <p class="center">
              <xsl:text>&#xa9;&#160;2011–</xsl:text>
              <xsl:value-of select="$this-year" />
              <xsl:text>.&#160;</xsl:text>
              <xsl:text>The Simcoes. All rights reserved.&#160;&#160;|&#160;&#160;</xsl:text>
              <a class="rss" href="{$root}/rss/">RSS</a>
              <xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
              <a href="http://getsymphony.com/">Built with <strong>Symphony CMS</strong></a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </body>

</html>

</xsl:template>

<xsl:template match="navigation">
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/"><span class="logo">D</span></a>
      <div class="nav-collapse collapse">
        <ul class="nav">
          <xsl:apply-templates select="page"/>
        </ul>
        <xsl:if test="$cookie-username">
          <ul class="nav maint pull-right">
            <li>
              <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/symphony/" target="_blank">Symphony</a></li>
                <li><a href="?debug" target="_blank">Debug</a></li>
                <li><a href="{$root}/symphony/logout/">Logout</a></li>
              </ul>
            </li>
          </ul>
        </xsl:if>
        <ul class="nav pull-right">
          <li>
            <xsl:choose>
              <xsl:when test="$current-page = 'gospel'">
                <xsl:attribute name="class">
                  <xsl:text>gospel active</xsl:text>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="class">
                  <xsl:text>gospel</xsl:text>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <a href="{root}/gospel">The Gospel</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="navigation/page">
  <xsl:if test="not(types/type = 'hidden' or types/type = 'XML' or @handle = 'gospel')">
    <li>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@handle = $current-page">
            <xsl:text>active</xsl:text>
          </xsl:when>
          <xsl:when test="@handle = 'gospel'">
            <xsl:text>gospel</xsl:text>
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <a>
        <xsl:choose>
          <xsl:when test="types/type = 'index'">
            <xsl:attribute name="href"><xsl:value-of select="$root"/>/</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="href"><xsl:value-of select="$root"/>/<xsl:value-of select="@handle"/></xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@handle = 'foundations'">
            <xsl:value-of select="name"/>
            <xsl:text>&#160;&#160;</xsl:text>
            <xsl:if test="/data/studies-upcoming/entry != ''">
              <span class="badge">
                <xsl:call-template name="format-date">
                  <xsl:with-param name="date" select="/data/studies-upcoming/entry/date/date/start/@iso" />
                  <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
                </xsl:call-template>
              </span>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="name"/>
          </xsl:otherwise>
        </xsl:choose>
      </a>
    </li>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
