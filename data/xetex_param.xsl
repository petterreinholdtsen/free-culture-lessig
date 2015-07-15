<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
<!-- vim: set sts=2 ai expandtab: -->

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX 
    ############################################################################ -->

  <xsl:param name="xetex.font">
    <!-- Western centric Adobe PostScript looks-alike: gsfonts -->
    <xsl:text>\setmainfont{Crimson Text}&#10;</xsl:text>
    <xsl:text>\setsansfont{Crimson Text}&#10;</xsl:text>
    <xsl:text>\setmonofont{Nimbus Mono L}&#10;</xsl:text>
  </xsl:param>
</xsl:stylesheet>
