au BufRead,BufNewFile *.html set shiftwidth=4
au BufRead,BufNewFile *.html set expandtab

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: 79 
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


" Set the default file encoding to UTF-8: 
set encoding=utf-8

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Automatically indent based on file type: 
filetype indent on
" Keep indentation level from previous line: 
set autoindent
"------------------------------------------------------------------------------
" My Config
set nocompatible
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'fs111/pydoc.vim'
 Bundle 'vim-scripts/pep8'
 Bundle 'reinh/vim-makegreen'
 Bundle 'vim-scripts/TaskList.vim'
 Bundle 'sontek/rope-vim'
 Bundle 'ervandew/supertab'
 Bundle 'msanders/snipmate.vim'
 Bundle 'tpope/vim-surround'
 Bundle 'tpope/vim-git'
 Bundle 'sontek/minibufexpl.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'tpope/vim-speeddating'
 Bundle 'tpope/vim-commentary'
 Bundle 'tpope/vim-repeat'
 Bundle 'tpope/vim-unimpaired'
 Bundle 'tpope/vim-ragtag'
 Bundle 'sophacles/vim-bundle-python'
 Bundle 'vim-scripts/taglist.vim'
 Bundle 'scrooloose/syntastic'
 Bundle 'digitaltoad/vim-jade'
 Bundle 'othree/xml.vim'

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
syntax on

" Folding based on indentation: 
set foldmethod=indent
set foldcolumn=1
set foldlevel=1

"Numeration is relative
set nu
set relativenumber
set ruler

"Terminal header from vim
set title

"Colorscheme
set t_Co=256
colorscheme desertEx

let mapleader=','
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
" Фикс с переключение русским языком
" Почему то не меняется цвет курсора
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Tab conf
map gn :tabnew<CR>
map gw :tabclose<CR>

"Fn map
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
nmap <silent> <F4> <Plug>ToggleProject
nnoremap <silent> <F7> :TaskList<CR>

"jj == Esc
inoremap jj <ESC>

"Fold html tag
nnoremap <leader>ft Vatzf
"Quick vimrc edit
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Backspace
set backspace=indent,eol,start 

"Backup files
set nobackup
set noswapfile
set undofile

"Mouse and cursor
set novisualbell "no blink
set mousehide "hide mouse cursor while type
set mouse=a "enable mouse
set hidden
au FocusLost * :wa "Save on lostfocus

"Search
set ignorecase
set showcmd
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

"i don`t use ;
nnoremap ; :

"Tasklist mapping
map <leader>td <Plug>TaskList

"Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0

"Minibuf config
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"Js rules
au BufNewFile,BufReadPost *.coffee,*.js,*.jade setl shiftwidth=2 softtabstop=2 expandtab

"Python stuff
"run in vmode
vnoremap <F6> :!python<CR> 
" reading Ms-Word documents, requires antiword (not docx)
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"
