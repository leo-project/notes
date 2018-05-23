#======================================================================
#
# LeoFS Development Notes
#
# Copyright (c) 2012-2018 LeoProject
#
#======================================================================
.PHONY: all build serve

ifneq ($(with_sd_notify),yes)
with_sd_notify := no
endif

all: build
build:
	rm -rf site/ && mkdocs build
serve: build
	mkdocs serve --dev-addr 0.0.0.0:8000
