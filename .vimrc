"PATHOGEN INITIALIZATION
"=======================
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"GENERAL SETTINGS
"================
"set or create swap directory
if !isdirectory(expand("~/.vim/swapfiles"))
	if(exists("*mkdir"))
		call mkdir(expand("~/.vim/swapfiles"), "p")
	else
		silent !mkdir -p ~/.vim/swapfiles
	endif
endif
set dir=~/.vim/swapfiles
set term=xterm-256color

"if possible, use syntax highlighting
if has("syntax")
	syntax on
endif

"statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"tabulation settings
set tabstop=4
set shiftwidth=4
"indentation helper
set smartindent
set autoindent
set copyindent "copy the previous indentation on autoindenting
"folding settings --> 'za' opens and closes folds
set foldmethod=indent
set foldlevel=99
"show matching brackets
set showmatch
"show helping information in the last line of the screen(like selected lines count)
set showcmd
"show INSERT, REPLACE or VISUAL in the last line if one of them is actual
set showmode
"ignore case of characters when searching
set ignorecase
"overrides ignorecase if searching pattern contains at least one uppercase character
set smartcase
set hlsearch "highlights previously searched patterns in the visible area
set wildmode=longest:list "setting for autocompletion
set number "display line numbers
set nobackup "no backup file is created
set noswapfile "no swap file is created
set nowritebackup

"css list of commands with ctrl+o and ctrl+x
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocomplete improvement
set completeopt=longest,menuone,preview
"color settings
hi Comment ctermfg=Lightblue

"jquery plugin activator
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au FileType python set omnifunc=pythoncomplete#Complete

"this closes the preview window automatically after autocomplete is closed
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"KEY MAPPINGS
"============
let mapleader = ","
"remap 'jump to function definition' command to F3
map <F3> <C-]>
"remap TAB to change between tabs
map <C-TAB> gt
"remap that when a '{' is placed and enter is pressed immediately, it will
"also place a '}'
inoremap {<CR> {<CR>}<Esc>O
"nerdtree shortcut
nnoremap <Leader>nt :NERDTree<CR>
"split panel movement remapping
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
"tabulate selected blocks
vnoremap < <gv
vnoremap > >gv
"leader-w saves file
nnoremap <Leader>w :w<CR> 
nnoremap <Leader>q :q<CR> 

"plugins will be executed from .vim/plugins folder
filetype plugin indent on

"PLUGIN SPECIFIC SETTINGS
"========================

"jslint
"------
"reset JSLint syntax highlighting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red

"supertab
"--------
let g:SuperTabDefaultCompletionType = "<c-p>" "tab will use the specified completion type
let g:SuperTabLongestHighlight = 1 "automatically select the first entry in the list
let g:SuperTabClosePreviewOnPopupClose = 1

"ctrlP
"-----
let g:ctrlp_map = '<Leader>r'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|mp3)$',
	\}

"PYTHON-MODE
"===========
"pylint
"------
"set code checkers
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

"skip errors and warnings
let g:pymode_lint_ignore = "W191"

"open window on errors
let g:pymode_lint_cwindow = 0
