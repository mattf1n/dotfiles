" My very own .vimrc
" - Avoids plugins
" - Small changes

set autoindent                  " automatically indent on new line
set autoread                    " no more (L)oad confirmation
set autowrite                   " automatically write before switching buffers
set backspace=indent,eol,start  " backspace more powerful
set belloff=all                 " sweet silence
set completeopt=menuone,preview " show even one completion match
set conceallevel=0              " set to one for conceal eg. substitute λ for lambda
set expandtab                   " tabs become spaces
set foldmethod=syntax           " automatic folding
set grepprg=internal            " use vimgrep
set hidden                      " unsaved buffers can be hidden
set linebreak                   " lines broken at words, not chars
set mouse=a                     " usable mouse
set nocompatible                " not sure exactly what this does. Not vi-compatible
set numberwidth=1               " skinny number column
set shiftwidth=2                " 2-space indent
set spell spelllang=en_us       " spellcheck
set splitbelow                  " put new pane below
set splitright                  " put new pane to the right
set tabline=%!MyTabLine()       " my own tabline defined below
set tabstop=2                   " 2-space tabs
set tags=./tags,tags;$HOME      " look for the tags all the way up to home
set textwidth=80                " newline at 80 chars
set undodir=~/.vim/undo         " undo directory
set undofile                    " persistent undo
set virtualedit=all             " cursor anywhere
set whichwrap+=<,>,h,l          " left/right moves up/down lines
set wildmenu                    " completion for : commands
set wrap                        " newline when text extends beyond window width

syntax on                 " syntax highlighting
filetype plugin indent on " file type detection, plugins, indents on

" Easier navigation on wrapped lines
nmap j gj
nmap k gk
nmap 0 g0

" Fast window switching 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
           
" Since <C-L> taken above
nnoremap <leader>l :redraw!<cr>


"""""" Aesthetics """""

set fillchars=vert:\│,eob:\ ,stl:\─,stlnc:\─ " TUI-type separators
colorscheme wal " good default colorscheme using cterm based on PyWal

" Clean UI
highlight StatusLine       cterm=bold    ctermfg=0 ctermbg=none
highlight StatusLineNC     cterm=italic  ctermfg=0 ctermbg=none
highlight StatusLineTerm   cterm=bold    ctermfg=0 ctermbg=none
highlight StatusLineTermNC cterm=italic  ctermfg=0 ctermbg=none
highlight TabLine          cterm=italic  ctermfg=0 ctermbg=none
highlight TabLineFill      cterm=none
highlight TabLineSel       cterm=inverse ctermfg=0 ctermbg=none
highlight VertSplit        cterm=none    ctermfg=0 ctermbg=none

" Stop underlining things
highlight SpellBad   cterm=none
highlight SpellBad   cterm=none
highlight SpellCap   cterm=none
highlight SpellLocal cterm=none
highlight SpellRare  cterm=none

" Custom minimal tab line
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr() 
      let s ..= '%#TabLineSel#'
    else 
      let s ..= '%#TabLine#' 
    endif
    let s ..= '%' .. (i + 1) .. 'T'
    let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
  endfor
  return s .. '%#TabLineFill#%T'
endfunction

" Get tab label
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction




"""""""" Plugins """"""""
                             
" EasyAlign
xmap gl <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)

" AsyncRun async make
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" CoC
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>n  <Plug>(coc-diagnostic-next)
nmap <leader>p  <Plug>(coc-diagnostic-prev)

" Gundo
let g:gundo_prefer_python3=1
