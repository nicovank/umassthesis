\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UMassDissAN}[2025/04/24 Custom Report Class]

\LoadClass[12pt]{report}

% Packages
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{bookman}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{natbib}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{gensymb}
\RequirePackage{chngcntr}
\RequirePackage{appendix}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage[letterpaper,left=1.5in,right=1in,top=1in,bottom=1in]{geometry}
    \setlength{\footskip}{0.5in}
\RequirePackage[normalem]{ulem}
\RequirePackage{soul}
    \setul{}{1pt}
\RequirePackage{etoc}
\RequirePackage{longfbox}





%------------------------------------------------------------------------------------
%BEHIND THE SCENES STUFF
%------------------------------------------------------------------------------------
%%Resetting the Titles to be ALL CAPS
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\bibname}{BIBLIOGRAPHY}
\renewcommand{\contentsname}{TABLE OF CONTENTS\\\textnormal{\hfill Page}}
\renewcommand{\listtablename}{LIST OF TABLES\\\textnormal{Table \hfill Page}}
\renewcommand{\listfigurename}{LIST OF FIGURES\\\textnormal{Figure\hfill Page}}


%%Setting Font to Times New Roman
\setmainfont{Times New Roman}

%Turn Off Hyphenation
\righthyphenmin=100
\lefthyphenmin=100
	
%%Numbering Subsections and Adding Subsections to TOC
\setcounter{secnumdepth}{4}		
    %Allow Numbered Subsubsections
\setcounter{tocdepth}{4}		
    %Include Subsubsections in Table of Contents

%%Edit Figure and Table Numbers to Not Depend on Section Numbers
\counterwithout{figure}{chapter}		
    %Remove Chapter No. from Figures
\counterwithout{table}{chapter}		
    %Remove Chapter No. from Tables
\counterwithout{equation}{chapter}		
    %Remove Chapter No. from Equations

%%Page style
\pagestyle{plain}
\onehalfspacing

%%Formatting Chapter Headings
\titleformat{\chapter}		%Format Chapter Heading
  [display]
  {\centering\normalfont\bfseries}
  {\chaptername\ \thechapter}  % "CHAPTER 1"
  {1ex}
  {\centering}


%%Removing bold from table of contents, adding periods behind chapter numbers/appendices letters, and aligning numbered and unnumbered (e.g. front matter pages, bibliography) chapters
\titlecontents{chapter}
    [0em]                      			% left margin
    {\addvspace{1em}} %add space between chapters
    {\thecontentslabel.\hspace{0.5em}} % numbered entries: reserve 1em for number
    {}       % unnumbered entries: bump back by 1em
    {\titlerule*[0.4155em]{.}\contentspage} % filler and page number


%%Remove space before title to start at top of page
\titlespacing{\chapter}{0cm}{0pt}{15pt}
    %\titlespacing{\chapter}{left}{before}{after}


%% Adding Periods to Numbers in List of Tables and List of Figures
\titlecontents{figure}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage} 

\titlecontents{table}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage} 


%-----------------------------------------------------------------
%ALPHA-NUMERIC FORMATTING DETAILS
%-----------------------------------------------------------------
\renewcommand{\thechapter}{\Roman{chapter}}
    %Make chapter numbers capital roman numerals
\renewcommand{\thesection}{\Alph{section}.}
    %Make section numbers capital latin letters with period
\renewcommand{\thesubsection}{\arabic{subsection}.}
    %Make subsection numbers arabic numerals with period
\renewcommand{\thesubsubsection}{\alph{subsubsection}.}
    %Make subsubsection numbers lowercase latin letters with period
\renewcommand{\theparagraph}{\roman{paragraph}.}
    %Make paragraph numbers lowercase roman numerals with period


%Conditional Spacing of Level Headings in Table of Contents
\renewcommand{\section}{
    \ifnum \c@section=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first section
    \else 
        \ifnum\c@subsection>\z@ 
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if section is follows subsection (diff. level)
    \else 
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if section is follows section (same level)
\fi
\fi
\@startsection{section}
    {1}
    {0cm}
    {3.5ex plus 1ex minus 0.2ex}
    {1ex plus 0.2ex}
    {\bfseries\centering\cenund}}
\newcommand{\cenund}[1]{\uline{#1}\par} %bold, center, and underline section headings in main text



\renewcommand{\subsection}{
    \ifnum \c@subsection=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first subsection
    \else
        \ifnum\c@subsubsection>\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if subsection follows subsubsection (diff. level)
    \else

        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if subsection follows another subsection (same level)
\fi
\fi
\@startsection{subsection}% name
    {2}% level
    {0cm}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {0.2ex}
    {\centering\bfseries}}

\renewcommand{\subsubsection}{
    \ifnum \c@subsubsection=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first subsubsection
    \else 
        \ifnum\c@paragraph>\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if subsubsection follows paragraph (diff. level)
    \else
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if subsubsection follows another subsubsection (same level)
\fi
\fi
\@startsection{subsubsection}% name
    {3}% level
    {0cm}% indent
    {3.25ex plus 1ex minus .2ex}
    {0.2ex}
    {\centering\bfseries\uline}}


\renewcommand{\paragraph}{
    \ifnum \c@paragraph=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first paragraph
    \else 
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if paragraph follows another paragraph

\fi
\@startsection{paragraph}% name
    {4}% level
    {0cm}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {0.2ex}
    {\bf}}


%Fixing Table of Contents Formatting
\renewcommand{\@dotsep}{1.5001875}
\renewcommand{\l@section}[2]{
  \@dottedtocline{1}{2em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@subsection}[2]{
  \@dottedtocline{2}{3.5em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@subsubsection}[2]{
  \@dottedtocline{3}{5em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@paragraph}[2]{
  \@dottedtocline{4}{6.5em}{1.5em}{#1}{#2}
}
\makeatother



