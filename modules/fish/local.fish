# write your settings!
# 環境変数を設定
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

#--------------------------------------------------
# 共通設定
#--------------------------------------------------
# anyenv
if which anyenv > /dev/null
  set -x ANYENV_ROOT $HOME/.anyenv
  set -x PATH $PATH $ANYENV_ROOT/bin
  # eval (anyenv init - | source)
  source (anyenv init - fish | psub)
end

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
if which aws > /dev/null
  set AWS_ACCESS_KEY_ID (aws configure get aws_access_key_id)
  set AWS_SECRET_ACCESS_KEY (aws configure get aws_secret_access_key)
end
