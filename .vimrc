"add/ tabs as spaces, and make them 4 spaces
let mapleader = ","
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"Respect line wrapping
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

filetype plugin on
filetype indent on

"SETUP
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set laststatus=2                    "Enabling statusline at all times
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
set noshowmode                      "Don't show the mode(airline is handling this)

imap jj <Esc>                       " Use jj to leave insert mode
set cursorline                      "Highlight the line the cursor is on
set number                          "Line numbers

" Installs vim-plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
"TPOPE
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'           "Allows git commands
Plug 'tpope/vim-commentary'       "Makes commenting easier
Plug 'tpope/vim-surround'           "Allows changing of surrounding brackets, quotes, etc
Plug 'tpope/vim-repeat'           "Allows repeating commands
Plug 'lfilho/cosco.vim'           "Automatic comma and semicolon
Plug 'jiangmiao/auto-pairs'      "Automatic pairs for quotes etc
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'            "Use ctrl-p to switch files
Plug 'crusoexia/vim-monokai'
Plug 'crusoexia/vim-monokai'
Plug 'vim-syntastic/syntastic'      " C/C++ error checking

"Airine 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Autoformat
Plug 'chiel92/vim-autoformat'

"Syntax Highlight
Plug 'sheerun/vim-polyglot'

"Style
"Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'ericcurtin/CurtineIncSw.vim'

call plug#end()

"Airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"Ale
let g:airline#extensions#ale#enabled = 1

"AutoFormat
noremap <C-I> :Autoformat<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" To turn off auto-insert of comments
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

set pastetoggle=<F2>

" To insert semicolon at end of line
nnoremap <leader>; A;<ESC>
set background=dark
syntax on
"colo gruvbox

"Git Gutter
let g:gitgutter_realtime = 1
set updatetime=500
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_compiler_options = "-Wall"
let g:syntastic_cpp_checkers = ['clang_check', 'gcc', 'g++']
let g:syntastic_cpp_compiler_options = "-Wall"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

map <F5> :call CurtineIncSw()<CR>
:map <C-j> cw<C-r>0<ESC>
autocmd FileType c,cc,cpp,java,scala let b:comment_leader = '// '   "Automatic comments
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
