" Turn on line numbers
:set number

colorscheme elflord

"Remappings
inoremap jk <ESC>
nnoremap <C-J> o<ESC>

"Allows for ctrl A and ctrl X to increment and decrement letters respectively
:set nf=octal,hex,alpha

"Add status line to each vim window
set laststatus=2
set ruler

set showcmd
set incsearch
set hlsearch
set wrap
set linebreak

"Adjust <Tab> button to be 4 chars long
set softtabstop=2
set shiftwidth=2
set expandtab

"Turning on syntax highlighting and adding a filetypes
syntax on
filetype on

set shell=/bin/bash

"Diff color
if &diff
  colorscheme evening
endif

"VIM Window Settings
set splitbelow
set splitright

set scrolloff=5

"put ~ and .swp files in their place
set backupdir=~/.vim/backup,.
set directory=~/.vim/swap,.

"use English spell checking, but turn it off
set spl=en spell
set nospell

"makes <TAB> insert a <tab> if there's a blank space in front,
"filename-autocomplete if proceeded by a backslash or <S-TAB> is used,
"and keyword-autocomplete otherwise

function! TabComplete()
  let line = getline('.')
  let substr = strpart(line, 0, col('.') - 1)
  let substr = matchstr(substr, "[^ \t]*$")
  
  if (strlen(substr)==0)
    return "\<TAB>"
  endif  
  if (pumvisible() != 0)
    return "\<C-N>"
  endif
  let has_slash = match(substr,'\/') != -1
  if (has_slash)
    return "\<C-X>\<C-F>"
  else
    return "\<C-N>"
  endif
endfunction

"map <TAB> to TabComplete() function
inoremap <TAB> <C-R>=TabComplete()<CR>

"for filename-completions without a preceeding slash
inoremap <S-TAB> <C-X><C-F>

"make autocomplete only fill characters until it becomes ambiguous,
"and still bring up the popup menu
set completeopt=longest,menuone

:noremap <silent> <Leader>vs :<C-u>0<CR>:let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"remove = from list of filename characters, so TAB-complete works on
"=[filename] structures
set isfname-==
