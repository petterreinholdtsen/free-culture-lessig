<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX 
    ############################################################################ -->

  <xsl:param name="draft.mode">maybe</xsl:param>
  <xsl:param name="glossterm.auto.link">1</xsl:param>
  <xsl:param name="latex.encoding">utf8</xsl:param>
  <xsl:param name="latex.unicode.use">1</xsl:param>
  <xsl:param name="monoseq.hyphenation">nohyphen</xsl:param>
  <xsl:template match="book|article" mode="docinfo">
    <!-- Apply default settings -->
    <xsl:apply-imports/>
    <!--
    <xsl:text>\input{</xsl:text>po4a/hyphenation.<xsl:value-of select="$lingua"/><xsl:text>.tex}</xsl:text>
    -->
  </xsl:template>
</xsl:stylesheet>

