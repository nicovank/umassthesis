.PHONY: all
all:
	./latexrun -o main.pdf -Wall MAIN.tex

.PHONY: clean
clean:
	./latexrun --clean-all
