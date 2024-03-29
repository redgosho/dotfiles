TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
BIN_DIR = $(TOP_DIR)/bin
CONFIG_DIR = $(TOP_DIR)/config
MODULE_DIR = $(TOP_DIR)/modules
SOURCE_DIR = $(TOP_DIR)/src
TMP_DIR = $(TOP_DIR)/tmp

####################
#      targets     #
####################

# install
CORE_TARGETS +=
BASH_TARGETS +=
ZSH_TARGET +=
FISH_TARGETS +=
ANYENV_TARGETS +=
TEXTLINT_TARGETS +=

# clean
CORE_CLEAN_TARGETS +=
BASH_CLEAN_TARGETS +=
ZSH_CLEAN_TARGET +=
FISH_CLEAN_TARGETS +=
ANYENV_CLEAN_TARGETS +=
TEXTLINT_CLEAN_TARGETS +=

####################
#      include     #
####################

-include $(SOURCE_DIR)/make/*.mk
-include $(MODULE_DIR)/*/Makefile

####################
#     commands     #
####################

# install
.PHONY: core
core: $(CORE_TARGETS)

.PHONY: bash
bash: $(BASH_TARGETS)

.PHONY: zsh
zsh: $(ZSH_TARGETS)

.PHONY: fish
fish: $(FISH_TARGETS)

.PHONY: anyenv
anyenv: $(ANYENV_TARGETS)

.PHONY: textlint
textlint: $(TEXTLINT_TARGETS)

.PHONY: all
all: $(CORE_TARGETS) $(BASH_TARGETS) $(ZSH_TARGETS) $(FISH_TARGETS) $(TEXTLINT_TARGETS)

# clean
.PHONY: core-clean
core-clean: $(CORE_CLEAN_TARGETS)

.PHONY: bash-clean
bash-clean: $(BASH_CLEAN_TARGETS)

.PHONY: zsh-clean
zsh-clean: $(ZSH_CLEAN_TARGETS)

.PHONY: fish-clean
fish-clean: $(FISH_CLEAN_TARGETS)

.PHONY: anyenv-clean
anyenv-clean: $(ANYENV_CLEAN_TARGETS)

.PHONY: textlint-clean
textlint-clean: $(TEXTLINT_CLEAN_TARGETS)

.PHONY: clean
clean: $(CORE_CLEAN_TARGETS) $(BASH_CLEAN_TARGETS) $(ZSH_CLEAN_TARGETS) $(FISH_CLEAN_TARGETS) $(TEXTLINT_CLEAN_TARGES)

