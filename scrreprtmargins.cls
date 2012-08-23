%%
%% This style is derivated from the scrbook one.  Partly based on
%% <URL: http://www.vetta.org/2008/07/latex-and-lulucom/ > and
%% <URL: http://dblatex.sourceforge.net/example/manual.pdf >.
%% http://tex.stackexchange.com/questions/19497/how-do-you-setup-a-tex-document-to-self-publish-a-book-online
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{book6x9}[2007/04/04 My 6'' x 9'' book Style]

%% Just use the original class and pass the options
\LoadClassWithOptions{scrreprt}
% report, book, memoir, scrreprt or scrbook ?

%\usepackage[margin=1in, paperwidth=6in, paperheight=9in]{geometry}
%\usepackage[margin=0.8in]{geometry}
\usepackage[inner=0.67in,outer=0.71in,top=0.71in,bottom=0.87in,pdftex]{geometry}

%% Replace footnotes par end notes
\usepackage{endnotes}
\let\footnote=\endnote

% Let user define its own endnote heading section(s)
\def\enoteheading{\mbox{}\par\vskip-\baselineskip }

% Insert this in the docbook code where the notes should be inserted
%<?latex \theendnotes ?>
