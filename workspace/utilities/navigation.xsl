<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- <xsl:template name="navigation">

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <div class="nav-collapse collapse">

      <ul class="nav pull-right">
        <li class="hidden-desktop">
          <a href="{$root}">Home</a>
        </li>
        <li>
          <a href="{$root}/blog/">Blog</a>
        </li>
        <li class="">
          <a href="{$root}/doctrine/">Doctrine</a>
        </li>
        <li class="">
          <a href="{$root}/foundations/">Foundations</a>
        </li>
        <li class="">
          <a href="{$root}/quotes/">Quotes</a>
        </li>
        <li class="">
          <a href="{$root}/about">About</a>
        </li>
        <xsl:if test="$cookie-username">
          <li class="">
            <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
            <ul class="dropdown-menu">
              <li><a href="/symphony/">Symphony</a></li>
              <li><a href="?debug">Debug</a></li>
              <li><a href="{$root}/symphony/logout/">Logout</a></li>
            </ul>
          </li>
        </xsl:if>
      </ul>
      <a class="title pull-left hidden-phone hidden-tablet" href="/"><i class="glyphicon-tint"></i> Determine</a>
    </div>
  </div>
</div>

</xsl:template> -->

<xsl:template match="navigation">
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="nav-collapse collapse">
        <ul class="nav pull-right">
          <xsl:apply-templates select="page"/>
          <xsl:if test="$cookie-username">
            <li class="">
              <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/symphony/">Symphony</a></li>
                <li><a href="?debug">Debug</a></li>
                <li><a href="{$root}/symphony/logout/">Logout</a></li>
              </ul>
            </li>
          </xsl:if>
        </ul>
        <a class="title pull-left hidden-phone hidden-tablet" href="/"><i class="glyphicon-tint"></i> Determine</a>

      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="navigation/page">
  <li>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="@handle = $current-page">
          <xsl:text>active</xsl:text>
          <xsl:if test="@handle = 'home'">
            <xsl:text> hidden-desktop</xsl:text>
          </xsl:if>
        </xsl:when>
        <xsl:when test="@handle = 'home'">
          <xsl:text>hidden-desktop</xsl:text>
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
      <xsl:value-of select="name"/>
    </a>
  </li>
</xsl:template>



</xsl:stylesheet>
