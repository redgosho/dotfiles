# write your settings!
# 環境変数を設定
#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# for pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
source (pyenv init - | psub)

#for nodenv
source (nodenv init - | psub)

#android studio
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $ANDROID_HOME/emulator $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/tools/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

# gcp
set -x PATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc $PATH
set -x PATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc $PATH

# awsアクセスキー設定(awscliの設定後)
set AWS_ACCESS_KEY_ID (aws configure get aws_access_key_id)
set AWS_SECRET_ACCESS_KEY (aws configure get aws_secret_access_key)

#--------------------------------------------------
# 環境依存設定
#--------------------------------------------------
switch (uname)
case Linux
  echo "import Linux(local.fish)"
  #--------------------------------------------------
  # Linux
  #--------------------------------------------------
  # homebrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin $PATH
  PATH $HOME/.linuxbrew/bin $PATH
  set -x MANPATH (brew --prefix)/share/man $MANPATH
  set -x INFOPATH (brew --prefix)/share/info $INFOPATH
  source (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  umask 002
case Darwin
  echo "import Mac(local.fish)"
  #--------------------------------------------------
  # MacOS
  #--------------------------------------------------
  # Homebrewの実行ファイルはここに置かれる
  set -x PATH /usr/local/bin $PATH
  # MacのHigh Sierraから、デフォルトのOpenSSLがOpenSSLからLibreSSLになっているからOpenSSLにする
  set -x PATH /usr/local/opt/openssl/bin $PATH
case FreeBSD NetBSD DragonFly
  echo "import FreeBSD NetBSD DragonFly(local.fish)"
case '*'
  echo "Hi, stranger!(local.fish)"
end

# for composer
# set PATH $PATH $HOME/.composer/vendor/bin

# for gem
# set -x GEM_HOME $HOME/.gem
# set -x PATH $PATH $GEM_HOME/bin

# for golang
# set -x GOPATH $HOME/projects/go
# set -x PATH $PATH $GOPATH/bin

# for gcloud
# set -x PATH $PATH $HOME/google-cloud-sdk/bin

# colorrc
# set -x PATH $PATH (brew --prefix coreutils)/libexec/gnubin
# bass (dircolors ~/.colorrc)

#nodenvの設定
# set -x PATH $HOME/.nodenv/bin $PATH
# eval (nodenv init - | source)

# npm
# set -x PATH $HOME/.npm-global/bin $PATH

# cask
# set -x PATH $HOME/.cask/bin $PATH

# for goenv
# set -x GOENV_ROOT $HOME/.goenv
# set -x PATH $PATH $GOENV_ROOT/bin
# source (goenv init - | psub)
# set -x PATH $PATH $GOENV_ROOT/bin
# set -x PATH $PATH $GOPATH/bin

# for rbenv
# set -x PATH $PATH $HOME/.rbenv/bin
# source (rbenv init - | psub)

# nodebrew
# set -x PATH $PATH $HOME/.nodebrew/current/bin

# roswell
# set -x PATH $PATH $HOME/.roswell/bin

# cargo
# set -x PATH $PATH $HOME/.cargo/bin

# mac
# set -x PATH $PATH /usr/local/sbin
# set -xg LANG en_US.UTF-8
# set -xg LC_ALL en_US.UTF-8

# direnv
# eval (direnv hook fish)

# alias emacs 'emacs -nw'
# alias gnucash 'env LANGUAGE=ja_JP.UTF-8 LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8 gnucash'
# alias ss 'open /System/Library/CoreServices/ScreenSaverEngine.app'
# alias ls 'gls --color'
# alias sbcl 'rlwrap sbcl'
