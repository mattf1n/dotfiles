" My very own .vimrc
" - Avoids plugins
" - Small changes

set signcolumn=no "show errors
set autoindent                  " automatically indent on new line
set autoread                    " no more (L)oad confirmation
set autowrite                   " automatically write before switching buffers
set backspace=indent,eol,start  " backspace more powerful
set belloff=all                 " sweet silence
set completeopt=menuone,preview " show even one completion match
set conceallevel=0              " set to one for conceal eg. substitute λ for lambda
set expandtab                   " tabs become spaces
set foldmethod=marker           " automatic folding
set grepprg=internal            " use vimgrep
set hidden                      " unsaved buffers can be hidden
set linebreak                   " lines broken at words, not chars
set mouse=a                     " usable mouse
set nocompatible                " not sure exactly what this does. Not vi-compatible
set nojoinspaces                " Don't put two spaces after punctuation (on reflow)
set numberwidth=1               " skinny number column
set shiftwidth=2                " 2-space indent
set spelllang=en_us       " spellcheck
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

" Netrw 
let g:netrw_liststyle = 3 " tree
let g:netrw_banner = 0 " no banner
let g:netrw_winsize = 25 " thinner split

"""""" Aesthetics """""

set fillchars=vert:\│,eob:\ ,stl:\─,stlnc:\─ " TUI-type separators

" Clean UI
highlight StatusLine       cterm=bold   ctermfg=8 ctermbg=none
highlight StatusLineNC     cterm=italic ctermfg=8 ctermbg=none
highlight StatusLineTerm   cterm=bold   ctermfg=8 ctermbg=none
highlight StatusLineTermNC cterm=italic ctermfg=8 ctermbg=none
highlight TabLine          cterm=italic ctermfg=8 ctermbg=none
highlight TabLineFill      cterm=italic ctermfg=8 ctermbg=none
highlight TabLineSel       cterm=bold   ctermfg=8 ctermbg=none
highlight VertSplit        cterm=none   ctermfg=8 ctermbg=none

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
let g:gundo_prefer_python3 = 1

" LSP
let g:lsp_document_highlight_enabled = 0
