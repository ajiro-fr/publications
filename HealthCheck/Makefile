CLEAN=*~ *.rtf *.ps *.log *.dvi *.aux *.pdf *.out *.html *.css *.bak *.toc *.pl *.4ct *.4tc *.lg *.sxw *.tmp *.xref *.idv *.tns *.nav *.snm
TEXFILES = $(wildcard *.tex)

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

pdf: $(patsubst %.tex,%.pdf,$(TEXFILES))
clean:
	rm -f $(CLEAN)
	
