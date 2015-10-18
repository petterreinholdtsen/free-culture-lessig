<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX 
    ############################################################################ -->

  <xsl:param name="draft.mode">maybe</xsl:param>
  <xsl:param name="glossterm.auto.link">1</xsl:param>
  <xsl:param name="latex.encoding">utf8</xsl:param>
  <xsl:param name="latex.unicode.use">1</xsl:param>
  <xsl:param name="monoseq.hyphenation">nohyphen</xsl:param>
  <xsl:template match="book|article" mode="docinfo">
    <!-- Apply default settings -->
    <xsl:apply-imports/>
  </xsl:template>

  <xsl:param name="hyphenate">false</xsl:param>
  <xsl:param name="generate.toc">book toc title</xsl:param>

  <!-- Require dblatex 0.3.7 or newer -->
  <xsl:param name="figure.title.top">0</xsl:param>
  <xsl:param name="figure.anchor.top">1</xsl:param>

  <xsl:param name="local.l10n.xml" select="document('')"/> 
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <!-- Drop the number in front of chapters -->
    <l:context name="title-numbered">
      <l:template name="chapter" text="%t"/>
    </l:context>

    <l:l10n language="en">
      <!-- The default page citation [12] is hard to understand for
           most readers.  use (p. 12) instead. -->
      <l:context name="xref">
	<l:template name="page.citation" text=" (p.&#160;%p)"/>
      </l:context>
    </l:l10n>

    <l:l10n language="fr">
      <l:context name="xref">
	<l:template name="page.citation" text=" (p.&#160;%p)"/>
      </l:context>
    </l:l10n>

    <l:l10n language="nb">
      <!-- Fix bugs in default nb locale -->
      <l:dingbat key="startquote" text="«"/>
      <l:dingbat key="endquote" text="»"/>
      <l:dingbat key="nestedstartquote" text="‘"/>
      <l:dingbat key="nestedendquote" text="’"/>

      <l:context name="xref">
	<l:template name="page.citation" text=" (s.&#160;%p)"/>
      </l:context>
    </l:l10n>
  </l:i18n>

  <!-- Make preface show up in toc for dblatex -->
  <xsl:param name="preface.tocdepth">1</xsl:param>

</xsl:stylesheet>
