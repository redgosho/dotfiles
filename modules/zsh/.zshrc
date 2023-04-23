#--------------------------------------------------
# 環境依存設定
#--------------------------------------------------
if [ "`uname`" = "Darwin" ]; then
  #--------------------------------------------------
  # MacOS
  #--------------------------------------------------
  echo 'zsh「Hello, I’m Macintosh.」'
  export LANG=ja_JP.UTF-8
  # design -------------
  # ディレクトリカラー設定(https://qiita.com/PinkPhayate/items/a670e7e7935baea988f2)
  export CLICOLOR=1
  export LSCOLORS=hxfxcxdxbxegedabagacad
  export LANG=ja_JP.UTF-8
  alias ls='ls -G'
  # shell restart
  alias resh='exec $SHELL -l'

  # Homebrew settings
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/opt/homebrew/bin:$PATH"
  # alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew" # anyenv用
  export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

  # command
  alias echo-path="echo $PATH | sed -e 's/:/\n/g'"

elif [ "`uname`" = "Linux" ]; then
echo 'zsh「Hello, I’m Linux.」'
  #--------------------------------------------------
  # Linux
  #--------------------------------------------------
  # design -------------
  # ディレクトリカラー設定(https://qiita.com/PinkPhayate/items/a670e7e7935baea988f2)
  eval `dircolors ~/.colorrc`
  alias ls='ls --color=auto'
fi

#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# alias --------------
alias ll="ls -lF"
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完系
# Gitの補完を有効化
autoload -Uz compinit && compinit
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# サジェスト系
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#--------------------------------------------------
# デザイン設定
#--------------------------------------------------
source ~/.zshrc_design

#--------------------------------------------------
# 環境設定
#--------------------------------------------------
# asdf
# . /usr/local/opt/asdf/libexec/asdf.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh
## asdf java
. ~/.asdf/plugins/java/set-java-home.bash

# # anyenv設定
# if [ -e "$HOME/.anyenv" ]
# then
#     export ANYENV_ROOT="$HOME/.anyenv"
#     export PATH="$ANYENV_ROOT/bin:$PATH"
#     if command -v anyenv 1>/dev/null 2>&1
#     then
#         eval "$(anyenv init - zsh)"
#     fi
# fi

# # nodenv
# if type nodenv > /dev/null 2>&1
# then
#   export PATH=$PATH:`npm bin -g`
# fi

# flutter
export PATH="$PATH:$HOME/development/flutter/bin"

# adb
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# AWS(awscliの設定後)
if which aws > /dev/null; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
fi

# go
if which go > /dev/null; then
  export GOPATH=$(go env GOPATH)
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Lima設定
if which lima > /dev/null; then
  # 2022-11-05 uninstall https://github.com/lima-vm/lima/discussions/463
  export DOCKER_HOST=unix:///Users/redgosho/.lima/docker/sock/docker.sock
fi

alias 2fk='oathtool --totp --base32 "VJYUAWI3X" | tee >( pbcopy )'

export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
