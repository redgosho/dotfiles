FISHER_DIR = ~/.config/fisher
FISH_DIR = ~/.config/fish
FISHER_MODULE_DIR = $(MODULE_DIR)/fisher

FISH_CLEAN_TARGETS += fisher-clean
FISH_TARGETS += fisher-install

.PHONY: fisher-clean
fisher-clean:
	rm -fr $(FISHER_DIR)

.PHONY: fisher-install
fisher-install: $(FISHER_DIR)

$(FISHER_DIR):$(FISH_DIR)
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
	mkdir -p $(FISHER_DIR)
	ln -sf $(FISHER_MODULE_DIR)/fish_plugins $(FISH_DIR)/fish_plugins
	@printf '\nSwitch to fish shell and type\033[35m ”fisher update”\033[m.\n'