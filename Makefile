FILES=ctan README
default:

readme: install
	@ctan about |sed -e 's/:: //g' > README

filelist:
	@echo do nothing

distro: readme filelist
	@chmod +x ./ctan
	@rm -fv ctan_tools.zip
	@mkdir -pv ctan_tools
	@cp $(FILES) ctan_tools
	@zip -9r ctan_tools.zip ctan_tools

install:
	@install -v -m 750 ./ctan $(HOME)/bin

all: readme filelist distro

upload:
	@echo "* update remote script"
	@echo "* update blog"
	@echo "* update viettug repository"
	@site5.up -d bin ctan
