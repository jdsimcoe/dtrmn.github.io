<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/globals.xsl"/>


<xsl:template match="data">

  <div class="container">
    <div class="marketing main">

      <h1>What is Determine?</h1>
      <p class="marketing-byline">Like Paul declared above, our goal is to make the Gospel of Jesus Christ known, treasured and embraced in every facet of life. We are striving to do this in the following ways:</p>
      <div class="row grid first">
        <div class="span4">
          <a href="{$root}/about" class="logo icon-large">a</a>
          <h2>The Gospel</h2>
          <p>Determine is primarily about <a href="{$root}/about">the Gospel</a> and seeing the deep realities of what God accomplished for us being moved into our everyday lives.</p>
        </div>
        <div class="span4">
          <a href="{$root}/doctrine" class="glyphicon-book icon-large"></a>
          <h2>Bible doctrine</h2>
          <p>We are working on a library of short surveys of <a href="{$root}/doctrine">Biblical doctrine</a>. These pieces highlight theological subjects for further study.</p>
        </div>
        <div class="span4">
          <a href="{$root}/foundations" class="logo icon-large">b</a>
          <h2>In-depth studies</h2>
          <p>Follow along with the <a href="{$root}/foundations">Foundations</a> curriculum we are developing as a group study at our <a href="http://atheycreek.com/">local church</a>. Access dicsussion questions free of charge.</p>
        </div>
      </div>
      <div class="row grid second">
        <div class="span4">
          <a href="{$root}/blog" class="glyphicon-list-alt icon-large"></a>
          <h2>Blog articles</h2>
          <p>Our <a href="{$root}/blog">blog articles</a> are longer pieces centered on the Gospel to help you deepen your relationship with Christ and your love of the Scriptures.</p>
        </div>
        <div class="span4">
          <a href="{$root}/quotes" class="glyphicon-comment icon-large"></a>
          <h2>Helpful quotes</h2>
          <p><a href="{$root}/quotes">Quotes</a> are usually short sound-bites from Gospel-centered preachers and scholars with short bits of commentary and reflection.</p>
        </div>
        <div class="span4">
          <a href="{$root}/books" class="glyphicon-bookmark icon-large"></a>
          <h2>Book reviews</h2>
          <p>We have <a href="{$root}/books">reviews of relevant Christian books</a> that we have found helpful in pursuing Christ and growing in our love for Him.</p>
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