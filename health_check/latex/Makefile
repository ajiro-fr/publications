KEEP=.svg|.tex|Makefile|.potx|.odp
INIT=*.odt
CLS=*~ *.log *.aux *.out *.bak *.toc *.pl
TEXFILES = $(wildcard *.tex)
SVGFILES = $(wildcard includes/*.svg)

all: ps

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

%.pdf: %.svg
	inkscape -f $< --export-pdf=$@

clean:
	find . -maxdepth 1 -type f |egrep -v '($(KEEP))$$' | xargs rm -f

pdf: img $(patsubst %.tex,%.pdf,$(TEXFILES))

img: $(patsubst %.svg,%.pdf,$(SVGFILES))
