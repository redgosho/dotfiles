#--------------------------------------------------
# 環境変数の設定(https://qiita.com/magicant/items/d3bb7ea1192e63fba850)
# 環境変数を設定する (export する変数)
#--------------------------------------------------
#--------------------------------------------------
# 環境依存設定
#--------------------------------------------------
if [ "`uname`" == "Darwin" ]; then
  #--------------------------------------------------
  # MacOS
  #--------------------------------------------------
  export PATH=/usr/local/bin:$PATH
  # npm global path
  export PATH=$PATH:`npm bin -g`
  # MacのHigh Sierraから、デフォルトのOpenSSLがOpenSSLからLibreSSLになっているからOpenSSLにする
  export PATH="/usr/local/opt/openssl/bin:$PATH"
  # ANDROID
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  # GCP-Command
  export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
  export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
elif [ "`uname`" == "Linux" ]; then
  #--------------------------------------------------
  # Linux
  #--------------------------------------------------  
  # homebrew
  export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
  PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$(brew --prefix)/share/man:$MANPATH"
  export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  umask 002
  # # rbenv(https://qiita.com/go_d_eye_0505/items/44d12ef0d52b2dc9d560)
  # export PATH="$HOME/.rbenv/bin:$PATH"
  # eval "$(rbenv init -)"

  # # python系(https://qiita.com/fury00812/items/08036e78a449d1cbeb48)
  # # pyenv pythonのバージョン管理
  # export PYENV_ROOT="$HOME/.pyenv"
  # export PATH="$PYENV_ROOT/bin:$PATH"
  # eval "$(pyenv init -)"
fi

#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# global npmのPATH
export PATH=~/.npm_global/bin:$PATH

# rbenv(https://qiita.com/Alex_mht_code/items/d2db2eba17830e36a5f1)
# rubyバージョン管理
if which rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# python系(https://qiita.com/fury00812/items/08036e78a449d1cbeb48)
# pyenv pythonのバージョン管理
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

#nodenv nodeバージョン管理
if which nodenv > /dev/null; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

# for jenv
if which jenv > /dev/null; then
  # JENV_ROOTがemptyの場合、'${HOME}/.jenv'がrootと設定される
  jenv enable-plugin export # JAVA_HOMEの自動設定
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi


# AWS(awscliの設定後)
if which aws > /dev/null; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
fi

## 最後にbashrcの読み込み
test -r ~/.bashrc && . ~/.bashrc