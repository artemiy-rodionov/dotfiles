set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Pyhon helpers
Plugin 'klen/python-mode'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-git'

" Perl
Plugin 'vim-perl/vim-perl'

" Js helpers
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'ternjs/tern_for_vim'
Plugin 'leshill/vim-json'
" Delete buffer from panel
Plugin 'qpkorr/vim-bufkill'
" Surround hacks
Plugin 'tpope/vim-surround'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
" Date helpers
Plugin 'tpope/vim-speeddating'
" Comment helpers
Plugin 'tpope/vim-commentary'
" Hacks with dot
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
" Html xml helpers
Plugin 'tpope/vim-ragtag'

Plugin 'vim-scripts/taglist.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'


if has("nvim")
  Plugin 'shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-jedi'
endif

" Snippets
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" quick clean whitespace
Plugin 'ntpeters/vim-better-whitespace'

"Syntax checking hacks for vim
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'

Plugin 'fatih/vim-go'

Plugin 'stephpy/vim-yaml'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mitsuhiko/vim-jinja'


" Haskell
" Plugin 'dag/vim2hs'
" Erlang
" Plugin 'jimenezrick/vimerl'

" Align with Tabularize
Plugin 'godlygeek/tabular'
" Markdown
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"---------------Common config------------------"


" Set the default file encoding to UTF-8:
" set encoding=utf-8
let mapleader=','
" work with system python
let g:python3_host_prog = '/usr/local/bin/python3'

syntax on

" Automatically indent based on file type:
filetype on
filetype indent on
filetype plugin indent on

" Keep indentation level from previous line:
set autoindent

" Autosave on calling make
set autowrite

" Folding based on indentation:
set foldmethod=indent
set foldcolumn=1
set foldlevel=1

"Terminal header from vim
set title

"Colorscheme
set t_Co=256
set t_ut=
colorscheme desertEx
" Highlight Group
" highlight BadWhitespace ctermbg=red guibg=red

" Ru keymap insert mode
set fileencodings=utf8,cp1251 " Возможные кодировки файлов
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

highlight lCursor guifg=NONE guibg=Cyan

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


set nonumber

"Bindings
nnoremap <leader><space> :noh<cr>

"jj == Esc
inoremap jj <ESC>

"quickfix
map <C-m> :cprevious<CR>
map <C-n> :cnext<CR>
nnoremap <leader>a :cclose<CR>
nnoremap \x :cclose<CR>
map <leader>fo :copen<CR>
map <leader>fq :ccl<CR>
map <leader>ft :cw<CR>

" buffers
map <C-]> :bn<CR>
map <C-[> :bp<CR>
" from bufkill plugin
map <C-b>d :BD<CR>
" close buffer and delete window
map <C-b>D :bd<CR>
map <leader>bD :bd<CR>
map <leader>bl :ls<CR>

" tab conf
map gn :tabnew<CR>
map gw :tabclose<CR>

nmap <F8> :TagbarToggle<CR>

" Write
nnoremap <Leader>w :w<CR>

" sudo to write
map <leader>W :w !sudo tee % >/dev/null<CR>

" trim trailing whitespace
nnoremap <F12> :StripWhitespace<CR>

"---------------Python config---------------------"


au BufRead,BufNewFile *.py,*pyw set shiftwidth=4 softtabstop=4 tabstop=4 expandtab

" Display tabs at the beginning of a line in Python mode as bad.
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1

"run in vmode
vnoremap <F6> :!python<CR>


" Bindings
map <leader>pi oimport ipdb; ipdb.set_trace()<Esc>
map <leader>pI Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>pci ofrom celery.contrib import rdb;rdb.set_trace()<Esc>

map <leader>ps oimport scrapy.shell;scrapy.shell.inspect_response(response, self)<Esc>


"---------------Html and like config--------------"

au BufRead,BufNewFile *.html,*.css,*.scss set shiftwidth=2 expandtab
"Fold html tag
nnoremap <leader>ft Vatzf


"---------------Javascript config-------------------------"

au BufNewFile,BufReadPost *.coffee,*.js,*.jade setl shiftwidth=4 softtabstop=4 expandtab textwidth=100


"---------------Haskell config-------------------------"
au BufRead,BufNewFile *.hs set filetype=haskell tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftround
"---------------Go config-------------------------"
au BufRead,BufNewFile *.go set filetype=go

au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap <leader>vw <Plug>(go-vet -w)

autocmd FileType go nmap <Leader>gi <Plug>(go-info)


let g:go_list_type = "quickfix"
" let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1


"---------------Perl config-----------------------"
au BufRead,BufNewFile *.pm,*pl set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
map ,pt <ESC>:%! perltidy<CR>

"---------------Java config-----------------------"
au BufRead,BufNewFile *.java set shiftwidth=4 expandtab

"---------------Ruby and devops config-----------------------"
au BufRead,BufNewFile *.rb,Vagrantfile set shiftwidth=2 expandtab tabstop=2 softtabstop=2


"---------------Systools config-------------------"
au BufRead,BufNewFile Makefile* set noexpandtab

" reading Ms-Word documents, requires antiword (not docx)
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"


"---------------Plugins config--------------------"

set laststatus=2

"Plugins
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <C-p> :GFiles<CR>
nmap <Leader>r :Tags<CR>
nmap <M-k>    :Ack! "\b<cword>\b" <CR>
nmap <Esc>k   :Ack! "\b<cword>\b" <CR>
nmap <M-S-k>  :Ggrep! "\b<cword>\b" <CR>
nmap <Esc>K   :Ggrep! "\b<cword>\b" <CR>

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


"Python mode options
let g:pymode = 1
let g:pymode_motion = 1
let g:pymode_python = 'python3'
" remove automatic line numbers and put everything else back
let g:pymode_options = 0
setlocal complete+=t
setlocal formatoptions-=t
setlocal nowrap
setlocal textwidth=79
setlocal commentstring=#%s
setlocal define=^\s*\\(def\\\\|class\\)
" Disable pylint checking every save
let g:pymode_lint_write = 0
let g:pymode_syntax = 0
"
" " Set key 'R' for run python code
let g:pymode_run_key = 'R'
let g:pymode_indent = 1


"Snippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" close preview window
autocmd CompleteDone * pclose!


"---------------Bindings------------------------"

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
map <F3> :TlistToggle<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Quick vimrc edit
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

nnoremap <leader>bi :PluginInstall<cr>
nnoremap <leader>bc :PluginClean<cr>

"Prettify
map <leader>pjs :%!python -m json.tool<CR>



" gettext jinja bind
"
map <leader>st ysit'ysit)i_<ESC>ysit{ysit}
map <leader>sq ysi"'ysi")i_<ESC>ysi"{ysi"}
map <leader>sW ys2e'ysa')ysa({ysa{}3li_<ESC>
map <leader>sw ysw'ysa')ysa({ysa{}3li_<ESC>

" git
map <leader>gs :Gstatus<cr>
map <leader>gd :Gdiff<cr>
let g:fugitive_github_domains = ['https://git.1check.in']
let g:fugitive_gitlab_engine = '1'

" vim comment
map \\ :Commentary<cr>
au BufRead,BufNewFile *.yml set filetype=ansible
