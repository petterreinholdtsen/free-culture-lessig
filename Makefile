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

all: pdf

freeculture.nb.po: freeculture.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg

freeculture.nb.xml: freeculture.nb.po freeculture.xml
	po4a --translate-only freeculture.nb.xml po4a.cfg 

pdf: freeculture.pdf freeculture.nb.pdf 

%.pdf: %.xml
	$(DBLATEX) $^ --param=lingua=nb

%.html: %.xml
	$(XP) $^ && mv index.html $@
%.epub: %.xml
	dbtoepub $^

freeculture.xml:
	GET $(url) | gunzip > freeculture.xml

freeculture.pot: freeculture.xml
	po4a-gettextize -f docbook -m $^  > $@.new && mv $@.new $@

stats:
	msgfmt -o /dev/null --statistics freeculture.nb.po

.SUFFIXES: .html
