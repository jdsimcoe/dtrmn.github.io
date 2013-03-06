<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>


<xsl:variable name="title">
  <xsl:text>About Determine</xsl:text>
</xsl:variable>

<xsl:template match="data">
  <div class="wrapper">
    <div class="container">
      <div class="marketing main">
        <h2>What is Determine?</h2>
        <p class="marketing-byline">Determine was started with the intent and purpose to share the Gospel of Jesus Christ with a dying world and to encourage Christians to live every day in light of what Christ did for us. While we recognize there are many things that we could choose to focus on or talk about, we recognize that the unadjusted Gospel of Jesus Christ is central to the health of the Church and we aim to make everything we do about exposing the Gospel to the dying world and to those sleeping on religion within the Church. Join us as we seek to marinate in the Gospel:</p>
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