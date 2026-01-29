%% dibsethesis.cls
%% 
%% Author: Pascal Schoettle <pascal.schoettle@mci.edu>
%% Thanks to Daniel Mur-Spiegl 
%% ------------------------------------------

%
%% Package Information
%% ------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dibsethesis}[2020/08/24]

%
%% Handling class options
%% ------------------------------------------
%\DeclareOption{thesistype}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption{titlepage}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption{master}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption{bachelor}{\PassOptionsToPackage{\CurrentOption}{dibse}}
\DeclareOption*{
    \ClassWarning{dibsethesis}{Unknown document option '\CurrentOption'.}
}
\ProcessOptions


%
%% Paper options and style file -----------------------------------------------

\LoadClass[a4paper,12pt]{article}

\RequirePackage{dibse}       % dibse.sty with options registered above

\newcommand{\thesistype}[1]{
	\newcommand{\thethesistype}{#1}
}

% Switch between Englsh and German... 
% first, german version:
\IfLanguageName{ngerman}{
\newcommand{\kwprogram}{Bachelorstudium}
\newcommand{\kwmethod}{Methode}
\newcommand{\kwMCI}{MCI~$\vert$~DIE UNTERNEHMERISCHE HOCHSCHULE\textsuperscript{\textregistered}}
\newcommand{\kwsupervisor}{Betreuer:in}
\newcommand{\kwauthor}{Verfasser:in}
\newcommand{\kwtoc}{Inhaltsverzeichnis}
\newcommand{\kwappendix}{Anhang}
\thesistype{Bachelorarbeit}
}{
\newcommand{\kwprogram}{Bachelor's Program}
\newcommand{\kwmethod}{Method}
\newcommand{\kwMCI}{MCI~$\vert$~THE ENTREPRENEURIAL SCHOOL\textsuperscript{\textregistered}}
\newcommand{\kwsupervisor}{Supervisor}
\newcommand{\kwauthor}{Author}
\newcommand{\kwtoc}{Table of Contents}
\newcommand{\kwappendix}{Appendix}
\thesistype{Bachelor's Thesis}
}




%
%% Commands
%% ------------------------------------------

\newcommand{\method}[1]{
    \newcommand{\themethod}{#1}
}

\newcommand{\advisor}[1]{
    \newcommand{\theadvisor}{#1}
}

\newcommand{\studentNumber}[1]{
    \newcommand{\thestudentNumber}{#1}
}

\newcommand{\academicYear}[1]{
    \newcommand{\theacademicYear}{#1}
}




\renewcommand{\maketitlepage}{
    \pagenumbering{Roman}

    \begin{titlepage}
        \newgeometry{top=3.5cm,bottom=2.5cm}
        \centering

        {\LARGE\bfseries\lsstyle \thetitle \par}
    
        \renewcommand{\baselinestretch}{1.1}

        \vspace{0.5cm}
        \vfill

        
        \fbox{\parbox[c][26pt][c]{\textwidth-6.8pt}{
            \centering {\LARGE\bfseries\scshape \thethesistype}
            }} \par
        
        \vspace{0.5cm}
        \vfill
        
        \kwmethod\par
        {\bfseries \themethod}

        \vfill

        \kwprogram\par
        {\large\bfseries \glqq Digital Business \& Software Engineering\grqq \par}
        \kwMCI\par
    
        \vfill
        \vfill
        
        \kwsupervisor\par
        {\bfseries \theadvisor \par}
        
        \vfill

        \kwauthor \par
        {\bfseries \theauthor \par}
        {\bfseries Jahrgang \ifdefined\theacademicYear \theacademicYear \else \the\year \fi \par}
        {\bfseries \thestudentNumber \par}		
                        
        \vfill
                    
        % Bottom of the page
        {\ifdefined\thedate \thedate \else \today \fi\par}
        \restoregeometry
    \end{titlepage}   

}

\newcommand{\makeaffidavit}{
	% first, german version:
	\IfLanguageName{ngerman}{
    {\large\bfseries Eidesstattliche Erkl\"arung}

	\vspace{0.5 cm}

	Ich erkl\"are hiermit an Eides statt, dass ich die vorliegende Bachelorarbeit selbst\"andig angefertigt
	habe. Die aus fremden Quellen direkt oder indirekt \"ubernommenen Gedanken sind als solche kenntlich
	gemacht. 
	
	Die Arbeit wurde bisher weder in gleicher noch in \"ahnlicher Form einer anderen Pr\"ufungsbeh\"orde vorgelegt und auch noch nicht veröffentlicht.
}{


    {\large\bfseries Affidavit}

    \vspace{0.5 cm}
    
    I hereby declare, under oath, that this Bachelor’s Thesis has been my independent work and has not been aided with  any  prohibited  means.  I  declare,  to  the  best  of  my  knowledge  and  belief,  that  all  passages  taken  from  published  and  unpublished  sources  or  documents  have  been  reproduced  whether  as  original,  slightly  changed  or  in  thought,  have  been  mentioned  as  such  at  the  corresponding  places  of  the  thesis,  by  citation,  where the extent of the original quotes is indicated. 
    
    The paper has not been submitted for evaluation to another examination authority or has been published in this form or another.
}
    
    \vspace{1cm}
    
    Innsbruck, \ifdefined\thedate \thedate \else \today \fi
    
    \vspace{3cm}
    
    %
    %% Line for signature
    \rule{0.4\textwidth}{0.4pt}
    
    %
    %% Autor
    \theauthor
}



\endinput
