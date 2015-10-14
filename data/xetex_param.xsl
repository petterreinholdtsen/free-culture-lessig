<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
<xsl:param name="xetex.font">
  <xsl:text>\setmainfont{Crimson Text}&#10;</xsl:text>
  <xsl:text>\setsansfont{Crimson Text}&#10;</xsl:text>
  <xsl:text>\setmonofont{Latin Modern Mono}&#10;</xsl:text>

  <!-- Force <emphasis role='strong'> to be bold, not semibold -->
  <xsl:text>\setmainfont[BoldFont={CrimsonText-Bold}]{Crimson Text}&#10;</xsl:text>
</xsl:param>

<!-- Do it the hard way: put this content in a file loaded by \maketitle -->
<xsl:template match="colophon">
  <xsl:variable name="titlepage.verso">
    <xsl:text>\begin{colophon}&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\end{colophon}&#10;</xsl:text>
  </xsl:variable>
  <xsl:call-template name="write.text.chunk">
    <!-- The filename must end with 'input.rtex' to be parsed by dblatex -->
    <xsl:with-param name="filename">
      <xsl:text>titlepg.input.rtex</xsl:text>
    </xsl:with-param>
    <xsl:with-param name="method" select="'text'"/>
    <xsl:with-param name="content">
      <xsl:value-of select="$titlepage.verso"/>
    </xsl:with-param>
    <xsl:with-param name="encoding" select="$chunker.output.encoding"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
