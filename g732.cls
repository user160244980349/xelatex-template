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
\setmathfont{TeX Gyre Termes Math}

% Playing with languages
\RequirePackage{polyglossia}

\setmainlanguage{russian}
\setdefaultlanguage{russian}
\setotherlanguage{english}

% Importing packages
\RequirePackage{subfiles}
\RequirePackage{floatrow}
\RequirePackage{diagbox}
\RequirePackage{amsmath}
\RequirePackage{totcount}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{titleref}
\RequirePackage{pdflscape}
\RequirePackage{longtable}
\RequirePackage{stackengine}
\RequirePackage{indentfirst}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\RequirePackage{listings}
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

\usepackage[
    backend=biber,
    bibencoding=utf8,
    sorting=none,
    movenames=false,
    style=gost-numeric,
    doi=true,
    urldate=short,
]{biblatex}

% Configuring links
\urlstyle{rm}
\hypersetup{
  raiselinks=true,
  linktocpage,
  linktoc=page
}

% Bibliography management
\renewcommand*{\mkbibhdnamefamily}[1]{#1}

\makeatletter
    \defbibheading{nobibheading}{}
    \newtotcounter{citenum}
    \defbibenvironment{counter}
        {\setcounter{citenum}{0}\renewcommand{\blx@driver}[1]{}}
        {}
        {\stepcounter{citenum}}
\makeatother 

\newcommand*{\countcites}{
    \printbibliography[env=counter, heading=nobibheading]
}

\defbibenvironment{bibliography}
{\list
    {\printtext[labelnumberwidth]{
        \printfield{prefixnumber}
        \printfield{labelnumber}}}
    {
        \setlength{\labelwidth}{\labelnumberwidth}
        \setlength{\leftmargin}{0pt}
        \setlength{\labelsep}{\widthof{\ }}
        \setlength{\itemsep}{0pt}
        \setlength{\itemindent}{1.25cm}
        \addtolength{\itemindent}{\labelwidth}
        \addtolength{\itemindent}{\labelsep}
        \setlength{\parsep}{\bibparsep}
    }
    \renewcommand*{\makelabel}[1]{\hss##1}
}
{\endlist}
{\item}

% Access date format
% \renewbibmacro*{urldate}{
%     (дата обращения \printfield{urlday}.\printfield{urlmonth}.\printfield{urlyear})
% }

% Restrict hyphenation
\newcommand{\jj}{
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
}
\newenvironment{jje}{\jj\par}{\par}

% Date
\AtBeginDocument{
  \DTMnewdatestyle{passdate}{
      \renewcommand{\DTMdisplaydate}[4]{
          \number##3\  \DTMmonthname{##2}
      }
      \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}
  }
  \DTMsetdatestyle{passdate}
}

% Setting lines stretch and tolerance
\tolerance=300
\hbadness=300
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

% Math
\AtBeginDocument{
    \setlength{\abovedisplayskip}{.75\baselineskip}
    \setlength{\belowdisplayskip}{.75\baselineskip}
    \setlength{\abovedisplayshortskip}{.75\baselineskip}
    \setlength{\belowdisplayshortskip}{.75\baselineskip}
}

% Tables
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

% Table of contents styling
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

% Enumerations
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
\setlist[enumerate, 1]{}
\setlist[enumerate, 2]{}
\setlist[enumerate, 3]{}
\renewlist{enumerate}{enumerate}{3}

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
\setlist[termenum, 1]{}
\setlist[termenum, 2]{}
\setlist[termenum, 3]{}

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
\setlist[itemize, 1]{}
\setlist[itemize, 2]{}
\setlist[itemize, 3]{}
\renewlist{itemize}{itemize}{3}

% Setting up counters
\regtotcounter{page}
\regtotcounter{table}
\regtotcounter{figure}

% Figures
\captionsetup[figure]{
    name=Рисунок,
    format=plain,
    justification=centering,
}

% Longtables
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

% Listings
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