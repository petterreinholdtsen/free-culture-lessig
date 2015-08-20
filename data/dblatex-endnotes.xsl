<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!--
Trick to get endnote support.  Should have a way to insert LaTeX code
outside xetex font values.  As it is missing, reuse the
latex.begindocument value (aka \begin{document} to get a code fragment
in front of it.
-->
  <xsl:param name="footnote.as.endnote" select="1"/>

  <xsl:attribute-set name="endnotes.properties"
                     use-attribute-sets="endnotes.properties.default">
<!--
Increase footnote/endnote size to be more than 6 pts, to avoid
complaint from Lulu about the font being too small to be printed
clearly.  Needed at least for pocket size books.  Probably wise to use
the same size as the colophon page (see myclass.cls)

for \fontsize{x}{y}, use y=1.2*x, x >= 6
-->

    <!--xsl:attribute name="font-size">\fontsize{10}{12}</xsl:attribute-->
    <xsl:attribute name="font-size">\footnotesize</xsl:attribute>
    <!--xsl:attribute name="font-size">\normalsize</xsl:attribute-->
  </xsl:attribute-set>

  <xsl:param name="latex.begindocument">
    <xsl:text>
% Trick to avoid many words sticking out of the right margin of the text.
% Need to add it here with the end notes, as only one
% latex.begindocument can be active.
\sloppy

\begin{document}
    </xsl:text>
  </xsl:param>

</xsl:stylesheet>
