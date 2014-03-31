""""""""""""""""""""""""""""""""
" Customized .vimrc
" Author: Mike Johnson
"
" Sources:
" http://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""

"""""""""""
" General "
"""""""""""
" Set history buffer
set history=1000

" Set default encoding to UTF-8
set encoding=utf8

"""""""""""""""""
" Abbreviations "
"""""""""""""""""

" Formatting Reference
" ts 4 (replace tabs with 4 spaces)
" sw 4 (shift width, indentation when using  >>)
" et (expand tab)
" tw (line length before breaking)
" fdm (fold marker type)
" sts (soft tab stop, backspace treats 4 spaces as tab)

" php interpretation abbreviation
iab VIMPHP <C-R>="// vim:ts=4:sw=4:et:tw=100:fdm=marker:"

" python interpretation abbreviation
iab VIMPY <C-R>="# vim:et:fdm=marker:sts=4:sw=4:ts=4"

" nodejs abbreviation
iab VIMNODE <C-R>="// vim:et:sw=2:ts=2:sts=2:"
"iab VIMNODE <C-R>="// vim:ts=2:sw=2:et:tw=80:"

" php comment block abbreviation
iab /*** /**<CR> *<CR>*/

""""""""""""
" Synonyms "
""""""""""""

"syntax match debugTodo /DEBUG/
"hi def link debugTodo Todo

""""""""""""""""""
" User Interface "
""""""""""""""""""

set t_Co=256 " Show 256 colors

syntax enable
set background=dark

" Custom colorscheme - currently disabled
"colorscheme 256_custom
" Use degraded solarized theme
let g:solarized_termcolors=256
colorscheme solarized

set number " Show line numbers
set ruler " Always show ruler

set scrolljump=5 " Cursor jump for vertical scrolling
set scrolloff=3 " Cursor width for vertical scrolling

set cmdheight=2 " The command bar height
set showtabline=2 " The tab bar height

set wildmenu " Turn on WiLd menu (oneline tab completion menu)

set showmatch " Show matching brackets when highlighted

"""""""""
" Bells "
"""""""""
set noerrorbells
set novisualbell " Disable visual bell
set t_vb= " Disable visual bell code

"set to=500 " Timeout set to 0.5 sec

""""""""""
" Search "
""""""""""
set ignorecase " Ignore case when searching
set smartcase
set hlsearch " Highlight search terms
set incsearch " Makes search act like modern search

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

""""""""""""""""""""
" Backups and Undo "
""""""""""""""""""""
" Turn backup files off
set nobackup
set nowb
set noswapfile

" Persistent undo
if exists('+persistent_undo')
   set undodir=~/.vim_runtime/undodir
   set undofile
endif

""""""""""""""""""""
" Tabs and Indents "
""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set autoindent " Auto indent
set smartindent " Smart indent

" Sets visible chars for whitespace
" ISO 8859-1 Latin-1: 187,160 trail: 155(183) extends: 133
set list listchars=tab:» ,trail:›,extends:…

"""""""""""""""
" Line Breaks "
"""""""""""""""
set textwidth=0 " Set text width (100 for autobreak, 0 for none)
set nowrap " Dont wrap lines
set linebreak " Doesn't work when list is set

set backspace=indent,eol,start " Backspace behavior in Insert mode

"""""""""""""""""""""
" Visual Indicators "
"""""""""""""""""""""
" Set visual column width indicator
if exists('+colorcolumn')
    "set colorcolumn=-19,+1 " relative values (when textwidth set)
    set colorcolumn=81,101 " absolute values (when textwidth not set)
endif

"""""""""""
" Folding "
"""""""""""
if exists('+folding')
    set foldmethod=marker
    set foldopen=hor,mark,search,tag,undo
endif

"""""""""""""""""""
" Vim Editor Tabs "
"""""""""""""""""""
if has('gui')
  set guioptions-=e
endif
if exists("+showtabline")
  function CompactTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i . ')'
      " let s .= winnr . '/' . tabpagewinnr(i,'$')
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      if getbufvar(bufnr, "&modified")
        let file .= '*'
      endif
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!CompactTabLine()
  map    <C-Tab>    :tabnext<CR>
  imap   <C-Tab>    <C-O>:tabnext<CR>
  map    <C-S-Tab>  :tabprev<CR>
  imap   <C-S-Tab>  <C-O>:tabprev<CR>
endif

"""""""""""""""""""
" Code Completion "
"""""""""""""""""""

"filetype plugin on
"set ofu=syntaxcomplete#Complete

