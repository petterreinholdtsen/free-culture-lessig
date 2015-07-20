<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- size for Licentia based on
  http://www.licentia.no/index.php?option=com_content&task=blogcategory&id=16&Itemid=28
12 x 19 cm
-->

<xsl:param name="doc.collab.show">0</xsl:param>
<xsl:param name="paper.type">no-12x19</xsl:param>
<xsl:param name="page.width">12cm</xsl:param>
<xsl:param name="page.height">19cm</xsl:param>
<xsl:param name="page.margin.inner">2cm</xsl:param>
<xsl:param name="page.margin.outer">1cm</xsl:param>
<xsl:param name="body.start.indent">10pt</xsl:param>
<xsl:param name="double.sided">1</xsl:param>

<xsl:param name="latex.class.book">scrreprt</xsl:param>
<xsl:param name="latex.class.options">paper=12cm:19cm,pagesize=pdftex,headinclude=on,footinclude=on,twoside</xsl:param>

</xsl:stylesheet>
