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
"pydoc displaying document
map <Leader>ii <Leader>pw
"split panel movement remapping
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
"tabulate selected blocks
vnoremap < <gv
vnoremap > >gv
"ctrl-s saves file
nnoremap <Leader>w :w<CR> 
nnoremap <Leader>q :q<CR> 

"jquery plugin activator
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au FileType python set omnifunc=pythoncomplete#Complete

"plugins will be executed from .vim/plugins folder
filetype plugin indent on

"PLUGIN SPECIFIC SETTINGS
"========================

"vim-phpqa 
"---------
"messdetector requires a ruleset
let g:phpqa_messdetector_ruleset = "~/.vim/config/phpmd.xml"
"codesniffers standard setting
let g:phpqa_codesniffer_args = "--report=csv --standard=PSR2"
let g:phpqa_codesniffer_autorun = 0

"jslint
"------
"reset JSLint syntax highlighting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red

"synstastic
"----------
let g:syntastic_python_checker="flake8"
"not working currently 
"let g:syntastic_python_checker_args="--ignore=W191"

"supertab
"--------
let g:SuperTabDefaultCompletionType = "<c-p>" "tab will use the specified completion type
let g:SuperTabLongestHighlight = 1 "automatically select the first entry in the list
let g:SuperTabClosePreviewOnPopupClose = 1

"ctrlP
"-----
let g:ctrlp_map = '<Leader>g'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|mp3)$',
	\}
