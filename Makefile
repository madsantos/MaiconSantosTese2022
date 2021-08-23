LATEX = pdflatex
BIBTEX = bibtex
RM = rm -f
FILE = MaiconSantosTese2021

### Standard PDF Viewers
# Defines a set of standard PDF viewer tools to use when displaying the result
# with the display target. Currently chosen are defaults which should work on
# most linux systems with GNOME installed and on all OSX systems.
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
PDFVIEWER = evince
endif

ifeq ($(UNAME), Darwin)
PDFVIEWER = open
endif
###

all:
	$(LATEX) $(FILE)
	$(BIBTEX) $(FILE)
	$(LATEX) $(FILE)
	$(LATEX) $(FILE)
	@echo ---------------------------------------------------
	@echo Ps: done.
	@echo ---------------------------------------------------

### Open PDF
	@echo Opening $(FILE).pdf...
	(${PDFVIEWER} $(FILE).pdf &)
###

clean:
	$(RM) $(FILE).aux 
	$(RM) $(FILE).bbl 
	$(RM) $(FILE).blg 
	$(RM) $(FILE).dvi
	$(RM) $(FILE).fls
	$(RM) $(FILE).fdb_latexmk 
	$(RM) $(FILE).lof 
	$(RM) $(FILE).log 
	$(RM) $(FILE).lot 
	$(RM) $(FILE).out 
	$(RM) $(FILE).pdf 
	$(RM) $(FILE).ps
	$(RM) $(FILE).synctex.gz 
	$(RM) $(FILE).tdo
	$(RM) $(FILE).toc 
	$(RM) *~ 
	$(RM) *backup
	$(RM) *bak
	@echo ---------------------------------------------------
	@echo Directory cleaned
	@echo ---------------------------------------------------
