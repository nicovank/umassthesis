.PHONY: all
all:
	./latexrun -o main.pdf -Wall --latex-cmd=xelatex MAIN.tex

.PHONY: clean
clean:
	./latexrun --clean-all
