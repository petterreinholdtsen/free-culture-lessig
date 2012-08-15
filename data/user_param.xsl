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
    <!--
    <xsl:text>\input{</xsl:text>po4a/hyphenation.<xsl:value-of select="$lingua"/><xsl:text>.tex}</xsl:text>
    -->
  </xsl:template>

  <xsl:param name="hyphenate">false</xsl:param>
  <xsl:param name="generate.toc">book toc title</xsl:param>

  <!-- Drop the number in front of chapters -->
  <xsl:param name="local.l10n.xml" select="document('')"/> 
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="nb">
      <l:context name="title-numbered">
	<l:template name="chapter" text="%t"/>
      </l:context>
    </l:l10n>
  </l:i18n>


  <!-- Fix bugs in default nb locale -->
  <xsl:template name="gentext.startquote">
    <xsl:text>«</xsl:text>
  </xsl:template>
  <xsl:template name="gentext.endquote">
    <xsl:text>»</xsl:text>
  </xsl:template>
  <xsl:template name="gentext.nestedstartquote">
    <xsl:text>«</xsl:text>
  </xsl:template>
  <xsl:template name="gentext.nestedendquote">
    <xsl:text>»</xsl:text>
  </xsl:template>

  <!-- This is not working.  No idea why -->
  <xsl:template name="gentext.Index">
    <xsl:text>Register</xsl:text>
  </xsl:template>
  <xsl:template name="gentext.index">
    <xsl:text>register</xsl:text>
  </xsl:template>

</xsl:stylesheet>
