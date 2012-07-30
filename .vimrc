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

" set the vim interpretation line
" ts 4 (replace tabs with 4 spaces)
" sw 4 (shift width, indentation when using  >>)
" et
" tw (line length before breaking)
" fdm (fold marker type)
iab VIMM <C-R>="// vim:ts=4:sw=4:et:tw=100:fdm=marker:"

iab /*** /**<CR> *<CR>*/

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

set scrolljump=5 " Cursor jump for vertical scrolling
set scrolloff=3 " Cursor width for vertical scrolling

set wildmenu " Turn on WiLd menu
set ruler " Always show ruler

set cmdheight=2 " The command bar height
set showtabline=2 " The tab bar height

set ignorecase " Ignore case when searching
set smartcase

set hlsearch " Highlight search terms
set incsearch " Makes search act like modern search
" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set showmatch " Show matching brackets when highlighted

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
   " E518: Unknown option: undodir=~/.vim_runtime/undodir
   set undodir=~/.vim_runtime/undodir
   " E518: Unknown option: undofile
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

" Set linebreaks
set lbr
set tw=500

set autoindent " Auto indent
set smartindent " Smart indent
set nowrap " Dont wrap lines

set textwidth=100 " Set text width

" Sets visible chars for whitespace
" ASCII tab: 187,160 trail: 183 extends: 133
set list listchars=tab:» ,trail:·,extends:…

"""""""""""
" Folding "
"""""""""""

" Folds
if version >= 703
" E518: Unknown option: foldmethod=marker
set foldmethod=marker
" E518: Unknown option: foldopen=hor,mark,search,tag,undo
set foldopen=hor,mark,search,tag,undo
endif

""""""""
" Tabs "
""""""""

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

