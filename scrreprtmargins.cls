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

%\setlength\paperheight {7.5in}%
%\setlength\paperwidth  {5in}%

%\setlength\topmargin{0.5in}
%\setlength\headheight{0.5in}
%\setlength\headsep{0.2in}
%\setlength\textheight{5.6in}
%\setlength\textwidth{4in}
%\setlength\oddsidemargin{0.5in}
%\setlength\evensidemargin{0.5in}

%\usepackage[margin=1in, paperwidth=6in, paperheight=9in]{geometry}
%\usepackage[margin=0.8in]{geometry}
\usepackage[inner=0.67in,outer=0.71in,top=0.71in,bottom=0.87in,pdftex]{geometry}
