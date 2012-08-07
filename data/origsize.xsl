<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
		xmlns:fo="http://www.w3.org/1999/XSL/Format" >

<!-- settings from original PDF version -->

<xsl:param name="paper.type">book5x7.5</xsl:param>
<xsl:param name="page.width">5in</xsl:param>
<xsl:param name="page.height">7.51in</xsl:param>

<xsl:param name="page.margin.inner">1.0in</xsl:param>
<xsl:param name="page.margin.outer">0.8in</xsl:param>
<xsl:param name="body.start.indent">0pt</xsl:param>
<xsl:param name="body.font.family">Times</xsl:param>
<xsl:param name="title.font.family">Times</xsl:param>
<xsl:param name="dingbat.font.family">Times</xsl:param>

<!-- from http://cygwin.com/ml/docbook-apps/2004-q2/msg00107.html -->
<!-- ~~~~~~~~~~~~~~~~ -->
<!-- Paragraph layout -->
<!-- ~~~~~~~~~~~~~~~~ -->
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

</xsl:stylesheet>
