set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Plugins

" language packs
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'majutsushi/tagbar'

" Json helpers
Plug 'leshill/vim-json'
" Delete buffer from panel
Plug 'qpkorr/vim-bufkill'
" Surround hacks
Plug 'tpope/vim-surround'
" Plugin 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'
" Date helpers
Plug 'tpope/vim-speeddating'
" Comment helpers
Plug 'tpope/vim-commentary'
" Quick string conversiov
Plug 'tpope/vim-abolish'
" Hacks with dot
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
" Html xml helpers
Plug 'tpope/vim-ragtag'

" Fix clipboard copy
" binding: cp<action>
Plug 'christoomey/vim-system-copy'

Plug 'vim-test/vim-test'
Plug 'vim-scripts/taglist.vim'
" translation files support
Plug 'vim-scripts/po.vim--Jelenak'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'

" TestCase
" https://github.com/vim-test/vim-test#setup
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

let test#python#runner = 'pytest'


" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" JS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Additionally need to install packages:
" :CocInstall coc-pyright
" :CocInstall coc-snippets
Plug 'honza/vim-snippets'

" quick clean whitespace
Plug 'ntpeters/vim-better-whitespace'

"Syntax checking hacks for vim
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

Plug 'stephpy/vim-yaml'
Plug 'mitsuhiko/vim-jinja'
" html, js dynamic completion tool
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
" e.g. html:5_ <c-y>
Plug 'mattn/emmet-vim'
" edit multiple selection at once
Plug 'mg979/vim-visual-multi'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

command! PU PlugUpdate | PlugUpgrade

"---------------Common config------------------"


" Set the default file encoding to UTF-8:
" set encoding=utf-8
let mapleader=','
" work with system python
let g:python3_host_prog = '/Users/snoopt/.pyenv/versions/envs/vim3/bin/python'

syntax on

" Automatically indent based on file type:
filetype on
filetype indent on
filetype plugin indent on

" Keep indentation level from previous line:
set autoindent


" Folding based on indentation:
set foldmethod=indent
set foldcolumn=1
set foldlevel=1

"Terminal header from vim
set title

"Colorscheme
set t_Co=256

set background=dark
" colorscheme PaperColor

colorscheme desertEx
" set sign column
highlight SignColumn guifg=grey guibg=gray40 gui=NONE ctermfg=250 ctermbg=241 cterm=NONE

" tmux fix for background
set t_ut=

" enable status line
set laststatus=2


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
map <leader>cp :cprevious<CR>
map <leader>cn :cnext<CR>
nnoremap <leader>a :cclose<CR>
nnoremap \x :cclose<CR>
map <leader>fo :copen<CR>
map <leader>fq :ccl<CR>
map <leader>ft :cw<CR>

"preview window
map <leader>pd :pc<CR>

