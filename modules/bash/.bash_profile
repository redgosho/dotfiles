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
  ## asdf
  . /usr/local/opt/asdf/libexec/asdf.sh
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
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
  # asdf
  . "$HOME/.asdf/asdf.sh"
  . "$HOME/.asdf/completions/asdf.bash"
fi

#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# AWS(awscliの設定後)
if which aws > /dev/null; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
fi

## 最後にbashrcの読み込み
test -r ~/.bashrc && . ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

export PATH="/usr/local/sbin:$PATH"
