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
	ln -sf $(FISHER_MODULE_DIR)/fishfile $(FISH_DIR)/fishfile
	@echo -e '\e[31mPlz type in \e[m\e[33;41;1m“fisher”\e[m'