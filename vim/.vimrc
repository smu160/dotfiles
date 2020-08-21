let g:startify_bookmarks = ['~/.bash_profile', '~/.vimrc', '~/.bashrc', '~/.tmux.conf']

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]

" Sets how many lines of history VIM has to remember
set history=1000

" Tabstop converts tabs to spaces
" set tabstop=4

" Be smart when using tabs
" Auto indents based on indentation level.
set smarttab

" Line numbers
set number

set background=dark

" Enable syntax highlighting
syntax on

let g:airline_theme='deus'

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"Always show current position
set ruler

" Add a bit extra margin to the left
set foldcolumn=0

" Height of the command bar
set cmdheight=1

" Old powerline
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

" Always show the status line.
set laststatus=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" vim-go settings
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" ***************** File specific tabbing scheme *********************
autocmd Filetype c,h setlocal ts=4 sw=4 cindent
autocmd Filetype cpp,hpp,cxx setlocal ts=4 sw=4 expandtab
autocmd Filetype go,python setlocal ts=4 sw=4 expandtab
autocmd Filetype html,javascript setlocal ts=2 sw=2 expandtab
autocmd FileType sh setlocal autoindent tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" My settings when editing *.txt files
"   - automatically indent lines according to previous lines
"   - replace tab with 8 spaces
"   - when I hit tab key, move 2 spaces instead of 8
"   - wrap text if I go longer than 76 columns
"   - check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76 spell spelllang=en_us

" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Always replace tab with 8 spaces, except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" ********************************************************************


" Start scrolling n lines before horizontal border of window.
set scrolloff=5

" Set column guide to 80 + 1 for the bar itself.
if exists('+colorcolumn')
  set colorcolumn=81
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" When coding, auto-indent by 4 spaces, just like in K&R
" Note that this does NOT change tab into 4 spaces
" You can do that with "set tabstop=4", which is a BAD idea
set shiftwidth=4


" Prepend ~/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
" You need to do "mkdir ~/.backup" for this to work.
set backupdir^=~/.backup

" Also use ~/.backup for swap files. The trailing // tells Vim to incorporate
" full path into swap file names.
set dir^=~/.backup//

" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase


" Download plug.vim and put it in the 'autoload' directory
" The following just automates the process
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugin for linting (syntax checking and semantic errors)
Plug 'w0rp/ale'

" Shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

Plug 'mhinz/vim-startify'

" Templates for common filetypes
Plug 'noahfrederick/vim-skeleton'

" Status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go development plugin for Vim and corresponding colorscheme
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" vim plugin for editing LaTeX files
Plug 'lervag/vimtex'

Plug 'majutsushi/tagbar'

" Initialize plugin system
call plug#end()


" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set termguicolors
colorscheme seattle
hi Normal guibg=NONE ctermbg=NONE

"******* Git Gutter settings *******
set updatetime=250

let g:gitgutter_max_signs = 500

" No mapping
let g:gitgutter_map_keys = 0

" Colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=darkred

" Fixes error:
" vimtex: g:tex_flavor not specified
"         Please read :help vimtex-tex-flavor!
let g:tex_flavor = "latex"

let g:vimtex_quickfix_mode=0
let g:vimtex_syntax_enabled = 1

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
