<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
<!-- vim: set sts=2 ai expandtab: -->

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX 
    ############################################################################ -->

  <xsl:param name="xetex.font">
    <!-- Western centric Adobe PostScript looks-alike: gsfonts -->
    <xsl:text>\setmainfont{Nimbus Roman No9 L}&#10;</xsl:text>
    <xsl:text>\setsansfont{Nimbus Sans L}&#10;</xsl:text>
    <xsl:text>\setmonofont{Nimbus Mono L}&#10;</xsl:text>
    <xsl:text>\usepackage{xeCJK}&#10;</xsl:text>
    <xsl:choose>
      <xsl:when test="$lingua = 'zh-cn'">
	<!-- zh_CN centric: ttf-arphic-gbsn00lp, ttf-wqy-zenhei -->
        <xsl:text>\setCJKmainfont{AR PL SungtiL GB}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{WenQuanYi Zen Hei}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{WenQuanYi Zen Hei Mono}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'zh-tw'">
        <!-- zh_TW centric: ttf-arphic-bsmi00lp, ttf-wqy-zenhei -->
        <xsl:text>\setCJKmainfont{AR PL Mingti2L Big5}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{WenQuanYi Zen Hei}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{WenQuanYi Zen Hei Mono}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'ja'">
        <!-- ja centric: otf-ipafont-mincho otf-ipafont-gothic -->
        <xsl:text>\setCJKmainfont{IPAMincho}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{IPAPGothic}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{IPAGothic}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'ko'">
        <!-- ko centric: ttf-unfonts-core -->
        <xsl:text>\setCJKmainfont{UnBatang}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{UnDotum}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{UnDotum}&#10;</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:param>

</xsl:stylesheet>

<!--
= Asian font basics =

== Sanserif ==
  simplified Chinese: 黑体 hēi tǐ
    ttf-wqy-zenhei (zh_CN centric)
      WenQuanYi Zen Hei,文泉驛正黑,文泉驿正黑
      WenQuanYi Zen Hei Sharp,文泉驛點陣正黑,文泉驿点阵正黑
      WenQuanYi Zen Hei Mono,文泉驛等寬正黑,文泉驿等宽正黑
  traditional Chinese: 黑體 hēi tǐ 
  Japanese: ゴシック kaku goshikku, gothic
    otf-ipafont-gothic (ja centric)
      IPAGothic,IPAゴシック
      IPAPGothic,IPA Pゴシック

== Serif ==
中国大陆一般称：宋体；台湾香港一般称：明體
  simplified Chinese: 宋体/(明体), Sòngtǐ
    ttf-arphic-gbsn00lp (zh_CN centric)
      AR PL SungtiL GB
  traditional Chinese: (宋體)/明體, Sòngtǐ
    ttf-arphic-bsmi00lp (zh_TW centric)
      AR PL Mingti2L Big5
      (Missing some character in output...)
    ttf-arphic-uming    (zh_TW centric)
      AR PL UMing
       = "AR PL Mingti2L Big5" and "AR PL SungtiL GB" + extra in Taiwan-style
       (BUild failure happened thus not used)
  Japanese: 明朝体, Minchōtai
    otf-ipafont-mincho (ja centric)
      IPAMincho,IPA明朝:style=Regular
      IPAPMincho,IPA P明朝:style=Regular
  Korean: Hangul: 명조체; Hanja: 明朝體; Revised Romanization: Myeongjoche

== Script () ==
  simplified Chinese: 楷书; kǎishū
    ttf-arphic-gkai00mp (zh_CN centric)
      AR PL KaitiM GB
  traditional Chinese: 楷書; kǎishū
    ttf-arphic-bkai00mp (zh_TW centric)
      AR PL KaitiM Big5
    ttf-arphic-ukai     (zh_TW centric)
      AR PL UKai
       = AR PL KaitiM Big5" + "AR PL KaitiM GB" + extra in Taiwan-style
  Japanese: 楷書, kaisho (教科書体)

Korean:
ttf-baekmuk 1st most popular    which contains 4 font families.
                                latex-cjk-xcjk suggest this
      /usr/share/fonts/truetype/baekmuk/dotum.ttf
      /usr/share/fonts/truetype/baekmuk/hline.ttf
      /usr/share/fonts/truetype/baekmuk/gulim.ttf
      /usr/share/fonts/truetype/baekmuk/batang.ttf
      Baekmuk Batang,백묵 바탕:style=Regular       ... serif
      Baekmuk Dotum,백묵 돋움:style=Regular        ... san-serif  medium (print?)
      Baekmuk Gulim,백묵 굴림:style=Regular        ... san-serif  thin   (screen?)
      Baekmuk Headline,백묵 헤드라인:style=Regular ... bold san-serif    (best screen small)
ttf-unfonts-core    2nd popular and increasing
                    made from the HLaTeX's PostScript fonts
                    UnBatang, UnDotum, Ungraphic, Unpilgi, and UnGungseo
      UnBatang  ... serif
      UnDotum   ... san-serif
      UnGungseo ... Kai/kaisho
                    latex-cjk-xcjk uses UnBatang as example
ttf-alee    3rd most popular    many fonts by alee
ttf-nanum                       Myeongjo and Gothic Korean font families/screen font
ttf-nanum-coding                Korean fixed width font family

encoding names:
  * GB2312, GBK or GB18030: Simplified Chinese
  * Big5:                   Traditional Chinese
-->

