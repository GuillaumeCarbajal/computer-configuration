set backspace=2
" turn line numbers on
set number
set nocompatible              " be iMproved, required
filetype on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
syntax on
"solarized options 
colorscheme gruvbox 
set background=dark
"VIM Configuration File
"" Description: Optimized for C/C++ development, but useful also for other
"things.
""Author: Gerhard Gappmeier
"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=2     " indent also with 2  spaces
set expandtab        " expand tabs to spaces
set cino+=(0         " indent all function variables (for C++)
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on
"http://vim.wikia.com/wiki/C++_code_completion
set nocp
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"" Pop up menu completion
set completeopt=menuone,menu,longest,preview
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
""" highlight popup menu completion
highlight Pmenu ctermbg=238 gui=bold
""" SuperTab: press Tab to complete
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCompletionContexts(default value: ['s:ContextText'])

"Plugin AutoPairs
let g:AutoPairsFlyMode = 0 "Activate fly mode


" Install DoxygenToolkit from
"http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" Cscope (function matching)
"if has('cscope')
"  set cscopetag cscopeverbose
"
"  if has('quickfix')
"    set cscopequickfix=s-,c-,d-,i-,t-,e-
"  endif
"
"  cnoreabbrev csa cs add
"  cnoreabbrev csf cs find
"  cnoreabbrev csk cs kill
"  cnoreabbrev csr cs reset
"  cnoreabbrev css cs show
"  cnoreabbrev csh cs help
"
"  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif

"""autocomplete with tab
""function! Tab_Or_Complete()
""  if col('.')>1 && strpart( getline('.'), col('.')-2, 3  ) =~ '^\w'
""    return "\<C-N>"
""  else
""    return "\<Tab>"
""  endif
""endfunction
"":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"":set dictionary="/usr/dict/words"

"=========================
"NERD tree Configuration
"=========================
set modifiable
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "Open NERDTree automatically"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close Vim when only window left is NERDTree"
"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg.' guifg='. a:guifg
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cc', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('h', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"Start NERDTree
"=====================

"==========================
"Vim.fugitive Configuration
"==========================
set diffopt+=vertical
"===========================





"=========================
"Package installation
"========================
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ggreer/the_silver_searcher'
"Plugin 'rking/ag.vim'

" Plugin ack
Plugin 'mileszs/ack.vim'

"=============================
"Plugin navigation
"=============================
Plugin 'FuzzyFinder'
Plugin 'L9' "Required for FuzzyFinder
Plugin 'SrcExpl' "Plugin reference, function, variable defintions

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"================================
"Syntax
"===============================
"""""""""""Colors
"Plugin 'flazz/vim-colorschemes'
"Plugin 'altercation/solarized'
"Plugin 'desert.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'dracula/vim'
Plugin 'justinmk/vim-syntax-extra'


"""""""""""Completion
Plugin 'OmniCppComplete'
"Plugin 'Valloric/YouCompleteMe'

"Plugin Automatic Pairs (e.g. brackets)
Plugin 'jiangmiao/auto-pairs'

"Plugin AutoAlign
Plugin 'AutoAlign'

"Plugin Syntastic
"Plugin 'scrooloose/syntastic'

"Plugin snipMate  --> complete for loop
"Plugin 'snipMate'

"Plugin taglist
Plugin 'taglist.vim'

"Plugin SuperTab
"Plugin 'SuperTab'

"Plugin AutoCompIPop
Plugin 'AutoComplPop'
"===================================

"=======================
"Programming specifics
"======================
""""""Debugging 
"Plugin Clewn
"Plugin 'lekv/vim-clewn'

"Plugin vimgdb
"Plugin 'vimgdb'

"Plugin Conque gdb
Plugin 'Conque-GDB'
""""""

"""""""Git
"Plugin vim.fugitive
Plugin 'tpope/vim-fugitive'
"========================



"Plugin DoxygenToolkit
Plugin 'DoxygenToolkit.vim'


"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
