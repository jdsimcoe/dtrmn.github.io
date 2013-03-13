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

  <div class="wrapper">
    <div class="container">
      <div class="marketing main">
        <h2>Browse Our Gospel-Centered Content:</h2>
        <br/>
        <br/>
        <div class="row grid second">
          <div class="span6">
            <a href="{$root}/about" class="logo icon-large">D</a>
            <h2>
              <a href="{$root}/about">The Gospel</a>
            </h2>
            <p>Determine is primarily about <a href="{$root}/about">the Gospel</a> and seeing the deep realities of what God accomplished for us being moved into our everyday lives and lived out.</p>
          </div>
          <div class="span6">
            <a href="{$root}/doctrine" class="glyphicon-book icon-large"></a>
            <h2>
              <a href="{$root}/doctrine">Doctrine</a>
            </h2>
            <p>We have a growing library of short surveys on <a href="{$root}/doctrine">Biblical doctrines</a>. These pieces highlight theological subjects for further study and help engage our hearts and minds with the truths of Scripture.</p>
          </div>
        </div>
        <hr/>
        <br/>
        <div class="row grid second">
          <div class="span3">
            <a href="{$root}/blog" class="glyphicon-list-alt icon-large"></a>
            <h2>
              <a href="{$root}/blog">Blog</a>
            </h2>
            <p>Our <a href="{$root}/blog">blog articles</a> are longer pieces centered on the Gospel to help you deepen your relationship with Christ and your love of the Scriptures.</p>
          </div>
          <div class="span3">
            <a href="{$root}/quotes" class="glyphicon-comment icon-large"></a>
            <h2>
              <a href="{$root}/quotes">Quotes</a>
            </h2>
            <p><a href="{$root}/quotes">Quotes</a> are usually short sound-bites from Gospel-centered preachers and scholars with short bits of commentary and reflection.</p>
          </div>
          <div class="span3">
            <a href="{$root}/books" class="glyphicon-bookmark icon-large"></a>
            <h2>
              <a href="{$root}/books">Books</a>
            </h2>
            <p>We have <a href="{$root}/books">reviews of relevant Christian books</a> that we have found helpful in pursuing Christ and growing in our love for Him.</p>
          </div>
          <div class="span3">
            <a href="{$root}/studies" class="glyphicon-fire icon-large"></a>
            <h2>
              <a href="{$root}/studies">Studies</a>
            </h2>
            <p>Follow along with our small group <a href="{$root}/studies">studies</a> we have been doing at our <a href="http://atheycreek.com/">local church</a> as a way to more deeply interact with Scripture.</p>
          </div>
        </div>
      </div>

    </div>
  </div>

</xsl:template>


</xsl:stylesheet>