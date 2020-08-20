alias ll="ls -lF"
alias guetzli-all='for F in *.jpg; do guetzli --quality 95 --verbose $F ./$F; done'


# python系------------------------------

# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv
# https://qiita.com/obr_y/items/0147a0f8a283c522e7f4
export PYTHON_PATH=$PYENV_ROOT/shims
export PATH=$PYTHON_PATH:$PATH

# pyenvさんに自動補完機能を提供してもらう
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi



# MAMP系--------------------------------

# mysqlコマンドでMAMP:MySQL起動
# export PATH=$PATH:/Applications/MAMP/Library/bin



# postgresql
export PATH=/usr/local/Cellar/postgresql/10.1/bin/:$PATH

# comporser
export PATH="$PATH:~/.composer/vendor/bin"

export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="/usr/local/sbin:$PATH"
