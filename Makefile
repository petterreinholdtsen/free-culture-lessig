#
# configuration here:
#

url = http://www.sslug.dk/~chlor/lessig/freeculture.sgml.2004-04-01.gz

# PDF rule
# Valid book options are a4paper, a5paper, b5paper, letterpaper,
# legalpaper, landscape, 11pt, 12pt, oneside, twocolumn, notitlepage,
# titlepage, openany, draft, fleqn, leqno
#  -P latex.class.options=a5paper
DBLATEX = dblatex
DBLATEX_OPTS = \
	-T simple \
	-b xetex \
	-r data/dblatex-postprocess \
	--indexstyle=myindexstyle.ist \
	--xsl-user=data/user_param.xsl \
	--xsl-user=data/xetex_param.xsl \
	-V \
	-P latex.index.tool=xindy \
	-p data/pdf.xsl


DBTOEPUB = dbtoepub

IMAGES = \
	images/cc.png \
	images/pattern-modern-media-ownership.png \
	images/tom-the-dancing-bug.png \
	images/cover-front-10dpi.png \
	images/cover-front-72dpi.png \
	images/fr/cover-front-10dpi.png \
	images/fr/cover-front-72dpi.png \
	images/nb/cover-front-10dpi.png \
	images/nb/cover-front-72dpi.png

XSLT = \
  data/user_param.xsl

DB_XSLT = \
  data/xetex_param.xsl

HTML_XSLT = \
  $(XSLT) \
  data/html.xsl \
  data/stylesheet-html.xsl

EPUB_XSLT = \
  $(XSLT) \
  data/html.xsl \
  data/stylesheet-epub.xsl

PDF_XSLT = \
  $(DB_XSLT) \
  $(XSLT) \
  data/lulu.xsl \
  data/licentia.xsl \
  data/pdf.xsl \
  data/stylesheet-fo.xsl


all: lint lint.nb lint.fr html epub pdf mobi

freeculture.nb.po freeculture.fr.po freeculture.da.po: freeculture.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg

freeculture.nb.xml: freeculture.nb.po freeculture.xml
	po4a --translate-only freeculture.nb.xml po4a.cfg 

freeculture.fr.xml: freeculture.fr.po freeculture.xml
	po4a --translate-only freeculture.fr.xml po4a.cfg 

freeculture.da.xml: freeculture.da.po freeculture.xml
	po4a --translate-only freeculture.da.xml po4a.cfg 

pdf: freeculture.nb.pdf freeculture.fr.pdf freeculture.pdf
epub: freeculture.nb.epub freeculture.fr.epub freeculture.epub 
mobi: freeculture.nb.mobi freeculture.fr.mobi freeculture.mobi 
html: freeculture.nb.html freeculture.fr.html freeculture.html 

%.pdf: %.xml $(IMAGES) $(PDF_XSLT) Makefile myclass.cls data/dblatex-postprocess
# Possible pipelines:
#
# dblatex:
#   This converts the docbook content to latex and leave it to latex
#   to format it.  Index ranges are broken in oldstable, fixed in jessie.
#
# xmlto:
#   Alternative processing path to dblatex is to use xmlto using fop
#   to create PDF like this.  The PDF output (visual design) is
#   better, but the footnote handling is worse and images are missing.
#
# docbook-xsl:
#   Third alternative is to use xsltproc and fop directly, as
#   recommended by <URL: http://www.sagehill.net/docbookxsl/index.html >.
#   This include images, but the index refs and footnote/endnote handling
#   is broken.

	pipeline=dblatex; \
	echo "Using $$pipeline pipeline" ; \
	case "$$pipeline" in  \
	dblatex) \
	  PATH=$(PWD)/bin:$$PATH $(DBLATEX) $(DBLATEX_OPTS) $< ; \
	  ;; \
	xmlto) \
	  xmlto --noautosize \
	    -x data/stylesheet-fo.xsl \
	    --with-fop pdf $< ; \
	  ;; \
	docbook-xsl) \
	  xsltproc  \
	    --output $(subst .pdf,.fo,$@) \
	    data/stylesheet-fo.xsl \
	    $< ; \
	  fop -c data/fop-params.xconf -fo $(subst .pdf,.fo,$@) -pdf $@ ; \
	  ;; \
	esac

pdf-compare: freeculture.xml $(IMAGES)
	$(DBLATEX) -o freeculture-dblatex.pdf freeculture.xml
	$(DBLATEX) -T db2latex \-o freeculture-dblatex-db2latex.pdf freeculture.xml

	# plain xmlto fail
	#xmlto pdf freeculture.xml && mv freeculture.pdf freeculture-xmlto.pdf
	xmlto --with-fop pdf freeculture.xml && mv freeculture.pdf freeculture-xmlto-fop.pdf

	xsltproc --output freeculture-docbook-xsl.fo \
	  /usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl \
	  freeculture.xml
	fop -fo freeculture-docbook-xsl.fo -pdf freeculture-docbook-xsl.pdf

