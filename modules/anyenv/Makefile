ANYENV_DIR = ~/.anyenv
ANYENV_PLUGINS_DIR = ~/.anyenv/plugins

ANYENV_CLEAN_TARGETS += anyenv-clean
ANYENV_TARGETS += anyenv-install

.PHONY: anyenv-clean
anyenv-clean:
	rm -fr $(ANYENV_DIR)

.PHONY: anyenv-install
anyenv-install:
	rm -fr $(ANYENV_PLUGINS_DIR)
	mkdir -p $(ANYENV_PLUGINS_DIR)
	git clone https://github.com/znz/anyenv-update.git $(ANYENV_PLUGINS_DIR)/anyenv-update
	git clone https://github.com/znz/anyenv-git.git $(ANYENV_PLUGINS_DIR)/anyenv-git
	anyenv install nodenv
	anyenv install pyenv