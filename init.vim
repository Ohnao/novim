"vi互換の打ち消し
if !&compatible
  set nocompatible
endif

" init.vimのリロード
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"NERDTreeの自動起動
autocmd VimEnter * execute 'NERDTree'
"隠しファイルをデフォルト表示
let NERDTreeShowHidden = 1
let g:NERDTreeLimitedSyntax = 1
"deoplete.nvimの設定
let g:deoplete#enable_at_startup = 1

"バックアップファイルをつくらない
set nobackup

"スワップファイルを作らない
set noswapfile

"ビープ音を無効化
set noerrorbells

"行番号
set number

"カーソルライン
set cursorline

"カッコ強調
set showmatch

"オートインデント
set autoindent

"tab
set tabstop=2
set shiftwidth=2
set expandtab

"ligjtlineの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
