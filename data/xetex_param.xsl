<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<xsl:param name="book.font" select="'crimson'"/>

<xsl:param name="xetex.font.crimson">
  <xsl:text>\setmainfont{Crimson Text}&#10;</xsl:text>
  <xsl:text>\setsansfont{Crimson Text}&#10;</xsl:text>
  <xsl:text>\setmonofont{Latin Modern Mono}&#10;</xsl:text>

  <!-- Force <emphasis role='strong'> to be bold, not semibold -->
  <xsl:text>\setmainfont[BoldFont={CrimsonText-Bold}]{Crimson Text}&#10;</xsl:text>

  <!-- Use a font that has smallcaps -->
  <xsl:text>\newfontinstance\scshape[Letters=SmallCaps,Scale=1.15]{Crimson}&#10;</xsl:text>

  <!-- Use a smaller font except for the letter heading which is bold -->
  <xsl:text>\newfontfamily\indexfont[Scale=0.7,
                           BoldFeatures={Scale=1}]{Crimson Text}&#10;</xsl:text>
</xsl:param>

<xsl:param name="xetex.font.alegreya">
  <xsl:text>\setmainfont[SmallCapsFont={Alegreya SC}]{Alegreya}&#10;</xsl:text>
  <xsl:text>\setsansfont{Alegreya Sans}&#10;</xsl:text>
  <xsl:text>\setmonofont{DejaVu Sans Mono}&#10;</xsl:text>

  <!-- Use a smaller font except for the letter heading which is bold -->
  <xsl:text>\newfontfamily\indexfont[Scale=0.7,
                           BoldFeatures={Scale=1}]{Alegreya}&#10;</xsl:text>
</xsl:param>

<xsl:param name="xetex.font.gandhi">
  <xsl:text>\setmainfont[SmallCapsFont={Alegreya SC}]{Gandhi Serif}&#10;</xsl:text>
  <xsl:text>\setsansfont{Gandhi Sans}&#10;</xsl:text>
  <xsl:text>\setmonofont{DejaVu Sans Mono}&#10;</xsl:text>

  <!-- Use a smaller font except for the letter heading which is bold -->
  <xsl:text>\newfontfamily\indexfont[Scale=0.7,
                           BoldFeatures={Scale=1}]{Gandhi Serif}&#10;</xsl:text>
</xsl:param>

<xsl:param name="xetex.font">
  <xsl:choose>
  <xsl:when test="$book.font = 'crimson'">
    <xsl:value-of select="$xetex.font.crimson"/>
  </xsl:when>
  <xsl:when test="$book.font = 'gandhi'">
    <xsl:value-of select="$xetex.font.gandhi"/>
  </xsl:when>
  <xsl:when test="$book.font = 'alegreya'">
    <xsl:value-of select="$xetex.font.alegreya"/>
  </xsl:when>
  <xsl:otherwise>
    <!-- Fallback to the default Crimson font -->
    <xsl:value-of select="$xetex.font.crimson"/>
  </xsl:otherwise>
  </xsl:choose>
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

<!-- French typography requises the surname of the cited authors being in
     Small Capitals -->
<xsl:template match="footnote//personname">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="footnote//surname">
  <xsl:text>\textsc{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}</xsl:text>
</xsl:template>

</xsl:stylesheet>
