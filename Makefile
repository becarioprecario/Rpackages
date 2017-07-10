SHELL := /bin/bash
#Rdev := ~/usr/bin/R
Rdev := /usr/local/bin/R

%.tex : %.Rnw
	echo "Sweave(\"$<\", encoding=\"utf8\", keep.source=FALSE)" | $(Rdev) --no-save
#	echo "Sweave(\"$<\", encoding=\"latin1\", keep.source=FALSE)" | ~/usr/bin/R --no-save

%.R : %.Rnw
	echo "Stangle(\"$<\", encoding=\"utf8\")" | $(Rdev) --no-save
#	echo "Stangle(\"$<\", encoding=\"latin1\")" | ~/usr/bin/R --no-save

%.pdf : %.tex
	pdflatex $<

%.html : %.Rmd
	echo "rmarkdown::render(\"$<\")" | $(Rdev) --no-save
	echo "knitr::purl(\"$<\")" | $(Rdev) --no-save


all:	Lecture1.html Lecture1.R Lecture2.html Lecture2.R Lecture3.html Lecture3.R Lecture4.html Lecture4.R

clean:
	rm Lecture[1-5]*tex
	rm Lecture[1-5]*R
	rm Lecture[1-5]*pdf
	make tidy

tidy:
	rm Lecture[1-5]*aux
	rm Lecture[1-5]*log
	rm Lecture[1-5]*nav
	rm Lecture[1-5]*snm
	rm Lecture[1-5]*out
	rm Lecture[1-5]*toc
	rm Lecture[1-5]*vrb
	rm *kml *png
	
   
files_practicals.zip:
	cd practicals; make all; make zip; cd -



zip.old: files_practicals.zip
	touch Rplotsdummy.pdf
	rm Rplots*pdf
	zip -r ../materials practicals/files_practicals_Day1.zip \
                *pdf *R datasets models results Rcode 


zip: files_practicals.zip
	touch Rplotsdummy.pdf
	rm Rplots*pdf
	zip -r ../materials.zip install_pkgs.R \
		practicals/files_practicals.zip \
                Lecture[1-5]*pdf Lecture[1-5]*.R \
		st_*R\
		INLA_lattice.html INLA_lattice.R\
		INLA_geos.html INLA_geos.R\
		INLA_pp.html INLA_pp.R\
		INLA_st_geos.html INLA_st_geos.R\
		datasets models results Rcode 

