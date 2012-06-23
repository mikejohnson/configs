""""""""""""""""""""""""""""""""
" Customized .vimrc
"
" Sources:
" http://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""

"""""""""""
" General "
"""""""""""
set history=700 " Set history buffer "

set encoding=utf8

" Don't let files override my settings
iab VIMM <C-R>="// vim:ts=4:sw=4:et:tw=100:fdm=marker:"


""""""""""""""""""
" User Interface "
""""""""""""""""""

set t_Co=256 " Show 256 colors "

syntax enable
set background=dark
" this line enables degraded solarized theme
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme 256_custom " Set colorscheme "

set number " Show line numbers "

set scrolljump=5 " Cursor jump for vertical scrolling "

set scrolloff=3 " Cursor width for vertical scrolling "

set wildmenu " Turn on WiLd menu "

set ruler " Always show ruler "

set cmdheight=2 " The command bar height "

set showtabline=2 " The tab bar height "

set ignorecase " Ignore case when searching "
set smartcase

set hlsearch " Highlight search terms "
set incsearch " Makes search act like modern search "
" This unsets the "last search pattern" register by hitting return "
nnoremap <CR> :noh<CR><CR>

set showmatch " Show matching brackets when highlighted "

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""
" Files, backups and undo "
"""""""""""""""""""""""""""
" Turn backup files off
set nobackup
set nowb
set noswapfile

" Persistent undo
if version >= 703
try
   set undodir=~/.vim_runtime/undodir
   set undofile
catch
endtry
endif

""""""""""""""""""""""""""
" Text, tabs and indents "
""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" Set linebreaks "
set lbr
set tw=500

set autoindent " Auto indent "
set smartindent " Smart indent "
set nowrap " Dont wrap lines "

set textwidth=100 " Set text width "

"""""""""""
" Folding "
"""""""""""

" Folds "
if version >= 703
set foldmethod=marker
set foldopen=hor,mark,search,tag,undo
endif