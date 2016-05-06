"--------------------
"" 基本的な設定
"--------------------
""新しい行のインデントを現在行と同じにする
set autoindent 
 
set hlsearch "検索文字列をハイライトする
set incsearch "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る

set ambiwidth=double

if has('path_extra')
    set tags & tags +=.tags,tags
endif


if has('macunix')
	let mapleader = ","
endif

set laststatus=2
set showtabline=2

set backspace=eol,indent,start

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

"" SomeSetting for Python Writing {{{
let $PYTHON3_DLL="/Users/Takahiro/.pyenv/shims/python3"
let $PYTHON_DLL="/Users/Takahiro/.pyenv/shims/python"
let g:python_highlight_all=1

" ~/.pyenv/shimsを$PATHに追加
" jedi-vim や vim-pyenc のロードよりも先に行う必要がある、はず。
let $PATH = "~/.pyenv/shims:".$PATH

" PATHの自動更新関数
" | 指定された path が $PATH に存在せず、ディレクトリとして存在している場合
" | のみ $PATH に加える
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction

" ~/.pyenv/shims を $PATH に追加する
" これを行わないとpythonが正しく検索されない
IncludePath(expand("~/.pyenv/shims"))

" .vim/after/ftplugin/python.vim
if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal foldmethod=indent
setlocal commentstring=#%s

" - af: a function
" - if: inner function
" - ac: a class
" - ic: inner class

" this plugin has aditional key-bind
"  -  '[pf', ']pf': move to next/previous function
"  -  '[pc', ']pc': move to next/previous class
xmap <buffer> af <Plug>(textobj-python-function-a)
omap <buffer> af <Plug>(textobj-python-function-a)
xmap <buffer> if <Plug>(textobj-python-function-i)
omap <buffer> if <Plug>(textobj-python-function-i)
xmap <buffer> ac <Plug>(textobj-python-class-a)
omap <buffer> ac <Plug>(textobj-python-class-a)
xmap <buffer> ic <Plug>(textobj-python-class-i)
omap <buffer> ic <Plug>(textobj-python-class-i)

setlocal omnifunc=jedi#completions

if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

"}}}


"clipboard
set clipboard=unnamed

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap <silent> jj <Esc>

" 日本語もいけるように
inoremap <silent> っj <Esc>

 " 入力モード中にC+[ でESC
inoremap <C-]> <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/temp
set undodir=$HOME/.vim/undo


" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" 矢印キーでなら行内を動けるように
nnoremap <Down> gj
nnoremap <Up> gk


" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

 " 移動
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k

" tab
nnoremap gr gT
nnoremap gn :tabnew<CR>


nnoremap <Leader>o C-O
"  
 "vi互換をオフする
set nocompatible

set t_Co=256

set fileformats=unix,dos
   
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
    
"タブの代わりに空白文字を指定する
set expandtab
   
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
      
"インクリメンタルサーチを行う
set incsearch
       
"行番号を表示する
set number
       
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
         
"新しい行を作った時に高度な自動インデントを行う
set smarttab

set virtualedit=block
          
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
           
nnoremap <ENTER> o<ESC>

" 日本語対策
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

"" python
" enable syntax highlighting
syntax enable

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"""bundle
"vi互換をoffに
set nocompatible
"決まり文句
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

let mapleader = ','

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

" unite settings
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap [unite] <Nop>
nmap U [unite]
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit outline<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>


NeoBundle 'Shougo/neocomplete.vim'
""neocomplete {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}"

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'


""NerdTree{{{
NeoBundle 'scrooloose/nerdtree'
nmap <Leader>b :NERDTreeFind<CR>
""}}}

NeoBundle 'kana/vim-operator-user'
"" vim-operator-surround {{{
NeoBundle 'rhysd/vim-operator-surround'
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" delete or replace most inner surround

" if you use vim-textobj-multiblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" if you use vim-textobj-anyblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" if you use vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)
"""}}}
NeoBundle 'vim-voom/VOoM'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Align'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundleLazy "sjl/gundo.vim", {
      \ "autoload": {
      \   "commands": ['GundoToggle'],
      \}}
nnoremap <Leader>g :GundoToggle<CR>

"" python {{{
" DJANGO_SETTINGS_MODULE を自動設定
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

" 補完用に jedi-vim を追加
NeoBundle "davidhalter/jedi-vim"
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
  let g:jedi#goto_command = '<Leader>G'
endfunction

" pyenv 処理用に vim-pyenv を追加
" Note: depends が指定されているため jedi-vim より後にロードされる（ことを期待）
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

NeoBundle 'andviro/flake8-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'bps/vim-textobj-python'
NeoBundleLazy "vim-scripts/python_fold", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}
""}}}

" * evervim {{{
NeoBundle 'kakkyz81/evervim'
python import sys; sys.path.append("/Users/Takahiro/.pyenv/versions/2.7.11/lib/python2.7/site-packages/")


let g:evervim_devtoken='S=s75:U=7c994d:E=15bc1b46738:C=1546a033a08:P=1cd:A=en-devtoken:V=2:H=dc49a34a335323908a63d60377af6c41'
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eB :<C-u>EvervimSearchByQuery<SPACE>tag:Readings<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
let g:evervim_splitoption=''
" ------------------------ }}}

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
autocmd BufRead,BufNewFile .mkd setfiletype mkd
autocmd BufRead,BufNewFile .md setfiletype mkd


NeoBundle 'tyru/open-browser.vim'
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <C-l> <Plug>(openbrowser-smart-search)
vmap <C-l> <Plug>(openbrowser-smart-search)

NeoBundle 'thinca/vim-quickrun'
nmap <Leader>r :QuickRun<CR>
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-textobj-indent'

NeoBundle 'LeafCage/foldCC.vim'

NeoBundleLazy "vim-scripts/python_fold", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'tpope/vim-fugitive'


set foldtext=FoldCCtext()

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"Alignの設定
let g:Align_xstrlen=3

" Kobito 連携のための記述
function! s:open_kobito(...)
        if a:0 == 0
                call system('open -a Kobito '.expand('%:p'))
        else
                call system('open -a Kobito '.join(a:000, ' '))
        endif
endfunction

" 引数のファイル(複数指定可)を
" Kobitoで開く
" （引数無しのときはカレントバッファを開く
 command! -nargs=* Kobito call s:open_kobito(<f-args>)
" Kobito を閉じる
 command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
" Kobito にフォーカスを移す
 command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")


"ctags {{{ :TODO Consider keymap
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-s> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" unite-tagsの設定
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif
"}}}
