\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{myclass}[]

%% Just use the original class and pass the options
\LoadClassWithOptions{scrreprt}
% report, book, memoir, scrreprt or scrbook ?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on ideas from https://bugs.debian.org/684772
\usepackage{titlesec}
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

%% Redefines the headings
\titleformat{\chapter}[block]
{\filcenter\huge}{\filcenter\MakeUppercase{\chaptertitlename} \makeletterof{\thechapter}}{20pt}{\Huge}

\titleformat{\section}
{\filcenter\Large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\filcenter\large\bfseries}{\thesubsection}{1em}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
