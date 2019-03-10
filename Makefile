###
# Inspired by: https://stackoverflow.com/a/18137056/5801152
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
###

EMERALD_PATH := $(current_dir)../old-emerald/
scripts_path := $(current_dir)scripts/
common_path := $(current_dir)envs/common/
listings_path := $(current_dir)envs/listings/
path_extension := $(listings_path):$(common_path):$(scripts_path)

# ./git-ready-to-deploy.sh

listings-emerald.tex: \
		template.sh
	EMERALD_PATH="$(EMERALD_PATH)" \
	  PATH="$(path_extension):$(PATH)" \
		bash $< > $@

.PHONY: listings-emerald.tex
