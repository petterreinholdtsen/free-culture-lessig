<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- We want the footnotes being endnotes, grouped by preface, part, and chapter
     where each group heading recalls only the element title. The endnote
     headings are formatted specifically by the new section \enoteheader
     defined in myclass.cls.
-->
  <xsl:param name="footnote.as.endnote" select="1"/>
  <xsl:param name="endnotes.heading.groups" select="'part chapter preface'"/>
  <xsl:param name="endnotes.heading.style" select="'select:title'"/>
  <xsl:param name="endnotes.heading.command" select="'\enoteheader*'"/>

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

  <xsl:template match="preface" mode="endnotes">
    <xsl:call-template name="endnotes.add.header">
      <xsl:with-param name="reset-counter" select="1"/>
    </xsl:call-template>
  </xsl:template>

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
