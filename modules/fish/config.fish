#--------------------------------------------------
# 環境設定
#--------------------------------------------------
#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# load local.fish (環境変数、shell関数の読み込み)---------------------
source ~/.config/fish/local.fish
source ~/.config/fish/functions.fish

# alias ------------------------------------------
alias cdd='cd ~/Desktop'
alias ll='ls -lF'
alias d-c="docker-compose"
alias d-="docker"

#--------------------------------------------------
# setting
#--------------------------------------------------

#fisherパッケージdecors/fish-ghqの設定
set GHQ_SELECTOR peco

#--------------------------------------------------
# 環境依存設定
#--------------------------------------------------
switch (uname)
case Linux
  echo "import Linux(config.fish)"
  #--------------------------------------------------
  # Linux
  #--------------------------------------------------
  # design
  # ディレクトリカラー設定(https://qiita.com/PinkPhayate/items/a670e7e7935baea988f2)
  # eval 'dircolors ~/.colorrc'
  # alias ls='ls --color=auto'
case Darwin
  echo "import Mac(config.fish)"
  #--------------------------------------------------
  # MacOS
  #--------------------------------------------------
  # ディレクトリカラー設定(http://nemoplus.hateblo.jp/entry/20090119/1232373540)
  set -x LSCOLORS  hxfxcxdxbxegedabagacad
  alias ls='ls -G'
case FreeBSD NetBSD DragonFly
  echo "import FreeBSD NetBSD DragonFly(config.fish)"
case '*'
  echo "Hi, stranger!(config.fish)"
end

#--------------------------------------------------
# ゴミ箱
#--------------------------------------------------
# design
# コマンドの左の設定(顔文字にしたり…)
# function fish_prompt
#     if [ $status -eq 0 ]
#         set status_face (set_color white)"(0_0) >> "
#     else
#         set status_face (set_color red)"(X_X) >> "
#     end
#     printf '%s %s' (set_color yellow)(prompt_pwd) $status_face
# end

# oh-my-fish/theme-bobthefish 設定
# set -g theme_powerline_fonts no
# set -g theme_nerd_fonts yes

# Girステータスをコマンドの右に表示する設定
# # gitの状態表示(左)
# function fish_right_prompt
#     set last_status $status
#     printf '%s ' (__fish_git_prompt)
#     set_color normal
# end
# fish git prompt git表示付随設定
# # Fish git prompt
# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showuntrackedfiles 'yes'
# set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch yellow
# set __fish_git_prompt_color_upstream_ahead green
# set __fish_git_prompt_color_upstream_behind red
# # Status Chars
# set __fish_git_prompt_char_dirtystate '⚡'
# set __fish_git_prompt_char_stagedstate '→'
# set __fish_git_prompt_char_untrackedfiles '☡'
# set __fish_git_prompt_char_stashstate '↩'
# set __fish_git_prompt_char_upstream_ahead '+'
# set __fish_git_prompt_char_upstream_behind '-'
