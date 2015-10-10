<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- The TOC links in the titles, and in blue. -->
<!-- ensure URLs in the text do not end up light gray too -->
<xsl:param name="latex.hyperparam">linktocpage,colorlinks,linkcolor=black,urlcolor=black,pdfstartview=FitH</xsl:param>

<xsl:param name="callout.linkends.hot">0</xsl:param>

<!-- Put the dblatex logo -->
<!-- xsl:param name="doc.publisher.show">1</xsl:param -->

<!-- List the examples and equations too, no tables and figures -->
<xsl:param name="doc.lot.show">example</xsl:param>

<!-- Only want chapter numbers -->
<xsl:param name="doc.section.depth">0</xsl:param>

<xsl:param name="latex.class.book">myclass</xsl:param>
<xsl:param name="latex.output.revhistory">0</xsl:param>

<xsl:param name="imagedata.default.scale">maxwidth=15.5cm,maxheight=12cm</xsl:param>
<xsl:param name="draft.mode">yes</xsl:param>
<xsl:param name="draft.watermark">0</xsl:param>
<xsl:param name="doc.collab.show">0</xsl:param>

<xsl:param name="insert.xref.page.number">1</xsl:param>

<xsl:include href="lulu.xsl" />
<!-- xsl:include href="createspace.xsl" /-->
<!-- xsl:include href="licentia.xsl" /-->

<!-- xsl:include href="origsize.xsl" /-->

<!-- fall back to duplex A4 if not creating PDF for a specific size. -->
<!-- xsl:param name="paper.type">A4</xsl:param -->
<xsl:param name="double.sided">1</xsl:param>
<xsl:param name="page.margin.inner">0.8in</xsl:param>
<xsl:param name="page.margin.outer">0.55in</xsl:param>
<xsl:param name="page.margin.top">0.55in</xsl:param>
<xsl:param name="page.margin.bottom">0.55in</xsl:param>
<xsl:param name="latex.class.options">a4paper,openright,twoside</xsl:param>

<!-- font for XSL/FOP, see also fop-params.xconf -->
<!-- The original book used Adobe Caslon, and this free font is pretty similar -->
<xsl:param name="body.font.family">Crimson Text</xsl:param>
<xsl:param name="sans.font.family">Crimson Text</xsl:param>
<xsl:param name="title.font.family">Crimson Text</xsl:param>
<xsl:param name="slide.font.family">Crimson Text</xsl:param>
<xsl:param name="slide.title.font.family">Crimson Text</xsl:param>
<xsl:param name="monospace.font.family">Latin Modern Mono</xsl:param>

<!-- transform footnotes to endnotes -->
<xsl:param name="footnote.as.endnote" select="1"/>

<!-- configure the endnotes package -->
<xsl:attribute-set name="endnotes.properties"
                     use-attribute-sets="endnotes.properties.default">
<!--
Increase footnote/endnote size to be more than 6 pts, to avoid
complaint from Lulu about the font being too small to be printed
clearly.  Needed at least for pocket size books.  Probably wise to use
the same size as the colophon page (see myclass.cls)

make sure \fontsize{x}{y} use y=1.2*x, x >= 6
-->

  <!--xsl:attribute name="font-size">\fontsize{10}{12}</xsl:attribute-->
  <xsl:attribute name="font-size">\footnotesize</xsl:attribute>
  <!--xsl:attribute name="font-size">\normalsize</xsl:attribute-->
</xsl:attribute-set>

<!-- the endnotes are grouped by part, chapter, and preface -->
<xsl:param name="endnotes.heading.groups" select="'part chapter preface'"/>
<xsl:param name="endnotes.heading.style" select="'select:title'"/>
<xsl:param name="endnotes.heading.command" select="'\enoteheader*'"/>

<xsl:template match="preface" mode="endnotes">
  <xsl:call-template name="endnotes.add.header"/>
</xsl:template>

<!-- even if grouped, never reset the endnotes counter, so clear the rule -->
<xsl:param name="endnotes.counter.resetby"/>


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
