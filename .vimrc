" General config
set nu
set colorcolumn=80
let mapleader = ','
set noswapfile
set autoindent

filetype on
filetype plugin on
filetype indent on

" Set mouse
set mouse=a

" Copying to clipboard using `y`
"    you'll need vim with clipboard support:
"    alias vi=vimx
set clipboard=unnamedplus

" Next lines are for using spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=4

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR><Paste>

" Color schemes
set bg=dark
colorscheme gruvbox

" Changing cursor type in different modes. Works with: Terminator
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Shortcuts
ca tn tabnew

" Used for some plugins such as vim-go
set autowrite

" Emacs keybiding for insert mode
imap <C-e> <esc>$a
imap <C-a> <esc>0i
imap <C-b> <esc>hi
imap <C-f> <esc>lli

" Emacs keys for command line
cnoremap <C-A>	<Home>
cnoremap <C-B>	<Left>
cnoremap <C-D>	<Del>
cnoremap <C-E>	<End>
cnoremap <C-F>	<Right>

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

" netrw - the Vim 8 directory browser
let g:netrw_liststyle = 3
"     open file in new vertical split
let g:netrw_browse_split = 3
let g:netrw_list_hide='.*\.swp$,.*\.pyc,*\~$,*\.swo$,*\.swp$,*\.git,.\git,*\.hg,*\.svn,*\.bzr,.\DStore,.\idea,.\build'
let g:netrw_winsize = 25

" Using 4 spaces for displaying a tab in Go. Remember Go use tabs not spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Jenkisfile is Groovy
au BufRead,BufNewFile Jenkinsfile set syntax=groovy

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Templates
autocmd BufNewFile  *.pl      0r ~/.vim/templates/skeleton.pl
autocmd BufNewFile  *.java    0r ~/.vim/templates/skeleton.java

" Fugitive
nmap <leader>gs :Gstatus<cr>

" Terminal mode
tnoremap <Esc> <C-W>N

" Configuration for GUI version
if has("gui_running")
    set guifont=Hack\ 11
    set guioptions-=m
    set guioptions-=T
    vmap <C-C> "+y
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

" Functions
function! ToggleVExplorer()
  " Toggle Vexplore with Ctrl-E
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
