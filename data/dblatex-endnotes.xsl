<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!--
Trick to get endnote support.  Should have a way to insert LaTeX code
outside xetex font values.  As it is missing, reuse the
latex.begindocument value (aka \begin{document} to get a code fragment
in front of it.
-->

  <xsl:param name="latex.begindocument">
    <xsl:text>
\usepackage{endnotes}
\let\footnote=\endnote
\def\enoteheading{\mbox{}\par\vskip-0.2\baselineskip }

% More pretty looking note
\def\enoteformat{\rightskip=0pt \leftskip=21pt \parindent=-13pt
\leavevmode\llap{\makeenmark}\hspace*{11pt}}

% Increase footnote/endnote size to be more than 6 pts, to avoid
% complaint from Lulu about the font being too small to be printed
% clearly.  Needed at least for pocket size books.
% Probably wise to use the same size as the colophon page (see myclass.cls)

% Use one of these (adjust numbers, x, x*1.2), 6>= 6
\def\enotesize{\normalsize}
%\def\enotesize{\fontsize{10}{12}\selectfont}

% Trick to avoid many words sticking out of the right margin of the text.
% Need to add it here with the end notes, as only one
% latex.begindocument can be active.
\sloppy

% Hack to get correct chapter numbering with dblatex, as chapter
% labels are ignored.  No longer needed with dblatex 0.3.7.
%\setcounter{chapter}{-1}

\begin{document}
    </xsl:text>

  </xsl:param>
</xsl:stylesheet>
