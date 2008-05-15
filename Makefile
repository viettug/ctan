default:

readme:
	@sh ./ctan |sed -e 's/:: //g' > README

filelist:
	@ls | grep -v "~" |grep -v ".zip" > FILELIST

distro:
	@chmod +x ./ctan
	@rm -fv ctan_tools.zip
	@zip -9r ctan_tools.zip ../ctan.tools/ -x "*svn*" -x "*~"

install:
	@install -v -m 750 ./ctan ~/bin

all: readme filelist distro

