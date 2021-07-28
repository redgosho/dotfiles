ZSH_DIR = $(HOME)
ZSH_PLUGINS_DIR = ~/.zsh
SELF_ZSH_DIR = $(MODULE_DIR)/zsh

ZSH_CLEAN_TARGETS += zsh-shell-clean
ZSH_TARGETS += zsh-shell-install

.PHONY: zsh-shell-clean
zsh-shell-clean:
	rm -rf $(ZSH_DIR)/.zshrc
	rm -rf $(ZSH_PLUGINS_DIR)

.PHONY: zsh-shell-install
zsh-shell-install:
	ln -sf $(SELF_ZSH_DIR)/.zshrc $(ZSH_DIR)/.zshrc
	rm -rf $(ZSH_PLUGINS_DIR)
	git clone https://github.com/zsh-users/zsh-autosuggestions $(ZSH_PLUGINS_DIR)/zsh-autosuggestions

