FILES=ctan README FILELIST
default:
	@echo "Please use VERSION environment to generate new archive"

README: ctan Makefile
	@ctan about |sed -e 's/:: //g' > README

filelist:
	@echo README > FILELIST
	@echo ctan   >> FILELIST

releases/ctan_tools-$(VERSION).zip: readme filelist
	@[[ ! -f $(@) ]] && [[ -n "$(VERSION)" ]] \
		|| { \
			echo ":: File '$(@)' does exist, or '$$VERSION' is empty." ; \
			false ; }
	@rm -rf ctan_tools; mkdir ctan_tools
	@cp $(FILES) ctan_tools
	@chmod +x ctan_tools/ctan
	@zip -9r $(@) ctan_tools/

release: releases/ctan_tools-$(VERSION).zip
	@echo "New archive is created at 'releases/ctan_tools-$(VERSION).zip'"
