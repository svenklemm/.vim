set nocompatible                        " don't behave like vi
set backspace=2                         " allow backspacing over line breaks, autoinserts and start of insert
set smartindent                             " enable automatic indention
set showmatch                           " show matching parens/brackets
set comments=sl:/*,mb:**,elx:*/         " enable automagic multi-line comments
set formatoptions=croq                  " automatic formating options
set softtabstop=0
set shiftwidth=2                        " default character indentation level
set expandtab                           " use spaces instead of tabs for indentation
set tabstop=2
set hlsearch                            " highligh last used search pattern
set hidden
set wildmenu 
set wildmode=longest,full
set laststatus=2
set statusline=[%02n]\ %F%(\ %r%y%m%)\ %=%c%V,\ %l/%L\ \ %P
set ruler
set number

set foldmethod=indent
set foldlevel=2
set nofoldenable

syntax on                               " enable syntax-highlighting

" en/disable taglist-browser by pressing <F8>
nmap <F8> :Tlist<CR>
" execute make by pressing <F9>
nmap <F9> :wall<CR>:make<CR>
" show next error by pressing <F10>
nmap <F10> :cn<CR>

" spell checker
map <F5> [s zz
map <F6> ]s zz
map <F7> z=
map <F8> zg

set spelllang=en

let Tlist_Ctags_Cmd="/usr/bin/ctags"    " set program used for taglist-creation

let g:miniBufExplMapCTabSwitchBuffs = 1 " switch buffers with <c-tab>

function InsertTabWrapper(direction)    " automagically decide what to do with <tab>
  let col = col('.') -1                 " <s-tab> in insert mode
  if !col
    return "\<tab>"         " insert Tab at the beginning of the line
  elseif a:direction < 0
    return "\<c-p>"         " insert Backward-Completion
  elseif getline('.')[col - 1] == '<space>'
    return "\<BS>\<TAB>"    " replace <space><tab> with <tab>
  elseif getline('.')[col - 1] !~ '\k'
    return "\<tab>"         " insert Tab if preceding character is not a keyword character
  else
    return "\<c-n>"         " insert Forward-Completion
endfunction

inoremap <tab> <c-r>=InsertTabWrapper(1)<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper(-1)<cr>

colorscheme sven

" automagically close ( [ { and "
imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>
imap " <C-V>"<C-V>"<Left>

filetype plugin on

runtime ftplugin/man.vim

autocmd BufRead,BufNewFile *.nse set filetyper=lua
autocmd BufRead,BufNewFile *.rxml set filetype=ruby
