<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
		xmlns:fo="http://www.w3.org/1999/XSL/Format" >

<!-- settings from original 2004 hardcover version -->

<!-- xsl:param name="paper.type">book5x7.5</xsl:param -->
<xsl:param name="page.width">5.51in</xsl:param>
<xsl:param name="page.height">8.23in</xsl:param>

<xsl:param name="page.margin.top">0.71in</xsl:param>
<xsl:param name="page.margin.bottom">0.87in</xsl:param>
<xsl:param name="page.margin.inner">0.67in</xsl:param>
<xsl:param name="page.margin.outer">0.71in</xsl:param>
<xsl:param name="body.start.indent">0pt</xsl:param>
<xsl:param name="body.font.family">Crimson Text</xsl:param>
<xsl:param name="title.font.family">Crimson Text</xsl:param>
<xsl:param name="dingbat.font.family">Crimson Text</xsl:param>

<xsl:param name="latex.class.options">pagesize=pdftex,headinclude=on,footinclude=on,twoside</xsl:param>

<!-- from http://cygwin.com/ml/docbook-apps/2004-q2/msg00107.html -->
<!-- ~~~~~~~~~~~~~~~~ -->
<!-- Paragraph layout -->
<!-- ~~~~~~~~~~~~~~~~ -->
<!-- did not work, hides footnote numbers in front of footnote text.
<xsl:template match="para[1]">
  <fo:block xsl:use-attribute-sets="normal.para.spacing">
    <xsl:call-template name="anchor"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="para">
  <fo:block xsl:use-attribute-sets="normal.para.spacing">
    <xsl:attribute name="text-indent">0.15in</xsl:attribute>
    <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0pt</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1pt</xsl:attribute>
    <xsl:call-template name="anchor"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
-->
</xsl:stylesheet>
