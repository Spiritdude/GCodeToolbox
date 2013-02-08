VERSION=0.001

all::
	@echo "make install test" 

install::
	cp gctoolbox ~/bin/

tests::	
	cd tests; make

clean::
	cd tests; make clean

dist::	clean
	cd ..; tar cfz Backup/gcodetoolbox-${VERSION}.tar.gz GCodeToolbox/

backup::
	scp ../Backup/gcodetoolbox-${VERSION}.tar.gz the-labs.com:Backup/

github::
	git remote set-url origin git@github.com:Spiritdude/GCodeToolbox.git
	git push -u origin master

edit::
	dee4 gctoolbox cube10mm.stl Makefile INSTALL README.md slic3r.howto
		
