ZSH_DIR = $(HOME)
SELF_ZSH_DIR = $(MODULE_DIR)/zsh

ZSHRC_FILE = $(SELF_ZSH_DIR)/.zshrc

ZSH_CLEAN_TARGETS += zsh-shell-clean
ZSH_TARGETS += zsh-shell-install

.PHONY: zsh-shell-clean
zsh-shell-clean:
	rm -rf $(ZSH_DIR)/.zshrc

.PHONY: zsh-shell-install
zsh-shell-install:
	ln -sf $(SELF_ZSH_DIR)/.zshrc $(ZSH_DIR)/.zshrc
