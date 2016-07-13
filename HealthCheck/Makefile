CLEAN=*~ *.rtf *.ps *.log *.dvi *.aux *.pdf *.out *.html *.css *.bak *.toc *.pl *.4ct *.4tc *.lg *.sxw *.tmp *.xref *.idv *.tns *.nav *.snm
TEXFILES = $(wildcard *.md)

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

pdf: $(patsubst %.md,%.pdf,$(TEXFILES))
clean:
	rm -f $(CLEAN)
	
