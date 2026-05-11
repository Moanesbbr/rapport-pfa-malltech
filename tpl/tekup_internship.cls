%========= TEK-UP Internship Report LaTeX Class =========%
% Adapted for 2nd Year Internship Reports — English      %
%==========================================================%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tekup_internship}[2025/01/01 TEK-UP Internship Report Class]

\LoadClass[11pt,a4paper,oneside]{book}
\usepackage[a4paper]{geometry}

\addtolength{\headheight}{2.5pt}

\setlength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{-1in}
\setlength{\topmargin}{-1in}

\setlength{\hoffset}{0mm}
\setlength{\voffset}{0mm}

\addtolength{\oddsidemargin}{22mm}
\addtolength{\evensidemargin}{22mm}
\addtolength{\topmargin}{20mm}

\setlength{\marginparwidth}{40pt}
\setlength{\marginparsep}{10pt}
\setlength{\headsep}{0.2in}

\setlength{\textwidth}{21cm}
\setlength{\textheight}{30cm}

\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\textwidth}{-2in}

\addtolength{\textheight}{-2\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-2in}

\brokenpenalty=10000
\renewcommand\floatpagefraction{0.8}

\usepackage[none]{hyphenat}

\usepackage{titlesec}
\titlespacing*{\section}{7mm}{12pt}{8pt}
\titlespacing*{\subsection}{15mm}{12pt}{8pt}
\titlespacing*{\subsubsection}{18mm}{12pt}{6pt}

\usepackage{setspace}
\setstretch{1.6}

\setlength{\parindent}{12mm}

%================ Language ===============================%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{csquotes}

%================== Bibliography =========================%
\usepackage[backend=bibtex,style=ieee,sorting=none]{biblatex}
\addbibresource{biblio.bib}

%============== List / Data Customization ================%
\usepackage{enumitem}
\usepackage{datatool}

\newcommand{\sortitem}[2][\relax]{%
  \DTLnewrow{list}%
  \DTLnewdbentry{list}{sortlabel}{#1}%
  \DTLnewdbentry{list}{description}{%
      \begin{minipage}[l]{0.10\columnwidth}~\textbf{#1}\end{minipage}%
      \begin{minipage}[l]{0.05\columnwidth}\textbf{=}\end{minipage}%
      \begin{minipage}[l]{0.83\columnwidth}#2\end{minipage}%
  }%
}
\newenvironment{acronyms}{%
  \DTLifdbexists{list}{\DTLcleardb{list}}{\DTLnewdb{list}}%
}{%
  \DTLsort{sortlabel}{list}%
  \begin{itemize}%
    \DTLforeach*{list}{\theDesc=description}{\item \theDesc}%
  \end{itemize}%
}

%================= Colors ================================%
\usepackage[table]{xcolor}
\definecolor{tekupBlue}{RGB}{31, 78, 121}
\definecolor{tekupLightBlue}{RGB}{70, 130, 180}

%================= Minitoc ===============================%
\usepackage[english]{minitoc}
\mtcsettitle{minitoc}{Contents}
\setcounter{minitocdepth}{1}
\mtcsetrules{minitoc}{off}
\mtcsetoffset{minitoc}{-1.0em}

\newcommand{\filterminitoc}[1]{#1}
\renewcommand{\thesection}{\csname filterminitoc \endcsname{\arabic{chapter}.}\arabic{section}}
\newcommand{\minitocsection}{\begingroup\renewcommand{\filterminitoc}[1]{}\minitoc\endgroup}

%================ Chapter Style =========================%
\usepackage{pstricks}
\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1.2ex \hfill \kern \z@}

\def\@makechapterhead#1{%
    \vspace*{30\p@}%
    {\parindent \z@ \centering \reset@font
        \thickhrulefill\quad
        \scshape\bfseries\textit{\@chapapp{}  \thechapter}
        \quad \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1 \par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
        \vskip 50\p@
    }%
    \minitocsection
    \thispagestyle{empty}%
    \newpage
}
\def\@makeschapterhead#1{\hbox{%
    \huge\hbox{\textbf{#1}}%
}\par\vskip 1cm}
\makeatother

%================ Captions ==============================%
\usepackage{caption}
\captionsetup[table]{
  labelfont=bf,
  name=Table,
  justification=justified,
  singlelinecheck=false,
  labelsep=colon,
  skip=\medskipamount}

\captionsetup[figure]{
  labelfont=bf,
  name=Figure,
  justification=centering,
  singlelinecheck=false,
  labelsep=colon,
  skip=\medskipamount}

%================ Headers & Footers =====================%
\usepackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0.3pt}
\pagestyle{fancy}
\lhead{\nouppercase{\leftmark}}
\rfoot{\centering \thepage}

\fancypagestyle{frontmatter}{%
  \fancyhf{}%
  \renewcommand{\footrulewidth}{0.3pt}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[r]{\footnotesize \thepage}%
}

\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\footrulewidth}{0.3pt}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[c]{\footnotesize \thepage}
}

\makeatletter
\fancypagestyle{cover}{
  \fancyhf{}
  \renewcommand{\footrulewidth}{0pt}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{{\noindent\makebox[\textwidth][c]{Academic Year \@collegeYear}}}
}
\makeatother

%================ Graphics & Tables =====================%
\usepackage{graphicx}
\usepackage{graphics}
\usepackage{float}
\usepackage{tcolorbox}
\usepackage{afterpage}
\usepackage{array,longtable,multirow}
\usepackage{pifont}
\usepackage{pdflscape}
\usepackage{rotating}
\usepackage{wrapfig}
\usepackage{booktabs}
\usepackage{listings}

%================ Hyperref (last) =======================%
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=tekupBlue,
    citecolor=tekupBlue,
    urlcolor=tekupLightBlue
}
