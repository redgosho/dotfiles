FISH_DIR = ~/.config/fish
SELF_FISH_DIR = $(MODULE_DIR)/fish

LOCAL_FILE = $(SELF_FISH_DIR)/local.fish
FUNCTIONS_FILE = $(SELF_FISH_DIR)/functions.fish

FISH_CLEAN_TARGETS += fish-shell-clean
FISH_TARGETS += fish-shell-install

.PHONY: fish-shell-clean
fish-shell-clean:
	rm -rf $(FISH_DIR)

.PHONY: fish-shell-install
fish-shell-install:$(FISH_DIR)

$(FISH_DIR):
	mkdir -p $(FISH_DIR)
	ln -sf $(SELF_FISH_DIR)/config.fish $(FISH_DIR)/config.fish
	ln -sf $(SELF_FISH_DIR)/local.fish $(FISH_DIR)/local.fish
	ln -sf $(SELF_FISH_DIR)/functions.fish $(FISH_DIR)/functions.fish