
.PHONY: all
all: git-presentation

.PHONY: clean
clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.swp *.pdf

.PHONY: git-presentation
git-presentation: git-presentation.pdf

.PHONY: show
show: git-presentation
	gnome-open git-presentation.pdf

%.pdf: %.tex
	texi2dvi --pdf -o $@ $<

