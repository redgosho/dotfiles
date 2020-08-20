# 環境構築の流れ
MacOS及びDebian系に対応。

## 使い方
### ゼロから構築編(MacOS)
### 1:Homebrewのインストール
Homebrewはパッケージ管理ツール。
1. Xcodeをインストール  
App storeからXcodeをインストール
2. コマンドライン・デベロッパーツールをインストール  
3. 下記コマンドを実行
```
$ xcode-select --install
```
ポップアップが出てくるので"インストール"を選択し利用規約に同意
4. インストールが完了したら下記コマンドを実行  
```
$ curl -L https://raw.githubusercontent.com/redgosho/dotfiles/master/homebrew_install.sh | bash
```
homebrewがインストールされる。
Homebrewの導入は以上。

### 2:初期設定
1. dotfilesのダウンロード  
下記を実行。ホームディレクトリに各種設定ファイルが配置され反映される。

初期では`make core`により
* bash
* vim
* tmux
が設定される。
```
$ curl -L https://raw.githubusercontent.com/redgosho/dotfiles/master/install.sh | bash
```

2. パッケージインストール  
インストールパッケージは下記に記載
```
/config/homebrew/*
/config/apt/*
```
下記コマンドで上記記載パッケージをインストール
```
$ bash bin/brew-init.sh
```

3. 追加設定  
Fishなどの追加設定をしたい場合は`.dotfiles`のルートディレクトリで`make fish`などをすることで設定可能。→後述

## installモジュール概要
### Homebrew
* pythonバージョン管理
`pyenv` + `pipenv`の組み合わせ

* nodeバージョン管理
`nodenv`

## コマンド一覧
### Core
```
$ make core # install
$ make core-clean # uninstall
```
下記ツールdotfileのシンボリックリンク貼るだけ
* bash
* colorrc
* editorconfig
* git
* textlintrc
* tmux
* vim

### Fish
fish shellのdotfileを設定。
fisherコマンドはfishに切り替えてから実行すること。
```
$ make fish # install
$ make fish-clean # uninstall
```
* fish shell
* fisher
  - oh-my-fish/plugin-peco
  - decors/fish-ghq
  - oh-my-fish/theme-bobthefish

### Textlint
```
$ make textlint # install
$ make textlint-clean # uninstall
```
* npm

# 参考
たけちゃんのdotfilesを参考にしました。
https://github.com/takeokunn/dotfiles 