" buffers
map <C-]> :bn<CR>
map <C-[> :bp<CR>
map <C-\> :b#<CR>
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
nmap <leader>tw :TagbarOpen j<CR>

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
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=99

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1

"run in vmode
vnoremap <F6> :!python<CR>

" python Bindings
map <leader>pi oimport ipdb; ipdb.set_trace()<Esc>
map <leader>pI Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>pci ofrom celery.contrib import rdb;rdb.set_trace()<Esc>

map <leader>ps oimport scrapy.shell;scrapy.shell.inspect_response(response, self)<Esc>

" Pydocstring defult formatter
let g:pydocstring_formatter = 'google'
let g:pydocstring_doq_path = '~/.pyenv/shims/doq'
let g:pydocstring_templates_path = '~/.vim/config/vim-pydocstring/templates'



"---------------Html and like config--------------"

au BufRead,BufNewFile *.html,*.css,*.scss set shiftwidth=2 expandtab
"Fold html tag
nnoremap <leader>ft Vatzf


"---------------Javascript config-------------------------"

au BufNewFile,BufReadPost *.coffee,*.js,*.jade setl shiftwidth=2 softtabstop=2 expandtab textwidth=100

"---------------Po config-------------------------"
autocmd FileType po setlocal commentstring=#\~\ %s


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
au BufRead,BufNewFile *.pm,*pl set shiftwidth=4 softtabstop=4 tabstop=4 expandtab filetype=perl
map ,pt <ESC>:%! perltidy<CR>

"---------------Java config-----------------------"
au BufRead,BufNewFile *.java set shiftwidth=4 expandtab

"---------------Ruby and devops config-----------------------"
au BufRead,BufNewFile *.rb,Vagrantfile set shiftwidth=2 expandtab tabstop=2 softtabstop=2


"---------------Systools config-------------------"
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.cfg set shiftwidth=2 expandtab tabstop=2 softtabstop=2

" reading Ms-Word documents, requires antiword (not docx)
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"


"---------------Plugins config--------------------"

" python mode

" disable pymode lint, use ale
let g:pymode_lint = 0
" motion bindings
let g:pymode_motion = 1
" pep8 indent
let g:pymode_indent = 1
" use jedi doc
let g:pymode_doc = 0
" enable breakpoints leader+b
let g:pymode_breakpoint = 1
" disable custom buffer format
let g:pymode_options = 0


" Linter ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_cpp_gcc_options = '-std=c++11'
let g:ale_linters = {
\    "python": ['pylint'],
\    "cpp": ['clang', 'g++'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'gitgutter' ],
      \     [ 'filename', 'tagbar' ],
      \   ]
      \ },
      \ 'component': {
      \ 'tagbar': '%{tagbar#currenttag("[%s]", "", "")}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'gitgutter': 'LightLineGitGutter',
      \   'readonly': 'LightLineReadonly',
      \ },
      \ }

  function! LightLineReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "RO"
    else
      return ""
    endif
  endfunction

  function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
  endfunction

  function! LightLineGitGutter()
      " adds plus signs to changed lines and summary
    if ! exists('*GitGutterGetHunkSummary')
          \ || ! get(g:, 'gitgutter_enabled', 0)
          \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added,
          \ g:gitgutter_sign_modified,
          \ g:gitgutter_sign_removed
          \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
    return join(ret, ' ')
  endfunction

"fzf
nmap ; :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <C-p> :GFiles<CR>
nmap <leader>rt :Tags<CR>
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

" Coc default config

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" disable cursor https://github.com/neoclide/coc.nvim/issues/1775
let g:coc_disable_transparent_cursor = 1

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" end coc config


" Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#rename_command = '<Leader>r'
let g:jedi#usages_command = '<Leader>u'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
let g:jedi#completions_command = "<C-Space>"

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>K'
let g:jedi#auto_close_doc = 1


"Snippets
" Plugin key-mappings for coc-snippets
map <leader>snl :CocList snippets<CR>
map <leader>sne :CocCommand snippets.editSnippets<CR>
map <leader>sno :CocCommand snippets.openSnippetFiles<CR>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,htmljinja,css EmmetInstall



"---------------Bindings------------------------"

let NERDTreeIgnore = ['\.pyc$']
map <F2> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

map <F3> :TlistToggle<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Quick vimrc edit
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ec <C-w><C-v><C-l>:e ~/.config/nvim/coc-settings.json<cr>
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
map <leader>gs :Git<cr>
map <leader>gd :Gdiff<cr>
map <leader>ggs :GitGutterSignsToggle<CR>
map <leader>ggl :GitGutterLineHighlightsToggle<CR>
map <leader>ggd :GitGutterLineHighlightsDisable<CR>:GitGutterSignsDisable<CR>

" faster refresh for gitgutter
set updatetime=300

" vim comment
map \\ :Commentary<cr>
au BufRead,BufNewFile *.yml set filetype=ansible
vnoremap // y/<C-R>"<CR>

"Delete file and buffer
nnoremap <leader>dcf :call delete(expand('%')) \| bdelete!<CR>
