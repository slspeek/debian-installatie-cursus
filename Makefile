MAINNAME=installatie
LATEX_IMAGE=leplusorg/latex:sha-4a17317
RUNLATEX=docker run --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none  -v "$(shell pwd):/tmp"  $(LATEX_IMAGE) pdflatex $(MAINNAME).tex

default: clean viewpdf

print:
		$(RUNLATEX); $(RUNLATEX)

viewpdf: print
		open $(MAINNAME).pdf

clean:
		rm {tex/,}*.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc; exit 0
