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


" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

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
"----------------------------------------------------------------------------------
" My Config
set nocompatible
filetype plugin indent on

" Folding based on indentation: 
set foldmethod=indent
set foldcolumn=1
"Numeration is relative
set nu
set relativenumber
set ruler
"Colorscheme
set t_Co=256
set background=dark
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
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"Backspace
set backspace=indent,eol,start 
"Map vcs
nmap <Leader>va <Plug>VCSAdd 
nmap <Leader>vn <Plug>VCSAnnotate 
nmap <Leader>vc <Plug>VCSCommit 
nmap <Leader>vd <Plug>VCSDiff 
nmap <Leader>vg <Plug>VCSGotoOriginal 
nmap <Leader>vG <Plug>VCSGotoOriginal! 
nmap <Leader>vl <Plug>VCSLog 
nmap <Leader>vL <Plug>VCSLock 
nmap <Leader>vr <Plug>VCSReview 
nmap <Leader>vs <Plug>VCSStatus 
nmap <Leader>vu <Plug>VCSUpdate 
nmap <Leader>vU <Plug>VCSUnlock 
nmap <Leader>vv <Plug>VCSVimDiff
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
"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}
"Control mpd
if has('python')
    py import os, sys
    py sys.path.append(os.path.expanduser("/home/snoopt/soft/vimmp"))
    pyf /home/snoopt/soft/vimmp/main.py
endif
let g:mpd_music_directory="~/Музыка"
let g:mpd_playlist_directory="~/.mpd/playlists"
let g:vimmp_server_type = "mpd"
nmap <silent> <leader>mp :py vimmp_toggle()<cr>
let g:pydiction_location='/home/snoopt/.vim/ftplugin/pydiction/complete-dict'
