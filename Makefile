#
# configuration here:
#

url = http://www.sslug.dk/~chlor/lessig/freeculture.sgml.2004-04-01.gz

# PDF rule
# Valid book options are a4paper, a5paper, b5paper, letterpaper,
# legalpaper, landscape, 11pt, 12pt, oneside, twocolumn, notitlepage,
# titlepage, openany, draft, fleqn, leqno
DBLATEX = dblatex \
	-P latex.class.options=a5paper \
	-T db2latex \
	--backend=xetex \
	--xsl-user=data/user_param.xsl \
	--xsl-user=data/xetex_param.xsl \
	-p data/pdf.xsl \
	--param=lingua=nb

DBTOEPUB = dbtoepub

IMAGES = images/cc.png

all: lint lint.nb html epub pdf

freeculture.nb.po: freeculture.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg

freeculture.nb.xml: freeculture.nb.po freeculture.xml
	po4a --translate-only freeculture.nb.xml po4a.cfg 

pdf: freeculture.nb.pdf freeculture.pdf
epub: freeculture.nb.epub 
html: freeculture.html freeculture.nb.html 

%.pdf: %.xml $(IMAGES)
	$(DBLATEX) $< --param=lingua=nb

# Alternative processing path to dblatex is to use xmlto using fop to
# create PDF like this.  The PDF output (visual design) is better, but
# the PDF index and footnote handling is worse and images are missing.
#	xmlto --noautosize -m xmlto-pdf.xsl --with-fop pdf $^

%.html: %.xml $(IMAGES)
	xmlto html-nochunks $<

%.epub: %.xml, $(IMAGES)
	$(DBTOEPUB) $^ $<

freeculture.xml:
	GET $(url) | gunzip > freeculture.xml

freeculture.pot: freeculture.xml
	po4a-gettextize -f docbook -m $^  > $@.new && mv $@.new $@

stats: update-stats progress.png
update-stats:
	( \
	printf "%s " $$(date +"%Y-%m-%dT%H%M") ; \
	msgfmt -o /dev/null --statistics freeculture.nb.po 2>&1 \
	) | tee -a stats.txt
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

images/cc.svg:
	wget -O $@ http://upload.wikimedia.org/wikipedia/commons/9/97/CC_some_rights_reserved_new_2.svg

images/cc.png: images/cc.svg
	convert -adaptive-resize 500x200 $^ $@
