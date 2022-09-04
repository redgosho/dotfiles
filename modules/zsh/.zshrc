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
# User名、Dirを色付きで表示させるメソッド
# 色一覧↓↓
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
function left-prompt {
  name_t='235m%}'      # user name text clolr
  name_b='118m%}'    # user name background color
  name_t_err='007m%}'      # user name text clolr
  name_b_err='196m%}'    # user name background color
  path_t='235m%}'     # path text clolr
  path_b='007m%}'   # path background color
  arrow='200m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # triangle
  
  user="%(?.%{${back_color}${name_b}${text_color}${name_t}%}.%{${back_color}${name_b_err}${text_color}${name_t_err}%})"
  user_arrow="%(?.%{${back_color}${path_b}${text_color}${name_b}${sharp}%}.%{${back_color}${path_b}${text_color}${name_b_err}${sharp}%})"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${user_arrow} ${dir}%~${reset}${text_color}${path_b}${sharp} ${reset}\n${text_color}${arrow}→ ${reset}"
}
# プロンプトの左側にメソッドの結果を表示させる
PROMPT=`left-prompt` 

# コマンドの実行ごとに改行
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status
  branch='\ue0a0'
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset
  
  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch} "
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch} ?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch} +"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch} !"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch} !(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch} "
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}$branch_name${reset}"
}
 
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
 
# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

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
if which aws > /dev/null; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Lima設定
if which lima > /dev/null; then
  export DOCKER_HOST=unix:///Users/redgosho/.lima/docker/sock/docker.sock
fi

alias 2fk='oathtool --totp --base32 "VJYUAWI3X" | tee >( pbcopy )'

