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

  <div class="wrapper-studies">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <div class="row">
            <div class="span12">
              <xsl:if test="//data/page-data/entry/title != ''">
                <div class="marketing">
                  <br />
                  <span class="logo icon-large">b</span>
                  <br />
                  <h2>Foundations Study</h2>
                  <p class="marketing-byline">Foundations is a study we are doing at our <a href="http://atheycreek.com/">local church</a>. Our goal is to study Biblical doctrines with the goal of seeing in a group setting how they apply to our everday lives. We believe that deep theology should be imminently practical and draw us into great worship and obedience to Christ. We want to make the materials we use for these studies available to anyone who is looking to study the Bible in greater depth.</p>
                </div>
                <hr class="soften" />
                <img class="img-polaroid" style="width:1275px; height:500px" src="/workspace/img/spacer.gif">
                  <xsl:attribute name="data-responsimage">
                    <xsl:value-of select="//data/page-data/entry/image/item/image/filename" />
                  </xsl:attribute>
                </img>
              </xsl:if>
              <br /><br />
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Study Title</th>
                    <th>Doctrine</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:apply-templates select="/data/studies-all/entry"/>
                </tbody>
              </table>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span9">
              <xsl:apply-templates select="/data/studies-single/entry"/>
            </div>
            <div class="span3">
              <h4>Related Doctrine</h4>
              <hr />
              <xsl:apply-templates select="/data/doctrines-all/entry[@id = //data/studies-single/entry/doctrine/item/@id]"/>
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

<xsl:template match="/data/studies-all/entry">

  <tr>
    <td><xsl:value-of select="position()" /></td>
    <td>
      <a href="{$root}/{$root-page}/{title/@handle}">
        <xsl:value-of select="title" />
        <xsl:if test="upcoming = 'Yes'">
          <xsl:text>&#160;&#160;</xsl:text>
          <span class="label label-inverse">UPCOMING</span>
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


<xsl:template match="/data/studies-single/entry">
  <div class="entry">
    <xsl:if test="//data/page-data/entry/title != ''">
      <img class="img-polaroid" style="width:100%;" src="/workspace/img/spacer.gif" alt="//data/page-data/entry/image/item/image/caption">
        <xsl:attribute name="data-responsimage">
          <xsl:value-of select="//data/page-data/entry/image/item/image/filename" />
        </xsl:attribute>
      </img>
    </xsl:if>
    <br /><br />
    <h1>
      <xsl:value-of select="title" />
    </h1>
    <div class="content">
      <xsl:value-of select="recap" disable-output-escaping="yes" />
    </div>
  </div>
</xsl:template>


<xsl:template match="/data/doctrines-all/entry[@id = //data/studies-single/entry/doctrine/item/@id]">
  <div class="doctrine">
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