%.html: %.xml $(IMAGES) $(HTML_XSLT)
	xmlto \
	  -x data/stylesheet-html.xsl \
	  html-nochunks \
	  $<

%.txt: %.xml $(IMAGES)
	xmlto txt $<

%.epub: %.xml $(IMAGES) $(EPUB_XSLT)
	$(DBTOEPUB) \
	-s data/stylesheet-epub.xsl \
	$<

%.mobi: %.epub
	ebook-convert $< $@

freeculture.xml:
	GET $(url) | gunzip > freeculture.xml

# <beginpage> workaround can be removed when BTS #684137 is fixed in
# po4a.
freeculture.pot: freeculture.xml cover-text.xml
	po4a-gettextize -o nodefault='<beginpage>' -o inline='<beginpage>' \
          -o attributes='href' \
	  -f docbook -m freeculture.xml -m cover-text.xml  > $@.new && mv $@.new $@

stats: update-stats progress.png
update-stats: freeculture.nb.po lint.nb
	( \
	printf "%s " $$(date +"%Y-%m-%dT%H%M") ; \
	msgfmt -o /dev/null --statistics freeculture.nb.po 2>&1 \
	) \
	  | sed -e 's/translated messages/oversatte meldinger/' -e 's/fuzzy translations/antatte oversettelser/' -e 's/untranslated messages/oversatte meldinger/' \
	  | tee -a stats.txt
progress.png: stats.txt progress.gnuplot
	awk '{print $$1, $$2, $$5, $$8}' < stats.txt > stats.csv
	gnuplot progress.gnuplot
	rm stats.csv

# Have to disable --postvalid, when using xref with xrefstyle.
# See <URL: http://bugs.debian.org/682944 > for the bug report.
XMLLINTOPTS = --nonet --noout  --xinclude --postvalid 
lint: freeculture.xml
	xmllint $(XMLLINTOPTS) freeculture.xml

lint.nb: freeculture.nb.xml
	xmllint  $(XMLLINTOPTS) freeculture.nb.xml

lint.fr: freeculture.fr.xml
	xmllint  $(XMLLINTOPTS) freeculture.fr.xml

lint.da: freeculture.da.xml
	xmllint  $(XMLLINTOPTS) freeculture.da.xml

images/cc.svg:
	wget -O $@ http://upload.wikimedia.org/wikipedia/commons/9/97/CC_some_rights_reserved_new_2.svg

images/cc.png: images/cc.svg
	inkscape -z -D --export-height=200 -D --export-png=$(shell pwd)/$@ $^

images/cover-art.pdf: images/cover-art.svg
	inkscape --export-dpi=600 --export-pdf=$@ $^

images/nb/cover-art.pdf: images/nb/cover-art.svg
	inkscape --export-dpi=600 --export-pdf=$@ $^

images/fr/cover-art.pdf: images/fr/cover-art.svg
	inkscape --export-dpi=600 --export-pdf=$@ $^

INKSCAPE_FRONTCOORDINATES = 603.54:0:1154.70:832.500
images/cover-front-72dpi.png: images/cover-art.svg Makefile
	inkscape --export-dpi=72 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/cover-art.svg

images/nb/cover-front-72dpi.png: images/nb/cover-art.svg Makefile
	inkscape --export-dpi=72 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/nb/cover-art.svg

images/fr/cover-front-72dpi.png: images/fr/cover-art.svg Makefile
	inkscape --export-dpi=72 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/fr/cover-art.svg

images/cover-front-10dpi.png: images/cover-art.svg Makefile
	inkscape --export-dpi=10 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/cover-art.svg

images/nb/cover-front-10dpi.png: images/nb/cover-art.svg Makefile
	inkscape --export-dpi=10 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/nb/cover-art.svg

images/fr/cover-front-10dpi.png: images/fr/cover-art.svg Makefile
	inkscape --export-dpi=10 --export-png=$@ -a $(INKSCAPE_FRONTCOORDINATES) images/fr/cover-art.svg

.xcf.png:
	convert $^ $@

clean:
	$(RM) *~

distclean: clean
	$(RM) \
	freeculture.pdf \
	freeculture.epub \
	freeculture.html \
	freeculture.txt \
	freeculture.mobi \
	freeculture.nb.pdf \
	freeculture.nb.epub \
	freeculture.nb.html \
	freeculture.nb.txt \
	freeculture.nb.mobi \
	freeculture.nb.xml \
	freeculture.fr.pdf \
	freeculture.fr.epub \
	freeculture.fr.html \
	freeculture.fr.txt \
	freeculture.fr.mobi \
	freeculture.fr.xml \
	freeculture.da.pdf \
	freeculture.da.epub \
	freeculture.da.html \
	freeculture.da.txt \
	freeculture.da.mobi \
	freeculture.da.xml \
	freeculture-docbook-xsl.pdf \
	freeculture-docbook-xsl.fo \
	freeculture-dblatex-db2latex.pdf \
	freeculture-dblatex.pdf \
	freeculture-xmlto-fop.pdf

.SUFFIXES: .png .xcf .svg .xml .pdf
