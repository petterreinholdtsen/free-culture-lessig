<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- settings for LuLu PDF version -->

<xsl:param name="doc.collab.show">0</xsl:param>
<xsl:param name="paper.type">us-trade-6x9</xsl:param>
<xsl:param name="page.width">6in</xsl:param>
<xsl:param name="page.height">9in</xsl:param>
<xsl:param name="page.margin.inner">1.0in</xsl:param>
<xsl:param name="page.margin.outer">0.8in</xsl:param>
<xsl:param name="body.start.indent">0pt</xsl:param>
<xsl:param name="double.sided">1</xsl:param>

<!-- used by dblatex -->
<xsl:param name="latex.class.options">paper=6in:9in,pagesize=pdftex,headinclude=on,footinclude=on,twoside</xsl:param>

</xsl:stylesheet>
