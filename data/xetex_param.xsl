<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
  <xsl:param name="xetex.font">
    <xsl:text>\setmainfont{Crimson Text}&#10;</xsl:text>
    <xsl:text>\setsansfont{Crimson Text}&#10;</xsl:text>
    <xsl:text>\setmonofont{Latin Modern Mono}&#10;</xsl:text>

    <!-- Force <emphasis role='strong'> to be bold, not semibold -->
    <xsl:text>\setmainfont[BoldFont={CrimsonText-Bold}]{Crimson Text}&#10;</xsl:text>
  </xsl:param>
</xsl:stylesheet>
