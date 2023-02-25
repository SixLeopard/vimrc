"--------------------------------------------------------------------           
"  Plugins (use :PlugInstall to install plugins) 
"--------------------------------------------------------------------
"
"Install Vim-Plug if it isnt already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" Make sure you use single quotes

Plug 'preservim/nerdtree'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe' "has a lot of dependencies may need to be removed for some installations
Plug 'voldikss/vim-floaterm'

"Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

"--------------------------------------------------------------------           
"   HIGHLIGHTING AND SYNTAX                                                     
"--------------------------------------------------------------------           
set background=dark             " Use a dark background by default              
syntax on                       " Enable syntax highlighting                    
set t_Co=256                    " Allow vim to display all colours              
set showmatch                   " Highlight matching parentheses                
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight                                                                                
"--------------------------------------------------------------------           
"   INDENTATION                                                                 
"--------------------------------------------------------------------           
set tabstop=4                   " Set the number of visual spaces per tab       
set softtabstop=4               " Set the number of spaces a tab counts as     
set expandtab                   " Write tabs as spaces                         
set autoindent                  " Turn on auto-indentation                      
set shiftwidth=4                " Set the number of columns to indent with reindent operations
filetype indent on              " Allow loading of language specific indentation
                                                                                
"--------------------------------------------------------------------           
"   COLOUR COLUMN                                                               
"--------------------------------------------------------------------           
"set colorcolumn=80              " Create a column at the 80 character line      
highlight ColorColumn ctermbg=8 guibg=lightgrey                                 
                                                                                
"--------------------------------------------------------------------           
"   MISCELLANEOUS                                                               
"--------------------------------------------------------------------           
set number                      " Show line numbers                             
set wildmenu                    " Turn on the autocomplete menu                 
set mouse=a                     " Enable mouse support                         
set ruler                       " Display the ruler in the bottom right corner  
"set cursorline                  " Highlight the current line                    
set backspace=indent,eol,start  " Allow backspace to work across lines

"--------------------------------------------------------------------           
"   Nerd Tree config (:NERDTree to open)                                                               
"--------------------------------------------------------------------
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * NERDTree | wincmd p
