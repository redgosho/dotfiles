# 環境構築の流れ
MacOS及びDebian系に対応。

## 使い方
### ゼロから構築編(MacOS)
#### 1:Homebrewのインストール
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

#### 2:初期設定
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

### ゼロから構築編(Ubuntu)
#### 1:dotfilesの入手
下記コマンドを叩き、ローカルにdotfilesを設置する。
```
$ curl -L https://raw.githubusercontent.com/redgosho/dotfiles/master/install.sh | bash
```
#### 2:aptパッケージをインストール
多分makeが入っていなくてコケたりするので、最低限のaptパッケージをインストールする。  
インストールパッケージは`/config/apt/*`に記載
```
$ bash bin/apt-init.sh
```
これで必要なaptパッケージはインストール完了。移行はhomebrewでパッケージをインストールしていく。
インストールが終わったらおそらくコケているであろう
```
$ make core
```
してShellの再起動
```
$ exec $SHELL -l
```
#### 3:Homebrewの導入
次にHomebrewをインストールしていく。下記のコードを実行する。
```
$ curl -L https://raw.githubusercontent.com/redgosho/dotfiles/master/homebrew_install.sh | bash
```

次にHomebrewのパッケージをインストールしていく。インストールパッケージは`/config/homebrew/*`に記載
```
$ bash bin/brew-init.sh
```
最後にshellを再起動しておしまい(なはず)
```
$ exec $SHELL -l
```

## installモジュール概要
### Homebrew
* pythonバージョン管理
`pyenv` + `pipenv`の組み合わせ
使い方とか：https://qiita.com/fury00812/items/08036e78a449d1cbeb48
* nodeバージョン管理
`nodenv`
使い方とか：https://qiita.com/1000ch/items/41ea7caffe8c42c5211c
node-buildは`brew install nodenv`で入った。

## その他
### Font
プログラミングフォント「白源(HackGen)」を導入
参考：https://qiita.com/tawara_/items/374f3ca0a386fab8b305
Homebrewのinitで導入されているのでターミナル設定でHackGenにすればよい。

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