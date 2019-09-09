set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set formatoptions+=o        " Continue comment marker in new lines.
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set splitbelow              " Horizontal split below current.
set splitright              " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3         " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5     " Show next 5 columns while side-scrolling.
endif
set nostartofline           " Do not jump to first character with page commands.


" Searching

set smartcase               " ... unless the query has capital letters.
set gdefault                " Use 'g' flag by default with :s/foo/bar/.

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

let g:mapleader = "\<SPACE>"

" -------------- Functions ----------------------
" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" -------------- Key Maps -----------------------

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" --- Shortcuts ----
nnoremap ; :    " Use ; for commands.
nnoremap Q @q   " Use Q to execute default register.

" --------------- Plugins -----------------------

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" plugin section

Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" coc-tsserver replaces this
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'Yggdroot/indentLine'
" Themes
Plug 'ayu-theme/ayu-vim' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'

" Async linting instead of coc-tslint
Plug 'dense-analysis/ale'
" Coc Extensions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Icons always last
Plug 'ryanoasis/vim-devicons'

" end vim-plug
call plug#end()

" ----- COC
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Slpits movement
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>ws :sp <CR>
nnoremap <leader>wv :vs <CR>


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


" Themes
set termguicolors     " enable true colors support
" for Firewatch colorcheme
" set background=dark
" let g:two_firewatch_italics=1
" colo two-firewatch
" For Gruvbox colorscheme
" let g:gruvbox_italic = '1'
" colorscheme gruvbox
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

" let g:lightline = { 'colorscheme': 'ayu' }
" error sign gutter always open
let g:ale_sign_column_always = 1
set signcolumn=yes

" ----------- on Init ----------
call NumberToggle()

" disables annoying indent in favor of default
" let g:typescript_indent_disable = 1
