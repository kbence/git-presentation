
FRAMES=$(shell find frames -name '*.tex')

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
	evince -p 1 -s git-presentation.pdf &

.PHONY: view
view: git-presentation
	@which gnome-open || (echo "gnome-open must be installed to show presentation"; exit 1)
	gnome-open git-presentation.pdf

git-presentation.pdf: $(FRAMES)

%.pdf: %.tex
	texi2dvi --pdf -o $@ $<

