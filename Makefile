#
# configuration here:
#

url = http://www.sslug.dk/~chlor/lessig/freeculture.sgml.2004-04-01.gz

# PDF rule
DBLATEX = dblatex \
	-T db2latex \
	--backend=xetex \
	--xsl-user=data/user_param.xsl \
	--xsl-user=data/xetex_param.xsl \
	-p data/pdf.xsl \
	--param=lingua=nb

# HTML rule
XP = xsltproc \
	--nonet \
	--novalid \
	--xinclude data/html.xsl

DBTOEPUB = dbtoepub

all: pdf epub

freeculture.nb.po: freeculture.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg

freeculture.nb.xml: freeculture.nb.po freeculture.xml
	po4a --translate-only freeculture.nb.xml po4a.cfg 

pdf: freeculture.pdf freeculture.nb.pdf 
epub: freeculture.nb.epub 
html: freeculture.html freeculture.nb.html 

%.pdf: %.xml
	$(DBLATEX) $^ --param=lingua=nb

%.html: %.xml
	$(XP) $^ && mv index.html $@

%.epub: %.xml
	$(DBTOEPUB) $^

freeculture.xml:
	GET $(url) | gunzip > freeculture.xml

freeculture.pot: freeculture.xml
	po4a-gettextize -f docbook -m $^  > $@.new && mv $@.new $@

stats:
	( \
	date +"%Y-%m-%dT%H%M" ; \
	msgfmt -o /dev/null --statistics freeculture.nb.po 2>&1 \
	) | tee -a stats.txt
