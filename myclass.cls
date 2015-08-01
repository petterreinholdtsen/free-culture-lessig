\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{myclass}[]

%% Just use the original class and pass the options
\LoadClassWithOptions{report}
% report, book, memoir, scrreprt or scrbook ?

% Fix the page number reset done by abstract by redefining it
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
{\addvspace{1em plus 0pt}\bfseries} %
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
{\filcenter\huge}{\filcenter}{20pt}{\Huge}

\titleformat{\section}
{\filcenter\Large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\filcenter\large\bfseries}{\thesubsection}{1em}{}
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
