# dotfiles
参考(丸パクリ):https://github.com/takeokunn/dotfiles 
## ツールの導入
### Homebrewのインストール
1. Xcodeをインストール  
App storeからXcodeをインストール
2. コマンドライン・デベロッパーツールをインストール  
下記コマンドを実行
```
$ xcode-select --install
```
ポップアップが出てくるので"インストール"を選択し利用規約に同意
3. インストールが完了したら下記コマンドを実行
```
$ bash homebrew_install.sh
```
### パッケージ導入
インストールパッケージは下記に記載
```
/config/homebrew/*
/config/apt/*
```
下記コマンドで上記記載パッケージをインストール
```
$ bash bin/brew-init.sh # for homebrew
$ bash bin/apt-init.sh  # for debian
```
## ツールの設定
### Easy Install
```
$ curl -L https://raw.githubusercontent.com/redgosho/dotfiles/master/install.sh | bash
```
### Core
```
$ make core-install # install
$ make core-clean # uninstall
```
* bash
* vim
* tmux
### Fish
```
$ make fish-install # install
$ make fish-clean # uninstall
```
* fish shell
* fisher
* oh-my-fish/plugin-peco
* decors/fish-ghq
* oh-my-fish/theme-bobthefish

### Textlint
```
$ make textlint # install
$ make textlint-clean # uninstall
```
* npm

## Tmux
Tmux実行前に`brew install reattach-to-user-namespace`をやる。