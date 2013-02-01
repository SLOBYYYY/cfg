filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"folding settings --> 'za' opens and closes folds
set foldmethod=indent
set foldlevel=99


"tabulation settings
set tabstop=4
set shiftwidth=4

"indentation helper
set smartindent
set autoindent

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

"reset JSLint syntax highlighting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red

"show matching brackets
set showmatch

"show helping information in the last line of the screen(like selected lines count)
set showcmd

"show INSERT, REPLACE or VISUAL in the last line if one of them is actual
set showmode

"search is only case sensitive if at least one upper case character is used"
"otherwise it is case insensitive
	"ignore case of characters when searching
	set ignorecase
	"overrides ignorecase if searching pattern contains at least one uppercase character
	set smartcase
	"highlights previously searched patterns in the visible area
	set hlsearch

set wildmode=longest,list

"display line numbers
set number

"css list of commands with ctrl+o and ctrl+x
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"set filetype detection on by extension and content
"set filetype

"remove these commands 
"set paste
"filetype indent on
"set nowrap
"set showtabline=2

"plugins will be executed from .vim/plugins folder
filetype plugin on

"remap 'jump to function definition' command to F3
map <F3> <C-]>
"remap TAB to change between tabs
map <C-TAB> gt
"remap Shift-TAB to change between panes
map <S-TAB> <C-w><C-w>
"remap that when a '{' is placed and enter is pressed immediately, it will
"also place a '}'
inoremap {<CR> {<CR>}<Esc>O

"color settings
hi Comment ctermfg=Lightblue
"nerdtree shortcut
cnoremap NT NERDTree 

"jquery plugin activator
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"autocomplete improvement
set completeopt=longest,menuone

"vim-phpqa uses the following settings:
"-------------------------------------
"messdetector requires a ruleset
let g:phpqa_messdetector_ruleset = "~/.vim/config/phpmd.xml"

"codesniffers standard setting
let g:phpqa_codesniffer_args = "--report=csv --standard=PSR2"

let g:phpqa_codesniffer_autorun = 0
"-----END OF VIM-PHPQA settings------
