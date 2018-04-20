" ====== Main conf

set nocompatible

set nu
syntax on
set encoding=utf-8
set noswapfile

set autoread

set mouse=a

set colorcolumn=81

let mapleader = ','

set splitright

set laststatus=2

" `delete` key shoud delete a char
set backspace=2

" Accesing to system clipboard
set clipboard=unnamed

" Highlight current line
set cursorline

" set 256 colors
set t_Co=256

" Highligthing searching
set hlsearch

" Highligthing incremental searching. :nohls cancel it
set incsearch

set bg=dark

" Emacs keys for command line
cnoremap <C-A>	<Home>
cnoremap <C-B>	<Left>
cnoremap <C-D>	<Del>
cnoremap <C-E>	<End>
cnoremap <C-F>	<Right>

" Tabnew shortcut
ca tn tabnew

" netrw - the Vim 8 directory browser
let g:netrw_liststyle = 3
"     open file in new vertical split
" let g:netrw_browse_split = 2
"     open file in new tab
let g:netrw_browse_split = 3
let g:netrw_list_hide='.*\.swp$,.*\.pyc,*\~$,*\.swo$,*\.swp$,*\.git,.\git,*\.hg,*\.svn,*\.bzr,.\DStore,.\idea,.\build'
let g:netrw_winsize = 25
"     toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Smart window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Web development indentation
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" C indentation
au BufNewFile,BufRead *.c
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding and using `space` key for it
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR><Paste>

" Detecting indentation by filetype
filetype plugin indent on

" Emacs keybiding for insert mode
imap <C-e> <esc>$a
imap <C-a> <esc>0i
imap <C-b> <esc>hi
imap <C-f> <esc>lli

" Next line is required to use Go commands (`vim-go`)
filetype plugin on

" Using 4 spaces for displaying a tab in Go. Remember Go use tabs not spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

au BufRead,BufNewFile Jenkinsfile setfiletype groovy

" Google yapf Python formattert
function! YAPF() range
  let l:line_ranges = a:firstline . '-' . a:lastline
  let l:cmd = 'yapf --lines=' . l:line_ranges
  let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")
  execute '1,' . string(line('$')) . 'delete'
  call setline(1, split(l:formatted_text, "\n"))
  call cursor(a:firstline, 1)
endfunction

map <leader>y :call YAPF()<cr>

" Encryption method
set cm=blowfish2

"" ====== Plugins conf 

let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Ctrlpvim: Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ctrlpvim: Fuzzy search on open buffers
nmap <Leader>b :CtrlPBuffer<CR>

" Ctrlpvim: Open files in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Running linters only when files are saved
let g:ale_lint_on_text_changed = 'never'

" Using <c-space> for snippets " because <tab> is used by YouCompleteMe 
let g:UltiSnipsExpandTrigger="<c-space>"

" Ack: highlighting results
let g:ackhighlight = 1

" YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NerdCommenter: Switch comment by Ctrl+\
map <silent> \ :call NERDComment('n', 'Toggle')<CR>
map <silent> <C-\> :call NERDComment('n', 'Toggle')<CR>
imap <silent> <C-\> <C-O>:call NERDComment('n', 'Toggle')<CR>

" Stop automatic wrapping
set textwidth=120

" Emulating system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Fugitive
nmap <leader>gs :Gstatus<cr>

if has('gui_running')
    colorscheme gruvbox
    set guioptions-=T
    set guioptions-=m
    set guifont=Hack\ 10
else 
    let &t_SI.="\e[5 q"
    let &t_SR.="\e[6 q"
    let &t_EI.="\e[1 q"
    colorscheme gruvbox 
endif
