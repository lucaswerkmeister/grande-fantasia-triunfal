.PHONY: all

all: fantasia.pdf

%.pdf: %.ly
	lilypond $<
