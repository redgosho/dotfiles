BASH_DIR = $(HOME)
SELF_BASH_DIR = $(MODULE_DIR)/bash

BASH_PROFILE_FILE = $(SELF_BASH_DIR)/.bash_profile
BASHRC_FILE = $(SELF_BASH_DIR)/.bashrc

BASH_CLEAN_TARGETS += bash-shell-clean
BASH_TARGETS += bash-shell-install

.PHONY: bash-shell-clean
bash-shell-clean:
	rm -rf $(BASH_DIR)/.bash_profile
	rm -rf $(BASH_DIR)/.bashrc

.PHONY: bash-shell-install
bash-shell-install:
	ln -sf $(SELF_BASH_DIR)/.bash_profile $(BASH_DIR)/.bash_profile
	ln -sf $(SELF_BASH_DIR)/.bashrc $(BASH_DIR)/.bashrc
