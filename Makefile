VERSION=0.012

all::
	@echo "make install tests clean" 

install::
	#cp gctoolbox ~/bin/
	sudo cp gctoolbox /usr/local/bin/

deinstall::
	sudo rm -f /usr/local/bin/gctoolbox

tests::	
	cd tests; make

clean::
	rm -f Thumbs.db imgs/Thumbs.db examples/Thumbs.db
	cd tests; make clean

# --- developers only below

dist::	clean
	cd ..; tar cfz Backup/gcodetoolbox-${VERSION}.tar.gz "--exclude=*.git/*" GCodeToolbox/

backup::	clean
	scp ../Backup/gcodetoolbox-${VERSION}.tar.gz the-labs.com:Backup/

github::	clean
	git remote set-url origin git@github.com:Spiritdude/GCodeToolbox.git
	git push -u origin master

edit::
	dee4 gctoolbox Makefile README.md imgs/Makefile tests/Makefile tests/README.md tests/array/Makefile tests/array/README.md tests/array/make*Test slic3r.howto
		
