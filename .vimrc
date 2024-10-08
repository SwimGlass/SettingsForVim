syntax enable
syntax on
set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>


" Auto-adjust smart indent for different languages
filetype indent on
" Expand tabs to spaces
set expandtab
" Set the number of spaces for tabstop while editing
set tabstop=4
" Set the number of spaces for shiftwidth during formatting
set shiftwidth=4
" Make Vim treat consecutive spaces as one tab
set softtabstop=4



" Color scheme
set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd


" Always display the status bar
set laststatus=2
" Show the cursor's current position
set ruler
" Enable line number display
set number
" Highlight the current line/column
set cursorline
"set cursorcolumn
" Highlight search results
set hlsearch

"""""""
"Vundle
"""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" ack for ctr + shift + f
Plugin 'mileszs/ack.vim'

" NERDTree
Plugin 'preservim/nerdtree'

" taglist
Plugin 'taglist.vim'

" color scheme from  https://github.com/morhetz/gruvbox/wiki/Installation
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
set mouse=r                  " Enable mouse reporting functionality
let g:NERDTreeMouseMode=3    " Optional: Single-click to open folders/files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\\ --nogroup\\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd ='ctags'
let Tlist_Show_One_File=1 "Do not display the tags of multiple files at the same time, only display the tags of the current file
let Tlist_WinWidt=15 "Set the width of taglist
let Tlist_Exit_OnlyWindow=1 "If the taglist window is the last window, exit vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Process_File_Always=1 "Taglist always parses the tags in the file, regardless of whether the taglist window is opened or not.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ack Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * ++nested colorscheme gruvbox

if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color GNU screen.
      set t_ut=
endif
