MAIN     = equations
LATEX    = pdflatex
LATEXMK  = latexmk
FLAGS    = -pdf -interaction=nonstopmode -file-line-error

.PHONY: all clean

all: $(MAIN).pdf

INCLUDED = robot_diagram.tex cable_tension_analysis.tex \
           euler_lagrange_dynamics.tex notation_appendix.tex

$(MAIN).pdf: $(MAIN).tex $(INCLUDED)
	$(LATEXMK) $(FLAGS) $(MAIN).tex

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
