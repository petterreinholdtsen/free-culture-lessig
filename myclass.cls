\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{myclass}[]

%% Just use the original class and pass the options
\LoadClassWithOptions{report}
% report, book, memoir, scrreprt or scrbook ?

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
