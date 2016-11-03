set backspace=2
"set hidden " allow buffers to be open in background
set number " turn line numbers on
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






"=====================================
" Enhanced keyboard mappings
"=====================================


" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
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



"=================================================
"

"============================
"AutoPairs Configuration
"============================
"let g:AutoPairsFlyMode = 0 "Activate fly mode
let g:AutoPairsUseInsertedCount = 1 "gentle AutoPairs
"=============================
"
  

"=========================
"NERD tree Configuration
"=========================
set modifiable
let g:NERDTreeWinSize=22 "Change size of window
let g:NERDTreeWinPos = "left" "Open NERDTree on left
let g:nerdtree_tabs_open_on_console_startup=1
autocmd StdinReadPre * let s:std_in=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close Vim when only window left is NERDTree"

"NERDTrees File highlighting
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

"synchronize current tab / path
autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
"=====================

"=======================
"taglist Configuration
"=======================
let Tlist_Use_Right_Window   = 1
let Tlist_WinWidth = 22 "Change size of window
let Tlist_Show_One_File = 1
"let Tlist_Process_File_Always = 0
"let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Compact_Format = 1
"=======================



"==========================
"Vim.fugitive Configuration
"==========================
set diffopt+=vertical
"===========================




"============================
"MiniBufExplorer Configuration
"============================
"map <C-PageDown> :bn<cr>
"map <C-PageUp> :bp<cr>
"map gd :bd<cr>
"===============================

"===========================
"clang-complete configuration
"==========================
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"
" " Complete options (disable preview scratch window, longest removed to aways
" " show menu)
set completeopt="=menu,menuone
"
" " Limit popup menu height
set pumheight=20
"
"" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'"
" "

"=========================
"Package installation
"========================
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'

" Plugin ack
"Plugin 'mileszs/ack.vim'

"=============================
"Plugin navigation
"=============================
Plugin 'L9' "Required for FuzzyFinder

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'minibufexpl.vim' "elegant buffer manager
"Plugin 'LustyJuggler' "Enhanced buffer manager

"Plugin 'wesleyche/Trinity' "manages NERDTree, Source Explorer and Ctags
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'kshenoy/vim-signature' "highlight marks

"Plugin 'mbadran/headlights' "need to compile vim with python 2.6++

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
"Plugin 'OmniCppComplete'
"Plugin 'AutoComplPop'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator' "generate automatically .ycm_extra_conf.py
"Plugin 'justmao945/vim-clang'
Plugin 'Rip-Rip/clang_complete'

Plugin 'jiangmiao/auto-pairs' "Plugin Automatic Pairs (e.g. brackets)

Plugin 'AutoAlign'

"Plugin 'scrooloose/syntastic' "Plugin Syntastic

"Plugin 'snipMate' "complete for loop (for example)
Plugin 'sirver/ultisnips'

Plugin 'SuperTab'

"Plugin 'taglist.vim'




"""""""""""Yank issues
Plugin 'maxbrunsfeld/vim-yankstack' "keep previous yank in memory

"""""""""""Sublime's multiple selection
Plugin 'terryma/vim-multiple-cursors'

"===================================

"=======================
"Programming specifics
"======================
"""""""Conque: execute file from Vim
"Plugin 'Conque-Shell'

""""""Debugging 
"Plugin 'lekv/vim-clewn'
"Plugin 'vimgdb'

"Plugin 'Conque-GDB'
""""""

"""""""Git
Plugin 'tpope/vim-fugitive'
"========================


"Don't remember what that does
"Plugin 'DoxygenToolkit.vim'


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
