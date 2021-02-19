Norwegian translation of Free Culture
=====================================

The books are ready for download and purchase:

English (<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/images/cover-art.pdf">book cover</a>): [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.pdf">PDF</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.epub">ePub</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.mobi">MOBI</a>], [<a href="https://archive.org/details/free-culture-audiobook">Audiobook</a>], [<a href="http://www.lulu.com/shop/lawrence-lessig/free-culture/paperback/product-22402863.html">on paper from lulu.com</a>].

Norwegian Bokmål (<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/images/nb/cover-art.pdf">book cover</a>): [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.nb.pdf">PDF</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.nb.epub">ePub</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.nb.mobi">MOBI</a>], [<a href="http://www.lulu.com/shop/lawrence-lessig/fri-kultur/paperback/product-22406445.html">on paper from lulu.com</a>].

French (<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/images/fr/cover-art.pdf">book cover</a>): [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.fr.pdf">PDF</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.fr.epub">ePub</a>], [<a href="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/archive/freeculture.fr.mobi">MOBI</a>], [<a href="http://www.lulu.com/shop/lawrence-lessig/culture-libre/paperback/product-22645082.html">on paper from lulu.com</a>].

The original book version is available from http://free-culture.cc/ .

See
<a href="http://people.skolelinux.org/pere/blog/Dugnad_for___sende_norsk_versjon_av_Free_Culture_til_stortingets_representanter_.html">my blog post for 2012</a>
for a project description.

Norwegian translation of the book Free Culture by Lessig.  Based on
the <a href="http://www.sslug.dk/~chlor/lessig/">Docbook version by
Hans Schou</a>.  Other versions of the book can be found from the
<a href="http://free-culture.cc/remixes/">books remixes list</a>.

The first draft had images found in the HTML version available from
<a href="http://www.ibiblio.org/ebooks/Lessig/index.html">Elegant
Ebooks</a>, while later draft had these replaced with the original
images provided by the author.

The source of this project is available from the
<a href="https://github.com/petterreinholdtsen/free-culture-lessig">free-culture-lessig
github repository</a>.


Text flow
---------

The original source for the book is freeculture.xml, a Docbook
formattet file.  This file is transformed to the freeculture.pot,
which is the base file for translators.  It was copied to
freeculture.nb.po as the starting point of the Norwegian Bokmål
translation, and the text blocks are translated in this file.  The
translation was earlier maintained using Transifex, but is now
maintained directly in this git repository.

Only the file freeculture.xml should be manually edited!

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
  dblatex (>= 0.3.4-2 in debian, for nb support)
  dbtoepub
  libxml2-utils
  gnuplot
  xmlto
  docbook-xsl
  calibre

When the build requirements are in place, the PDF and EPUB version of
the book can be build by running 'make' on the command line.

Changes done to the original
----------------------------

Changed typo in introduction (page 11 in original):

  Is it not about the «centrality of technology» to ordinary life.

to:

  It is not about the «centrality of technology» to ordinary life.

Changed typo in quote from Elizabeth Daly (page 40 in original),
removed trailing quite character:

  power with this language."

to:

  power with this language.

Changed 'next page' references to use cross references instead (pages
141, 148 and 246 in original).

Rewrote colophon page and dropped irrelevant pages between the content
table and the preface.


Translation status
------------------

<img src="https://github.com/petterreinholdtsen/free-culture-lessig/raw/master/progress.png">

Todo
----

 * Complete the spell checking of the content (using the txt version
   is easiest).
 * Publish first edition.
 * (Add missing index entries.  Nice to have, not vital.  See
   scripts/idxcompare for helper script.)

http://www.epubli.co.uk/

https://www.createspace.com/Products/Book/

I expect they are not in Debian then
<pabs> this appears to be Crimson: http://aldusleaf.org/crimson.html https://github.com/skosch/Crimson/
<pabs> Lusitana http://www.anamegda.com/LUSITANA
<pabs> Radley http://code.newtypography.co.uk/radley-italic-a-case-studyautilising-old-type-specimens-to-create-new-webfonts/
<pabs> and the last one http://openfontlibrary.org/en/font/scheherazade
<pere> thank you!


Julius Ørenberg Bokbinderi
Frysjaveien 33c, 0884 Oslo
Telefon: 23 05 80 20
http://www.bokbinderi.net/kontakt-oss/

60-70 pr. eksemplar for ferdig falset / limfrest

AIT Oslo
http://www.ait.no/
Stålfjæra 16, 0975 Oslo
Ingar / Hilde / Ola
+47 21628770 / +47 22212221

Konsis grafiske
http://www.konsis.no/
Økernveien 121, 0579 Oslo
Odd Jonny / Erik Brommeland
+47 23243400

07 media
http://07.no/Print/PDF-til-trykk
Sandakerveien 24C, Bygg B
Jonas Andersen
+47 21056282 / +47 22799500

Benjamin Sats & Trykk - Oslo (brukt av Wolfgang til Turlederen)
Tjernveien 35, 0957 Grorud 
+47 22166044

Mangler med docbook-xsl-utgaven:

 * Fotnoter må gjøres til sluttnoter
 * Feil rekkefølge på registeroppføringer, åndsverk skal være sist (BTS #686908)
 * For stor kolofonside, teksten må bli mindre
 * Dedikasjonssiden bør ha større og sentrert tekst
 * Tekst overlapper med strek i øvre tekstfelt på noen sider.
 v SVG-bilder må få bedre kransboks
 v Font må byttes til Crimson Text
   https://github.com/google/fonts/tree/master/ofl/crimsontext
   http://www.fontsquirrel.com/fonts/download/crimson (This is the version I am using)

Mangler med dblatex-utgaven:




http://anonscm.debian.org/cgit/debian-handbook/debian-handbook.git/tree/en-US


http://www.bokbasen.no/Bokbasen/Bokbasen/Om-oss

Eiendoms-, sikkerhets- og serviceavdelingen

https://stortinget.no/no/Stortinget-og-demokratiet/Administrasjonen/Avdelinger-og-seksjoner/Eiendoms-sikkerhets-og-serviceavdelingen/

Servicekontor: 23 31 31 70. Astrid Paulsen: 23 31 31 61

postmottak.internservice@stortinget.no (defekt 2015-10-12)

Til stortingsrepresentantene, forslag fra Astrid Paulsen hos
stortingspostkontoret 2015-10-05.

  Foreslo å sende med budbil til Prestegata (stortingsgarasjen) og
  merke det med Astrid Paulsen, så blir pakken gjennomlyst og bøkene
  delt ut til alle stortingsrepresentantene.  Fint om det legges ved
  lite følgeskriv.

  169 representanter + vararepresentanter? =  179

Forslag til følgeskriv

 - nevn "The Internet's Own Boy: The Story of Aaron Swartz"
   (tilgjengelig fra youtube) som inneholder mye om Lawrence Lessig

 - mer on Lawrence Lessig?

 - mer om Creative Commons

