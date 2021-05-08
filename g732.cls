%
%   A gost 7.32-2017 class for TexLive 09.09.2020
%
% All the LaTeX is a magic, weired spaces is absolutely nightmare
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{g732}[2020/09/08 GOST 7.32 2017 LaTeX class]

% Base class
\LoadClass[14pt]{extarticle}

% Playing with fonts
\RequirePackage{fontspec}
\RequirePackage[math-style=upright]{unicode-math}

\defaultfontfeatures{Ligatures=TeX}

\newfontfamily{\cyrillicfont}{Times New Roman} 
\newfontfamily{\cyrillicfontrm}{Times New Roman}
\newfontfamily{\cyrillicfonttt}{Courier New}
\newfontfamily{\cyrillicfontsf}{Arial}

\setmainfont{Times New Roman}
\setromanfont{Times New Roman} 
\setsansfont{Arial} 
\setmonofont{Courier New} 
% \setmathfont{XITS Math}
\setmathfont{TeX Gyre Termes Math}

% Playing with languages
\RequirePackage{polyglossia}

\setmainlanguage{russian}
\setdefaultlanguage{russian}
\setotherlanguage{english}

% Importing packages
\RequirePackage{subfiles}
\RequirePackage{floatrow}
\RequirePackage{float}
\RequirePackage{diagbox}
\RequirePackage{amsmath}
\RequirePackage{totcount}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage{titleref}
\RequirePackage{pdflscape}
\RequirePackage{longtable}
\RequirePackage{stackengine}
\RequirePackage{indentfirst}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\RequirePackage{xurl}
\RequirePackage{listings}
\RequirePackage{subfiles}
\RequirePackage{graphicx}
\RequirePackage{fmtcount}
\RequirePackage{letltxmacro}
\RequirePackage[calc]{datetime2}
\RequirePackage[
    paper=a4paper,
    top=20mm,
    bottom=20mm,
    left=30mm,
    right=15mm
]{geometry}
\RequirePackage[
    font={stretch=1},
    labelsep=endash,
]{caption}
\RequirePackage[
    semicolon,
    sort&compress,
    numbers
]{natbib}

\urlstyle{rm}
\hypersetup{
  raiselinks=true,
  linktocpage,
  linktoc=page
}

% Restrict hyphenation
\newcommand{\jj}{
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
}

\newenvironment{jje}{\jj\par}{\par}

% Redefine default commands
\AtBeginDocument{
  \DTMnewdatestyle{passdate}{
      \renewcommand{\DTMdisplaydate}[4]{
          \number##3\  \DTMmonthname{##2}
      }
      \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}
  }
  \DTMsetdatestyle{passdate}
}

