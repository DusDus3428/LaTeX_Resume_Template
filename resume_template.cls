\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume_template}

% We are going to base this class on the article class
\LoadClass[12pt, oneside, letterpaper, titlepage]{article}

% Defined the font here, make sure you have a license for the font you want to use, and make sure you have it installed.
\usepackage{fontspec}
\setmainfont{Cambria} % Add a font that suits your preferences here

% This packages gives us the chance to make a font larger than the \Huge command allows is
% I used it for the title section here
\usepackage{anyfontsize}

% This allows us to set the tracking (letter spacing) manually
\usepackage{microtype}

% This will be used for the general formatting of the color boxes
\usepackage[most]{tcolorbox}

% This will be used to defined the page margins on the sides
\usepackage{geometry}
\geometry{
	letterpaper,
	left=0in,
	right=0in,
	top=0in,
	bottom=0in
}

% This package is for the hyperlinks you want to use
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue
}

% This is used to crop your professional picture into a circle 
\usepackage{tikz}

% This is used to get rid of bullet points
\usepackage{enumitem}

% This package is used to calculate your skill level relative to the bar length
% See the new command at the bottom for more info
\usepackage{calculator}

% Define some colors that you want to use
% If you want to be safe: white for the page, black for the font, some other color for accents
\definecolor{primary}{RGB}{150,150,150}
\definecolor{secondary}{RGB}{216,216,216}
% Also some colors for the skill bars
\definecolor{bar_primary}{RGB}{255,255,255}
\definecolor{bar_background}{RGB}{0,0,0}

\tcbset{grid/.style={raster columns=6,raster height=11in,raster width=8.5in,raster column skip=0in,raster row skip=0in,raster force size=false}}

% These are some settings for the tcolorboxes used to structure the document
\newcommand{\borderwidth}{0.07}
\DIVIDE{\borderwidth}{2}{\halfborderwidth}
\tcbset{header/.style={colframe=primary,colback=primary,height=2in,sharp corners=all,valign=center,enhanced,borderline north={\borderwidth in}{0in}{white},borderline south={\borderwidth in}{-\halfborderwidth in}{white}}}
\tcbset{sidebar/.style={colframe=secondary,colback=secondary,height=9in,sharp corners=all,enhanced,borderline north={\borderwidth in}{-\halfborderwidth in}{white},borderline south={\borderwidth in}{0in}{white},borderline west={\borderwidth in}{0in}{white}}}
\tcbset{main/.style={colframe=white,colback=white,height=9in,sharp corners=all,enhanced,borderline north={\borderwidth in}{-\halfborderwidth in}{white},borderline south={\borderwidth in}{0in}{white},borderline east={\borderwidth in}{0in}{white}}}

% Some configurations for the item lists
\setlist[itemize]{leftmargin=*,itemsep=0pt}
\setlength\itemsep{0.1pt}


%
% CUSTOM COMMANDS
%


% This is a new command for your professional photo photo
% Parameter is the file name of your image including the extenstion (#1). 
% Check the .tex file to see it in action.
\newcommand{\imagewidth}{1.5}
\DIVIDE{\imagewidth}{2}{\imageradius}
\newcommand{\resumephoto}[1]{
	\begin{center}	
		\begin{tikzpicture}
			\draw[white,line width=0.075in] (0,0) circle (\imageradius in);
			\begin{scope}
				\clip(0,0) circle(\imageradius in);
				\node {\includegraphics[width=\imagewidth in]{#1}};
			\end{scope}		
		\end{tikzpicture}
	\end{center}
}

% This is a new command for the header title
% Parameters are your name (#1) and job title (#2). 
% Check the .tex file to see it in action.
\newcommand{\resumetitle}[2]{
	\begin{center}
		\SetTracking{encoding=*}{150}	
		\textls{
			{\fontsize{35}{60}\selectfont\textcolor{black}{#1}}\\
			\vspace*{0.25in}	
			{\fontsize{18}{60}\selectfont\textcolor{black}{- #2 -}}	
		}
	\end{center}
}

% This is a new command for the section titles
% Parameter is the section title (#1)). 
% Check the .tex file to see it in action.
\newcommand{\resumesection}[1]{
	\SetTracking{encoding=*}{150}
		\section*{\textls{#1}}
			\vspace*{-0.2in}		
			\hrulefill\\
}

% This new command is used to draw the skill bars according to your input. 
% Parameters are the skill (#1) and skill level in percent (#2). 
% For the skill level you can type in a number between 0 and 100 and the bar will be drawn accordingly. 
% Check the .tex file to see it in action.
\newcommand{\maxbarlength}{2.1}
\newcommand{\skill}[2]{
	\DIVIDE{#2}{100}{\perc} 
	\MULTIPLY{\maxbarlength}{\perc}{\skl}	
	{#1}\\[0.05in]
	\begin{tikzpicture}
		\filldraw[fill=bar_background,draw=bar_background] (0,0) rectangle (\maxbarlength in,0.15in);
		\filldraw[fill=bar_primary,draw=bar_primary] (0,0) rectangle (\skl in,0.15in);
	\end{tikzpicture}
}

% This new command is used for the headers of each entry in the work experience and education sections.
% Parameters are the company/school/university/college (#1), the city (#2), state/country (#3), job title/degree (#4), start month and year (#5), and the end month and year (#6).
% Check the .tex file to see it in action.
\newcommand{\exedentryheader}[6]{
	\vspace*{-0.01in}\noindent
	\textbf{#1 \hfill #2, #3 \\
	#4 \hfill #5 - #6}
	\vspace*{-0.05in}
}