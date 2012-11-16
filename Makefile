
.PHONY: all
all: git-presentation

.PHONY: clean
clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.swp *.pdf *.vrb

.PHONY: git-presentation
git-presentation: git-presentation.pdf

.PHONY: show
show: git-presentation
	@which evince || (echo "evince must be installed to show presentation"; exit 1)
	evince -p 1 -s git-presentation.pdf

%.pdf: %.tex
	texi2dvi --pdf -o $@ $<

