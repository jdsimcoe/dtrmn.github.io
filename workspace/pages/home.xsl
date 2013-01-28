<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="container">
    <div class="marketing main">

      <h2>What is Determine?</h2>
      <p class="marketing-byline">Like Paul declared above, our goal is to make the Gospel of Jesus Christ known, treasured and embraced in every facet of life. We are striving to do this in the following ways:</p>
      <div class="row grid first">
        <div class="span6">
          <a href="{$root}/about" class="logo icon-large huge">a</a>
          <h2>
            <a href="{$root}/about">The Gospel</a>
          </h2>
          <p>Determine is primarily about <a href="{$root}/about">the Gospel</a> and seeing the deep realities of what God accomplished for us being moved into our everyday lives and lived out. The Gospel is what brings us into life with God and what produces fruit in our lives as Christ-followers.</p>
        </div>
        <div class="span6">
          <a href="{$root}/doctrine" class="glyphicon-book icon-large huge"></a>
          <h2>
            <a href="{$root}/doctrine">Biblical Doctrine</a>
          </h2>
          <p>We have a growing library of short surveys on <a href="{$root}/doctrine">Biblical doctrines</a>. These pieces highlight theological subjects for further study and help engage our hearts and minds with the truths of Scripture, which is given for our growth, instruction, and correction (2 Timothy 3:16).</p>
        </div>
      </div>
      <hr class="soften"/>
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
          <a href="{$root}/foundations" class="logo icon-large">b</a>
          <h2>
            <a href="{$root}/foundations">Studies</a>
          </h2>
          <p>Follow along with the <a href="{$root}/foundations">Foundations</a> groudy study we are doing at our <a href="http://atheycreek.com/">local church</a> as a way to more deeply interact with Scripture.</p>
        </div>
      </div>

    </div>
  </div>

  <div class="stripe first">
    <div class="container">
      <h3>Bible Doctrines</h3>
      <div class="row">
        <xsl:apply-templates select="/data/doctrines-3-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe second">
    <div class="container">
      <h3>From the Blog</h3>
      <div class="row">
        <xsl:apply-templates select="/data/articles-4-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe third">
    <div class="container">
      <h3>Latest Quotes</h3>
      <div class="row">
        <xsl:apply-templates select="/data/quotes-4-latest/entry"/>
      </div>
    </div>
  </div>

  <div class="stripe fourth">
    <div class="container">
      <h3>Latest Books</h3>
      <div class="row">
        <xsl:apply-templates select="/data/books-4-latest/entry"/>
      </div>
      <br />
      <br />
    </div>
  </div>

</xsl:template>


</xsl:stylesheet>