<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- The TOC links in the titles, and in blue. -->
<xsl:param name="latex.hyperparam">linktocpage,colorlinks,linkcolor=blue,pdfstartview=FitH</xsl:param>
<xsl:param name="callout.linkends.hot">0</xsl:param>

<!-- Put the dblatex logo -->
<!-- xsl:param name="doc.publisher.show">1</xsl:param -->

<!-- List the examples and equations too, no tables -->
<xsl:param name="doc.lot.show">figure,example</xsl:param>

<xsl:param name="imagedata.default.scale">maxwidth=15.5cm,maxheight=12cm</xsl:param>
<xsl:param name="draft.mode">no</xsl:param>
<xsl:param name="draft.watermark">0</xsl:param>
<xsl:param name="doc.collab.show">0</xsl:param>


</xsl:stylesheet>