\AtBeginDocument{
  \LetLtxMacro{\oldref}{\ref}
  \renewcommand{\ref}[1]{\mbox{\oldref{#1}}}
}

\AtBeginDocument{
  \LetLtxMacro{\oldbibitem}{\bibitem}
  \renewcommand{\bibitem}[1]{\refstepcounter{bibcnt}\oldbibitem{#1}}
}

% Setting lines stretch
\tolerance=10000
\hbadness=10000
\maxdepth=0pt
\setstretch{1.5}

% Paragraphs spaces
\setlength{\parskip}{0mm}
\setlength{\parindent}{12.5mm}

% Configuring skips
\setlength{\bigskipamount}{0mm}
\setlength{\medskipamount}{0mm}
\setlength{\smallskipamount}{0mm}

% Configuring floats
\setlength{\intextsep}{\baselineskip}
\setlength{\floatsep}{0mm}
\setlength{\textfloatsep}{\baselineskip}

% Math spacing
\AtBeginDocument{
    \setlength{\abovedisplayskip}{.75\baselineskip}
    \setlength{\belowdisplayskip}{.75\baselineskip}
    \setlength{\abovedisplayshortskip}{.75\baselineskip}
    \setlength{\belowdisplayshortskip}{.75\baselineskip}
}

% Tables spacing
\setlength{\LTpre}{\baselineskip}
\setlength{\LTpost}{.75\baselineskip}

\newcolumntype{Z}[1]{>{\setlength{\baselineskip}{.75\baselineskip}\arraybackslash}m{#1}}
\newcolumntype{Q}[1]{>{\setlength{\baselineskip}{.75\baselineskip}\arraybackslash}p{#1}}

\newcolumntype{C}[1]{>{\centering\arraybackslash}Z{#1}}
\newcolumntype{M}[1]{>{\arraybackslash}Z{#1}}
\newcolumntype{T}[1]{>{\arraybackslash}Q{#1}}
\newcolumntype{H}[1]{>{\bfseries\centering\arraybackslash}M{#1}}

\newenvironment{ltwrap}[3]{
    \begingroup
    #3
    \setlength{\tabcolsep}{#1}
    \newcommand{\x}{\textwidth-2\tabcolsep}
    \renewcommand{\arraystretch}{#2}
}{\endgroup}

%
% Configuring titles
%

% Configuring spacing
\titlespacing{\section}{0mm}{0mm}{0mm}
\titlespacing{\subsection}{0mm}{3mm}{0mm}
\titlespacing{\subsubsection}{0mm}{3mm}{0mm}

% Configuring formats
\titleformat{name=\section}[block]
    {\bfseries\filcenter}
    {\thesection~}
    {0mm}{}

\titleformat{name=\section,numberless}[block]
    {\bfseries\filcenter}{}
    {0mm}
    {\MakeUppercase}

\titleformat{name=\subsection}[block]
    {\hspace{\parindent}\bfseries}
    {\thesubsection~}
    {0mm}{\filright}

\titleformat{name=\subsubsection}[block]
    {\hspace{\parindent}\bfseries}
    {\thesubsubsection~}
    {0mm}{\filright}

% 
% Table of contents styling
% 

% Removing margin for pages
\contentsmargin{0mm}

% Styles
\titlecontents{section}[0ex]{\filright}
    {\thecontentslabel~}
    {\MakeUppercase}
    {\titlerule*[1ex]{.}\thecontentspage}

\titlecontents{subsection}[2ex]{\filright}
    {\thecontentslabel~}
    {}
    {\titlerule*[1ex]{.}\thecontentspage}
    
\titlecontents{subsubsection}[4ex]{\filright}
    {\thecontentslabel~\raggedright}
    {}
    {\titlerule*[1ex]{.}\thecontentspage}

% 
% Enumerations
% 
\setlist[enumerate]{
    align=left,
    label=\arabic*)~,
    topsep=0mm,
    labelsep=0mm,
    itemsep=0mm,
    parsep=0mm,
    leftmargin=0mm,
    labelwidth=0mm,
    itemindent=\parindent,
    listparindent=\parindent
}
\setlist[enumerate,1]{}
\setlist[enumerate,2]{}
\setlist[enumerate,3]{}
\renewlist{enumerate}{enumerate}{3}

% Bibliography enumeration

\newlist{biblenum}{enumerate}{1}
\setlist[biblenum]{
    align=left,
    % label=\arabic*.~,
    label=,
    topsep=0mm,
    parsep=0mm,
    partopsep=0mm,
    labelsep=0mm,
    itemsep=0mm,
    leftmargin=0mm,
    labelwidth=0mm,
    itemindent=\parindent,
    listparindent=\parindent
}
\setlist[biblenum,1]{}
\renewcommand{\bibnumfmt}[1]{#1.~}

% Terms and abbreviations
\newlist{termenum}{enumerate}{3}
\setlist[termenum]{
    align=left,
    label=,
    topsep=0mm,
    parsep=0mm,
    partopsep=0mm,
    labelsep=0mm,
    itemsep=0mm,
    leftmargin=0mm,
    labelwidth=0mm,
    itemindent=0mm,
    listparindent=0mm
}
\setlist[termenum,1]{}
\setlist[termenum,2]{}
\setlist[termenum,3]{}

\setlist[itemize]{
    align=left,
    label=--~,
    topsep=0mm,
    parsep=0mm,
    partopsep=0mm,
    labelsep=0mm,
    itemsep=0mm,
    leftmargin=0mm,
    labelwidth=0mm,
    itemindent=\parindent,
    listparindent=\parindent
}
\setlist[itemize,1]{}
\setlist[itemize,2]{}
\setlist[itemize,3]{}
\renewlist{itemize}{itemize}{3}

% 
% Bibliography & counters
% 

% Cibitem counter
\newcounter{bibcnt}

% Setting up counters
\regtotcounter{page}
\regtotcounter{table}
\regtotcounter{figure}
\regtotcounter{bibcnt}

%
% Figures
%
\captionsetup[figure]{
    name=Рисунок,
    format=plain,
    justification=centering,
}
\floatsetup[figure]{
    capposition=bottom,
}

%
% Longtables
%
\captionsetup[longtable]{
    name=Таблица,
    format=plain,
    singlelinecheck=false,
    justification=raggedright,
}
\floatsetup[longtable]{
    LTcapwidth=contents,
    capposition=top,
}

%
% Listings
%
\captionsetup[lstlisting]{
    format=plain,
    singlelinecheck=false,
}
\lstset{
    aboveskip=.75\baselineskip,
    belowskip=.75\baselineskip,
    breaklines=true,
    basicstyle=\footnotesize,
    stringstyle=\ttfamily,
}
\renewcommand{\lstlistingname}{Листинг}