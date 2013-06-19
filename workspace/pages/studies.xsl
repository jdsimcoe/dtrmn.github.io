<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="wrapper studies">
    <div class="container">
      <xsl:choose>
        <xsl:when test="$title = ''">
          <xsl:for-each select="//data/studies-groups/entry[studies/item != '']">
            <div class="span12">
              <div class="marketing">
                <div class="span8 offset2">
                  <h2><xsl:value-of select="title"/></h2>
                  <br/>
                  <img src="/workspace/img/spacer.gif" class="img-round" width="100%">
                    <xsl:attribute name="data-responsimage">
                      <xsl:value-of select="image/item/image/filename" />
                    </xsl:attribute>
                  </img>
                </div>
              </div>
              <div class="span8 offset2 description">
                <xsl:value-of select="description" disable-output-escaping="yes" />
              </div>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Study Title</th>
                    <th>Doctrine</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="studies/item">
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
                      <td><xsl:value-of select="doctrine/item/title" /></td>
                      <td>
                        <span class="esv-ignore">
                          <xsl:call-template name="format-date">
                            <xsl:with-param name="date" select="date/date/start/@iso" />
                            <xsl:with-param name="format" select="'%m-; %d;, %y+;'" />
                          </xsl:call-template>
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <div class="row">
            <div class="span8 offset2">
              <xsl:apply-templates select="/data/studies-single/entry"/>
              <xsl:call-template name="back-link"/>
            </div>

          </div>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>


</xsl:template>


<xsl:template match="/data/studies-single/entry">
  <div class="entry">
    <br />
    <xsl:choose>
      <xsl:when test="video != ''">
        <xsl:value-of select="video" disable-output-escaping="yes" />
      </xsl:when>
      <xsl:otherwise>
        <img style="width:900px; height:353px" src="/workspace/img/spacer.gif" alt="{/data/studies-groups/entry[studies/item/@id = //data/studies-single/entry/@id]/image/item/caption}">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="/data/studies-groups/entry[studies/item/@id = //data/studies-single/entry/@id]/image/item/image" />
          </xsl:attribute>
        </img>
      </xsl:otherwise>
    </xsl:choose>

    <br /><br />
    <xsl:call-template name="edit-entry">
      <xsl:with-param name="component" select="'study'"/>
    </xsl:call-template>
    <h1>
      <xsl:value-of select="title" />
    </h1>
    <div class="content">
      <xsl:if test="summary != ''">
        <xsl:value-of select="summary" disable-output-escaping="yes" />
        <hr/>
      </xsl:if>

      <xsl:choose>
        <xsl:when test="doctrine/item != ''">
          <h2>
            <xsl:value-of select="doctrine/item/title" disable-output-escaping="no" />
            <xsl:text> is:</xsl:text>
          </h2>
          <em>
            <xsl:value-of select="doctrine/item/summary" disable-output-escaping="yes" />
          </em>
          <hr/>
          <xsl:value-of select="doctrine/item/content" disable-output-escaping="yes" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="content" disable-output-escaping="yes" />
        </xsl:otherwise>
      </xsl:choose>

      <xsl:if test="questions != ''">
        <hr/>
        <h3>Study Questions: </h3>
        <xsl:value-of select="questions" disable-output-escaping="yes" />
      </xsl:if>

    </div>
  </div>
</xsl:template>


</xsl:stylesheet>