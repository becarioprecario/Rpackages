SHELL := /bin/bash
#Rdev := ~/usr/bin/R
Rdev := /usr/local/bin/R

%.R : %.Rmd
	echo "knitr::purl(\"$<\")" | $(Rdev) --no-save

%.pdf : %.Rmd
	echo "rmarkdown::render(\"$<\")" | $(Rdev) --no-save


all:	practical1 practical2 practical3 practical4 zip

practical1: practical1.R practical1.pdf

practical2: practical2.R practical2.pdf

practical3: practical3.R practical3.pdf

practical4: practical4.R practical4.pdf


clean:
	rm practical[1-4]*tex
	rm practical[1-4]*R
	rm practical[1-4]*pdf
	touch spain.dummy; rm spain.*
	touch zipdummy.zip; rm *zip
	
	make tidy

tidy:
	rm *png
	rm practical[1-4]*aux
	rm practical[1-4]*log
	#rm practical[1-4]*nav
	#rm practical[1-4]*snm
	#rm practical[1-4]*out
	#rm practical[1-4]*toc
	#rm practical[1-4]*vrb
	
zip: 
	touch Rplotsdummy.pdf
	rm Rplots*pdf
	zip -r files_practicals.zip practical[1-4]*pdf practical[1-4]*R dataset_SF \
	dataset_debt dataset_noise 


