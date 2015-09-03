\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{myclass}[]

%% Just use the original class and pass the options
\LoadClassWithOptions{report}
% report, book, memoir, scrreprt or scrbook ?

% Show frames, make it easier to debug borders
%\usepackage{showframe}% http://ctan.org/pkg/showframe

% Divide by 2 the index item indentation (10pt -> 5pt)
\makeatletter
\renewcommand\@idxitem{\par\hangindent 20\p@}
\renewcommand\subitem{\@idxitem \hspace*{10\p@}}
\renewcommand\subsubitem{\@idxitem \hspace*{15\p@}}
\makeatother

% Put the index in the TOC
\makeatletter
\let\stdindex=\theindex
\let\endstdindex=\endtheindex
\renewenvironment{theindex}{
  \begin{stdindex}
  % Use a smaller font except for the letter heading which is bold
  \newfontfamily\indexfont[Scale=0.7,
                           BoldFeatures={Scale=1}]{Crimson Text}
  \@ifundefined{chapter}{}{
    % To not have the number, replace by:
    % \addcontentsline{toc}{chapter}{\numberline{}\indexname}
    \refstepcounter{chapter}
    \ifnum \c@secnumdepth >\z@
      \ifnum \value{part} >\z@
        \addcontentsline{toc}{part}{\numberline{\thechapter}\hspace{-1em}\indexname}
      \else
        \addcontentsline{toc}{chapter}{\numberline{\thechapter}\indexname}
      \fi
    \else
      \addcontentsline{toc}{chapter}{\indexname}
    \fi
  }
  % Adapt the vertical sizes to the smaller font
  \setlength{\baselineskip}{0.7\baselineskip}%
  \setlength{\parskip}{0.2\baselineskip}%
  \indexfont
}{
  \end{stdindex}
}
\makeatother

\newenvironment{colophon}{
  \pagebreak %
% FIXME change when page size changes
%  \fontsize{6.5}{7.8}\selectfont % fits in one 4.25x6.875" pocket size page
%  \fontsize{7.5}{9}\selectfont % fits in one 5.06x7.71" size page
%  \fontsize{9.1}{10.92}\selectfont % fits in one 5.5x8.5" digest size page
  \fontsize{9.1}{10.92}\selectfont % fits in one 6x9'' size page
  \setlength{\parskip}{0.5em} %
  \setlength{\parindent}{0pt} %
}{}
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on ideas from https://bugs.debian.org/684772
\usepackage{titlesec}
\usepackage{titletoc}
%
% Useless with unnumbered sections (e.g. use of \setcounter{secnumdepth}{0})
%
%
\newcommand\makeletterof[1]{%
\ifthenelse{\equal{#1}{1}}{EN}{%
\ifthenelse{\equal{#1}{2}}{TO}{%
\ifthenelse{\equal{#1}{3}}{TRE}{%
\ifthenelse{\equal{#1}{4}}{FIRE}{%
\ifthenelse{\equal{#1}{5}}{FEM}{%
\ifthenelse{\equal{#1}{6}}{SEKS}{%
\ifthenelse{\equal{#1}{7}}{SJU}{%
\ifthenelse{\equal{#1}{8}}{ÅTTE}{%
\ifthenelse{\equal{#1}{9}}{NI}{%
\ifthenelse{\equal{#1}{10}}{TI}{%
\ifthenelse{\equal{#1}{11}}{ELLEVE}{%
\ifthenelse{\equal{#1}{12}}{TOLV}{%
#1}}}}}}}}}}}}}

% Make TOC entries without label
\titlecontents{chapter} %
[1.5em] % 
{\addvspace{0.3em plus 0pt}\bfseries} %
{\hspace{-1.3em}} % no number, remove room reserved for it 
{\hspace{-1.3em}} %
{\hfill \contentspage} % dots and page number
[\addvspace {0pt}]

\dottedcontents{section} %
[0em] % was (3.8)
{\addvspace{0pt}} % 
{2.3em} % tab
{0.75em} % space between dots
[\addvspace{0pt}]

%% Redefines the headings to remove the chapter label
\titleformat{\chapter}[block]
{\filcenter\Large}{\filcenter}{20pt}{\Large}

\titleformat{\section}
{\filcenter\Large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\filcenter\large\bfseries}{\thesubsection}{1em}{}

%% New header, behaving like a section but formatted differently
\titleclass{\enoteheader}{straight}[\chapter]
\newcounter{enoteheader}
\renewcommand{\theenoteheader}{\Alph{enoteheader}}

\titleformat{\enoteheader}
{\normalfont\large}{}{0pt}{}
\titlespacing*{\enoteheader}{0pt}{2.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}

\dottedcontents{enoteheader} %
[0em] % was (3.8)
{\addvspace{0pt}} % 
{2.3em} % tab
{0.75em} % space between dots
[\addvspace{0pt}]

%% New header, behaving like a chapter but formatted differently
\titleclass{\lotheader}{top}[\part]
\newcounter{lotheader}
\renewcommand{\thelotheader}{\Alph{lotheader}}

\titleformat{\lotheader}[block]
{\filcenter\huge}{\filcenter}{20pt}{\Huge}
\titlespacing*{\lotheader}{0pt}{-30pt}{40pt}

% Use the new header in TOC
\let\stdtoc=\tableofcontents
\let\stdchapter=\chapter
\def\tableofcontents{\let\chapter\lotheader \stdtoc{} \let\chapter\stdchapter}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% From
% https://amyrhoda.wordpress.com/2012/06/04/latex-to-lulu-the-making-of-aosa-other-useful-packages-and-settings/

% The microtype package provides the ability to micromanage your
% typography. When invoked without any options it does some nice things
% like protruding punctuation over the edge of the right margin to make
% the margin appear smoother. Basically it makes your book look more
% professional with very little effort. It also has a ton of options if
% you want to micromanage even more.
\usepackage{microtype}

% By dafault, LaTeX will try and make all your pages the length that
% you set using the geometry setting. If a page has images, tables,
% headings or paragraph breaks which make it shorter than that page
% length, LaTeX will pad the page by adding whitespace between
% elements. We thought that looked sillier than having pages be
% different lengths, so we used the raggedbottom command.
\raggedbottom

% Hint for figure with empty title: remove the colon label separator
\usepackage{caption}
\captionsetup[figure]{labelsep=none}

% Fix the page number reset done by abstract by redefining it
% Patch from
% https://github.com/petterreinholdtsen/free-culture-lessig/pull/7

\def\nocount#1#2{}
\let\stdsetcounter\setcounter
\let\stdabstract=\abstract
\let\endstdabstract=\endabstract
\renewenvironment{abstract}{%
  \let\setcounter\nocount%
  \begin{stdabstract}%
  \noindent%
  \setlength\parskip{\medskipamount}%
  \setlength\parindent{0pt}%
}{
  \end{stdabstract}
  \let\setcounter\stdsetcounter
}
