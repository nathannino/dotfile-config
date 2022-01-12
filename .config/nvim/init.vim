" Pretty much stolen from https://dev.to/elvessousa/my-basic-neovim-setup-253l
" The idea is to start modifying it to my liking later down the line

call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'

    " Color scheme
    Plug 'morhetz/gruvbox'
call plug#end()

" Plugin configs
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" File browser
let NERDTreeShowHidden=1

" Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Syntax
filetype plugin indent on
syntax on

" Options
set background=dark
set completeopt=noinsert,menuone,noselect
set wildmenu
set hidden
set title
set mouse=a
set nowrap
set clipboard=unnamedplus
