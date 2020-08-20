"参考 http://vimblog.hatenablog.com/entry/vimrc_set_recommended_options
" -------------------------------------
" 検索/置換の設定
" -------------------------------------
set hlsearch   " 検索文字列をハイライトする
set incsearch  " 検索文字入力時から検索を開始
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

" -------------------------------------
" カーソル移動関連の設定
" -------------------------------------
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" -------------------------------------
" 画面表示の設定
" -------------------------------------
" 全角スペースの表示" -------------------------------------
" 全角スペースの背景をグレーに変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=236
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert "カラースキーマーの設定
syntax on " シンタックスハイライト
highlight LineNr ctermfg=darkyellow " 行番号の色
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
highlight CursorLine ctermbg=235
" highlight CursorLine ctermfg=162
set cursorcolumn   " カーソル位置のカラムの背景色を変える
highlight CursorColumn ctermbg=235
" highlight CursorColumn ctermfg=162
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸-,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None "改行文字色設定
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None "タブ文字色設定

" -------------------------------------
" タブ/インデントの設定
" -------------------------------------
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" -------------------------------------
" 動作環境との統合関連の設定
" -------------------------------------
set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a " マウスの入力を受け付ける
set shellslash " Windows でもパスの区切り文字を / にする
set iminsert=0 " インサートモードから抜けると自動的にIMEをオフにする

" -------------------------------------
" コマンドラインの設定
" -------------------------------------
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000 " コマンドラインの履歴を10000件保存する

" -------------------------------------
" ビープの設定
" -------------------------------------
set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" -------------------------------------
" ファイル処理関連の設定
" -------------------------------------
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" -------------------------------------
" その他の設定
" -------------------------------------

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶" -------------------------------------
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" 自動的に閉じ括弧を入力" -------------------------------------
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>


