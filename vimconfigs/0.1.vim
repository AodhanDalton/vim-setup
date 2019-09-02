" Author: Aodhan Dalton

""""""""""""""""""""""""""""""
"   General
""""""""""""""""""""""""""""""
set history=100

filetype plugin on 
filetype indent on

set autoread

" :W saves the file
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""
"   Interface
""""""""""""""""""""""""""""
let $LANG='en'

"turn on the wild menu
set wildmenu

" Ignore comiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set ruler

set cmdheight=2

" buffer becomes hidden when it is abondoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results & dont redraw while executing macros
set hlsearch
set lazyredraw

set showmatch
set mat=2

" Turn off sounds for errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""""""""""""""
"   Colors and fonts
""""""""""""""""""""""""
syntax enable
if $COLORTERM == 'gnome-terminal'
set t_Co=256
endif
try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""
" Moving around vim
""""""""""""""""""""""""""""
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""
"ALoways show the status line
set laststatus=2

""""""""""""""""""""""""""
" Editing mappings
""""""""""""""""""""""""""
" remap VIM 0 to first non-blank character
map 0 ^
" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun