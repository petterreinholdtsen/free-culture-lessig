<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:import
    href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk.xsl"/>
  <xsl:param name="chunk.section.depth">0</xsl:param>
  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>
  <xsl:param name="use.id.as.filename">1</xsl:param>
  <!-- Restore previous default value with openjade -->
  <xsl:param name="autotoc.label.in.hyperlink" select="0"></xsl:param>
  <xsl:param name="toc.section.depth">3</xsl:param>
</xsl:stylesheet>
