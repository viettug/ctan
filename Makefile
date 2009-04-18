default:

readme:
	@sh ./ctan about |sed -e 's/:: //g' > README

filelist:
	@ls | grep -v "~" |grep -v ".zip" > FILELIST

distro:
	@chmod +x ./ctan
	@rm -fv ctan_tools.zip
	@zip -9r ctan_tools.zip ../ctan.tools/ -x "*svn*" -x "*~"

install:
	@install -v -m 750 ./ctan $(HOME)/bin

all: readme filelist distro

upload:
	@echo "* update remote script"
	@echo "* update blog"
	@echo "* update viettug repository"
	@site5.up -d bin ctan
