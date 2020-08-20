#--------------------------------------------------
# 環境変数以外の設定(https://qiita.com/magicant/items/d3bb7ea1192e63fba850)
# 環境変数でない変数を設定する (export しない変数)
# エイリアスを定義する
# シェル関数を定義する
# コマンドライン補完の設定をする
#--------------------------------------------------
if [ "`uname`" == "Darwin" ]; then
  #--------------------------------------------------
  # MacOS
  #--------------------------------------------------
  # design -------------
  # ディレクトリカラー設定(https://qiita.com/PinkPhayate/items/a670e7e7935baea988f2)
  export LSCOLORS=hxfxcxdxbxegedabagacad
  alias ls='ls -G'
elif [ "`uname`" == "Linux" ]; then
  #--------------------------------------------------
  # Linux
  #--------------------------------------------------
  # design -------------
  # ディレクトリカラー設定(https://qiita.com/PinkPhayate/items/a670e7e7935baea988f2)
  eval `dircolors ~/.colorrc`
  alias ls='ls --color=auto'
fi
#--------------------------------------------------
# 共通
#--------------------------------------------------
# alias --------------
alias ll="ls -lF"

# design -------------
# $の前の設定
PS1="\e[1;33m\]\w\[\e[m\] >> " # ディレクトリ名 >>
# (文字黒/背景灰色) 時刻 (文字灰色/背景水色)▶︎(文字黒) ディレクトリ (文字水色/背景色なし)▶︎(装飾なし)
# export PS1='\[\e[30;47m\] \t \[\e[37;46m\]\[\e[30m\] \W \[\e[36;49m\]\[\e[0m\] '
# export PS1='\[\e[30;47m\] \t \[\e[37;46m\]\[\e[30m\] \w \[\e[36;49m\]\[\e[0m\] '

# shell function ------
# peco
# 矢印でファイルを選択して移動
function llcd {
    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
