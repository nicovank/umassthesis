\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UMassDissSci}[2025/04/24 Custom Report Class]

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
\RequirePackage{chngcntr}
\RequirePackage[letterpaper,left=1.5in,right=1in,top=1in,bottom=1in]{geometry}
    \setlength{\footskip}{0.5in}
\RequirePackage{etoc}



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
\setcounter{secnumdepth}{4}		%Allow Numbered Subsubsections and Paragraphs
\setcounter{tocdepth}{4}		%Include Subsubsections and Paragraphs in Table of Contents

%%Edit Figure and Table Numbers to Not Depend on Section Numbers
\counterwithout{figure}{chapter}		%Remove Chapter No. from Figures
\counterwithout{table}{chapter}		%Remove Chapter No. from Tables
\counterwithout{equation}{chapter}		%Remove Chapter No. from Equations

%%Page style
\pagestyle{plain}
\onehalfspacing

%%Formatting Organizational Headings
\titleformat{\chapter}			%Format Chapter Heading
  [display]
  {\centering\normalfont\bfseries}
  {\chaptername\ \thechapter}  % "CHAPTER 1"
  {1ex}
  {\centering}


\titleformat{\section}  			%Format Section Heading
  [block]
  {\normalfont\bfseries}
  {\thesection}  
  {1em}
  {}

\titleformat{\subsection}  		%Format Subsection Heading
  [block]
  {\normalfont\bfseries}
  {\thesubsection}  
  {1em}
  {}

\titleformat{\subsubsection}  		%Format Subsubsection Heading
  [block]
  {\normalfont\normalsize\bfseries}
  {\thesubsubsection}
  {1em}
  {}

\titleformat{\paragraph}  		%Format Paragraph Heading
  [block]
  {\normalfont\normalsize\bfseries}
  {\theparagraph}
  {1em}
  {}


%%Removing bold from table of contents, adding periods behind chapter numbers/appendices letters, and aligning numbered and unnumbered (e.g. front matter pages, bibliography) chapters
\titlecontents{chapter}
    [0em]                      			% left margin
    {\addvspace{1em} \normalfont}            			% formatting for entry (unbold!)
    {\thecontentslabel.\hspace{0.5em}}     % numbered entries: reserve 1em for number
    {}                 		% unnumbered entries: bump back by 1em
    {\titlerule*[0.4155em]{.}\contentspage} % filler and page number




% %Remove space before title to start at top of page
\titlespacing{\chapter}{0cm}{0pt}{15pt}



%% Adding Periods to Numbers in List of Tables and List of Figures
\titlecontents{table}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage} 

\titlecontents{figure}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage} 



%Conditional Spacing of Level Headings
\renewcommand{\section}{
    \ifnum \c@section=\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else 
        \ifnum\c@subsection>\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else
        \addtocontents{toc}{\protect\addvspace{0pt}}
\fi
\fi
\@startsection{section}% name
    {1}% level
    {0pt}% indent
    {3.5ex plus 1ex minus 0.2ex}
    {2.3ex plus 0.2ex}
    {\bf}}


\renewcommand{\subsection}{
    \ifnum \c@subsection=\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else
        \ifnum\c@subsubsection>\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else

        \addtocontents{toc}{\protect\addvspace{0em}}
\fi
\fi
\@startsection{subsection}% name
    {2}% level
    {0pt}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {1.5ex plus 0.2ex}
    {\bf}}

\renewcommand{\subsubsection}{
    \ifnum \c@subsubsection=\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else 
        \ifnum\c@paragraph>\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else
        \addtocontents{toc}{\protect\addvspace{0em}}
\fi
\fi
\@startsection{subsubsection}% name
    {3}% level
    {0pt}% indent
    {3.25ex plus 1ex minus .02ex}
    {1.5ex plus.2ex}
    {\bf}}


\renewcommand{\paragraph}{
    \ifnum \c@paragraph=\z@
        \addtocontents{toc}{\protect\addvspace{1em}}
    \else 
        \addtocontents{toc}{\protect\addvspace{0pt}}

\fi
\@startsection{paragraph}% name
    {4}% level
    {0pt}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {1.5ex plus 0.2ex}
    {\bf}}

%Fixing Table of Contents Formatting
\renewcommand{\@dotsep}{1.5001875}
