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
set directory=$HOME/.vim/backup
    
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


