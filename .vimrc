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
"highlights previously searched patterns in the visible area
set hlsearch
"setting for autocompletion
set wildmode=longest,list
"display line numbers
set number
"css list of commands with ctrl+o and ctrl+x
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocomplete improvement
set completeopt=longest,menuone
"color settings
hi Comment ctermfg=Lightblue
"plugins will be executed from .vim/plugins folder
filetype plugin on


"KEY MAPPINGS
"============
"remap 'jump to function definition' command to F3
map <F3> <C-]>
"remap TAB to change between tabs
map <C-TAB> gt
"remap Shift-TAB to change between panes
map <S-TAB> <C-w><C-w>
"remap that when a '{' is placed and enter is pressed immediately, it will
"also place a '}'
inoremap {<CR> {<CR>}<Esc>O
"nerdtree shortcut
cnoremap nt NERDTree 


"jquery plugin activator
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


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
