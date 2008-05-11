default:

readme:
	@sh ./ctan |sed -e 's/:: //g' > README

filelist:
	@ls | grep -v "~" |grep -v ".zip" > FILELIST

distro:
	@chmod +x ./ctan
	@rm -fv ctan.zip
	@zip -9r ctan_tools.zip ../ctan.tools/ -x "*svn*" -x "*~"

all: readme filelist distro

