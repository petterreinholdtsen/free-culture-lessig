#
# configuration here:
#

url = http://www.sslug.dk/~chlor/lessig/freeculture.sgml.2004-04-01.gz

path1=Dokumentasjon/BokenOmLinux
path2='\/Dokumentasjon\/BokenOmLinux\/'

ORIGLANG = en

name = freeculture
DEBIAN_EDU_DOC_TITLE=Free Culture
export 

#include ../common/Makefile.common

DBLATEX = dblatex -T db2latex --backend=xetex --xsl-user=../common/user_param.xsl --xsl-user=../common/xetex_param.xsl -p ../common/pdf.xsl --param=lingua=zh-tw

all: pdf

update-translation: freeculture.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg
	msgcat --no-location -o $(name).pot $(name).pot

freeculture.nb.po: update-translation 

freeculture.nb.xml: freeculture.nb.po freeculture.xml
	po4a --translate-only freeculture.nb.xml po4a.cfg 

pdf: freeculture.nb.pdf

freeculture.pdf: freeculture.xml
	$(DBLATEX) $(name).xml --param=lingua=en

freeculture.nb.pdf: freeculture.nb.xml
	$(DBLATEX) freeculture.nb.xml --param=lingua=nb

freeculture.xml:
	GET $(url) | gunzip > freeculture.xml

freeculture.pot: freeculture.xml
	po4a-gettextize -f docbook -m $^  > $@
