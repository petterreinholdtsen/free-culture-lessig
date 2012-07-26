Norwegian translation of Free Culture
=====================================

The original book version is available from http://free-culture.cc/ .

See
http://people.skolelinux.org/pere/blog/Dugnad_for___sende_norsk_versjon_av_Free_Culture_til_stortingets_representanter_.html
for a project description.

Norwegian translation of the book Free Culture by Lessig.  Based on
the <a href="http://www.sslug.dk/~chlor/lessig/">Docbook version by
Hans Schou</a>.  Other versions of the book can be found from the
<a href="http://free-culture.cc/remixes/">books remixes list</a>.

The images were found in the HTML version available from
<a href="http://www.ibiblio.org/ebooks/Lessig/index.html">Elegant
Ebooks</a>.

The source of this project is available from the
<a href="https://github.com/petterreinholdtsen/free-culture-lessig">free-culture-lessig
github repository</a>.


Text flow
---------

The original source for the book is freeculture.xml, a Docbook
formattet file.  This file is transformed to the freeculture.pot,
which is the base file for translators.  It was copied to
freeculture.nb.po as the starting point of the Norwegian Bokmål
translation, and the text blocks are translated in this file.

Only the files freeculture.xml and freeculture.nb.po should be
manually edited!

The freeculture.xml file is automatically combined with the
freeculture.nb.po file to create a new generated file
freeculture.nb.xml representing the Norwegian Bokmål Docbook version.
This file is in turn used to generate the HTML, PDF and EPUB version
of the book.

Requirements
------------

To build the PDF and EPUB version of this book, the following Debian
packages are needed:

  make
  po4a
  dblatex
  dbtoepub
  libxml2-utils
  gnuplot
  xmlto

When the build requirements are in place, the PDF and EPUB version of
the book can be build by running 'make' on the command line.

Translation status
------------------

<img src="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/progress.png">
