VERSION=0.002

all::
	@echo "make install tests clean" 

install::
	#cp gctoolbox ~/bin/
	sudo cp gctoolbox /usr/local/bin/

tests::	
	cd tests; make

clean::
	cd tests; make clean

# --- developers only below

dist::	clean
	cd ..; tar cfz Backup/gcodetoolbox-${VERSION}.tar.gz GCodeToolbox/

backup::	clean
	scp ../Backup/gcodetoolbox-${VERSION}.tar.gz the-labs.com:Backup/

github::	clean
	git remote set-url origin git@github.com:Spiritdude/GCodeToolbox.git
	git push -u origin master

edit::
	dee4 gctoolbox Makefile INSTALL README.md slic3r.howto
		
