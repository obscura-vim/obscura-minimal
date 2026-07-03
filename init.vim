set nocompatible
syntax on
filetype plugin indent on

set encoding=utf-8
set number
set cursorline
set hidden
set showcmd
set wildmenu
set scrolloff=5
set sidescrolloff=5
if exists('&inccommand')
  set inccommand=split
endif

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set splitbelow
set splitright

set wrap
set linebreak
set breakindent

set mouse=a

set clipboard=unnamedplus

set updatetime=300

let mapleader = " "

if has('termguicolors')
  set termguicolors
endif
silent! colorscheme lunaperche

highlight Normal ctermbg=NONE
highlight NonText ctermfg=8
highlight LineNr ctermfg=8
highlight CursorLineNr ctermfg=11
highlight Comment ctermfg=7

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1

nnoremap <C-e> :Lexplore!<CR>

nnoremap <C-s> :w<CR>

nnoremap <leader>q :bd<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap ,h :tabmove -1<CR>
nnoremap ,l :tabmove +1<CR>

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
for i in range(1, 9)
  execute 'nnoremap <leader>' . i . ' :' . i . 'tabnext<CR>'
endfor

nnoremap <leader>0 :tablast<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

nnoremap <A-n> :set number!<CR>
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

autocmd FileType qf nnoremap <buffer> t <C-w><CR><C-w>T

inoremap jk <Esc>

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ execute "normal! g'\"" |
    \ endif

autocmd BufWritePre * %s/\s\+$//e

function! GrepSearch(query)
  if a:query == ''
    echo "Usage: GrepSearch <query>"
    return
  endif

  let &grepprg = 'rg --vimgrep --hidden --glob "!.git"'
  execute 'silent grep! ' . shellescape(a:query)

  copen
endfunction

command! -nargs=+ Gs call GrepSearch(<q-args>)
nnoremap <leader>w :Gs<Space>

function! FindFiles(query)
  let l:cmd = "find . -type f | grep "
        \ . shellescape(a:query)

  let l:save_efm = &errorformat
  set errorformat=%f

  cgetexpr system(l:cmd)

  let &errorformat = l:save_efm

  copen
endfunction

command! -nargs=+ Ff call FindFiles(<q-args>)
nnoremap <leader>f :Ff<Space>

function! ArcStatus()
  let l:output = systemlist("arc st")

  let l:files = []

  for l:line in l:output
    let l:file = matchstr(l:line, '^\s*\(modified\|added\|deleted\):\s\+\zs.*$')
    if !empty(l:file)
      call add(l:files, {'filename': l:file, 'lnum': 1})
    endif
  endfor

  call setqflist(l:files, 'r')
  copen
endfunction

command! ArcSt call ArcStatus()
nnoremap <leader>s :ArcSt<CR>
