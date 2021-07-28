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
fi

#--------------------------------------------------
# 共通設定
#--------------------------------------------------
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1
    then
        eval "$(anyenv init -)"
    fi
fi

# AWS(awscliの設定後)
if which aws > /dev/null; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
fi

## 最後にbashrcの読み込み
test -r ~/.bashrc && . ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/redgosho/google-cloud-sdk/path.bash.inc' ]; then . '/Users/redgosho/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/redgosho/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/redgosho/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/sbin:$PATH"
