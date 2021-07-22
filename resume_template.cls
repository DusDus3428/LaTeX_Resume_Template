\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume_template}

% We are going to base this class on the article class
\LoadClass[11pt, oneside, letterpaper, titlepage]{article}

% This will be used to defined the page margins on the sides
\usepackage{geometry}
\geometry{
	letterpaper,
	left=0in,
	right=0in,
	top=0in,
	bottom=0in
}

% This will be used for the general formatting of the color boxes
\usepackage[most]{tcolorbox}

% This is used to crop your professional picture into a circle 
\usepackage{tikz}

% This is used to get rid of bullet points
\usepackage{enumitem}
%\usepackage{enumerate}

\usepackage{setspace}

% Define some colors that you want to use
% If you want to be safe: white for the page, black for the font, some other color for accents
\definecolor{primary}{RGB}{150,150,150}
\definecolor{secondary}{RGB}{216,216,216}
% Also some colors for the skill bars
\definecolor{bar_primary}{RGB}{255,255,255}
\definecolor{bar_background}{RGB}{0,0,0}

\usepackage{fontspec}
\setmainfont{Calibri} % Add a font that suits your preferences here

\tcbset{header/.style={colframe=primary,colback=primary,height=2in,sharp corners=all,valign=center}}
\tcbset{sidebar/.style={colframe=secondary,colback=secondary,height=9in,sharp corners=all}}
\tcbset{main/.style={colframe=white,colback=white,height=9in,sharp corners=all}}

\setlist[itemize]{leftmargin=*}