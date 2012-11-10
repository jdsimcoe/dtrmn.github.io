<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <html>
      <head>
          <title>Determine</title>
      </head>
      <body>
          <h1>Symphony Greets the World</h1>
          <h2>Greetings</h2>
          <ul>
              <xsl:apply-templates select="/data/articles-4-latest/entry"/>
          </ul>
      </body>
  </html>
</xsl:template>

<xsl:template match="/data/articles-4-latest/entry">
  <li><xsl:value-of select="date"/></li>
</xsl:template>

</xsl:stylesheet>