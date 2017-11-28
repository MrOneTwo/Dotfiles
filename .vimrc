"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Michal Ciesielski Vimrc configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

Plug 'airblade/vim-gitgutter'
Plug 'sjl/badwolf'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': '/.install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'

Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'


Plug 'SirVer/ultisnips' " Track the engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:

call plug#end()


" ---------------------------- SNIPPETS
"  

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-s>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ----------------------------

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" ---------------------------- FINDING FILES
"  
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=3  " open in new tab
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Configuration section
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow keys
let g:elite_mode=1

" Show commands in right bot corner
set showcmd

set t_Co=256
" colors zenburn
" colors goodwolf
colors badwolf

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set number
set cursorline
set showmatch

set incsearch
set hlsearch

set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" backspace over everything in insert mode
set backspace=indent,eol,start

" auto indentation
set cino+=(0


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" My key rebinds
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" let mapleader=","
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> + :exe "vertical resize +1"<CR>
nnoremap <silent> - :exe "vertical resize -1"<CR>

map <C-m> :TagbarOpenAutoClose<CR>
" map <C-S-m> :TagbarToggle<CR>

map <leader>o :Files<CR>
map <leader>b :Buffers<CR>
map <leader>l :Lines<CR>

map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>


"
" Syntastic error window toggle
"
" function! ToggleErrors()
    " let old_last_winnr = winnr('$')
    " lclose
    " if old_last_winnr == winnr('$')
        " " Nothing was closed, open syntastic error location panel
        " Errors
    " endif
" endfunction

" nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" My snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType javascript,php,c map <leader>ccb
    \ I//            <Esc>A //<Esc>yyp0ellv$hhhhr-yykPjj
autocmd FileType javascript,php,c map <leader>ccl
    \ I// -<Esc>vy32pa <Esc>l
autocmd FileType ledger map <leader>d
    \ :r! date "+\%Y/\%m/\%d"<CR>
autocmd FileType ledger map <leader>Fh
    \ :r! date "+\%Y/\%m/\%d"<CR>
    \ o    Assets:PLN                                       -0.00 PLN<CR>
    \    Expenses:Food:Home                                0.00 PLN<Esc>

" those snippets require that ledger file has line in it:
" /* vim: set filetype=ledger : */
autocmd FileType ledger map <leader>fh
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:Food:Home                                <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * Food for home<Esc>jjj
autocmd FileType ledger map <leader>fw
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:Food:Work                                <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * Food at work<Esc>jjj
autocmd FileType ledger map <leader>ztm
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:ZTM                                      <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * ZTM<Esc>jjj


"""""""""""""""""""""""""""""""""""""""""""""""""""
""" GDSCRIPT
"""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax improvement for Godot Engine
" not sure it works
let g:tagbar_type_gdscript = {
            \'ctagstype' :'gdscript',
            \'kinds':[
            \'c:constants',
            \'e:exports',
            \'o:onready',
            \'p:preloads',
            \'s:signals',
            \'f:functions',
            \]
            \}
" tab indentation
autocmd BufRead,BufNewFile   *.gd set noexpandtab
autocmd BufRead,BufNewFile   *.gd set copyindent
autocmd BufRead,BufNewFile   *.gd set preserveindent
autocmd BufRead,BufNewFile   *.gd set softtabstop=0
autocmd BufRead,BufNewFile   *.gd set shiftwidth=4
autocmd BufRead,BufNewFile   *.gd set tabstop=4


" calculator function for lines (selected in visual mode) like:
" 2 + 2 = 
vnoremap ;bc "ey:call CalcBC()<CR>
function! CalcBC()
  let has_equal = 0
  " remove newlines and trailing spaces
  let @e = substitute (@e, "\n", "", "g")
  let @e = substitute (@e, '\s*$', "", "g")
  " if we end with an equal, strip, and remember for output
  if @e =~ "=$"
    let @e = substitute (@e, '=$', "", "")
    let has_equal = 1
  endif
  " sub common func names for bc equivalent
  let @e = substitute (@e, '\csin\s*(', "s (", "")
  let @e = substitute (@e, '\ccos\s*(', "c (", "")
  let @e = substitute (@e, '\catan\s*(', "a (", "")
  let @e = substitute (@e, "\cln\s*(", "l (", "")
  " escape chars for shell
  let @e = escape (@e, '*()')
  " run bc, strip newline
  let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
  " append answer or echo
  if has_equal == 1
    normal `>
    exec "normal a" . answer
  else
    echo "answer = " . answer
  endif
endfunction

