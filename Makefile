###
# Inspired by: https://stackoverflow.com/a/18137056/5801152
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
###

EMERALD_PATH := $(current_dir)../old-emerald/
scripts_path := $(current_dir)scripts/
common_path := $(current_dir)envs/common/
path_base := $(common_path):$(scripts_path):$(PATH)

# ./git-ready-to-deploy.sh

all: vim listings

listings: listings-defs templated

listings-defs:
	$(eval path_name := listings)
	$(eval target := listings-emerald.tex)

vim: vim-defs templated

vim-defs:
	$(eval path_name := vim)
	$(eval target := emerald.vim)

templated: \
		template.sh
	mkdir -p build
	EMERALD_PATH="$(EMERALD_PATH)" \
	  PATH="$(current_dir)envs/$(path_name)/:$(path_base)" \
		bash $< > build/$(target)

clean:
	rm -rf build

.PHONY: all templated clean \
	listings listings-defs \
	vim vim-defs
