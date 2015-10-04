<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:param name="chunk.section.depth">0</xsl:param>
  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>
  <xsl:param name="use.id.as.filename">1</xsl:param>
  <!-- Restore previous default value with openjade -->
  <xsl:param name="autotoc.label.in.hyperlink" select="0"></xsl:param>
  <xsl:param name="toc.section.depth">3</xsl:param>

  <!-- Add <hr> after the dedication block, based on block from
       /usr/share/xml/docbook/stylesheet/docbook-xsl/html/component.xsl
       -->
  <xsl:template match="dedication" mode="dedication">
    <xsl:call-template name="id.warning"/>
    <div>
      <xsl:call-template name="common.html.attributes">
	<xsl:with-param name="inherit" select="1"/>
      </xsl:call-template>
      <xsl:call-template name="id.attribute">
	<xsl:with-param name="conditional" select="0"/>
      </xsl:call-template>
      <xsl:call-template name="dedication.titlepage"/>
      <xsl:apply-templates/>
      <xsl:call-template name="process.footnotes"/>
    </div>
    <hr/>
  </xsl:template>
</xsl:stylesheet>
