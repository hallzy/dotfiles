set shell=/bin/bash

set ttyfast
set lazyredraw

let $PATH='/usr/local/bin:' . $PATH

" Leader Mappings
map <Space> <leader>

" Make the leader for easy-motion <leader>/
map <Leader>/ <Plug>(easymotion-prefix)

" Use fancy characters for statusbar
let g:Powerline_symbols = 'fancy'

" Toggle nerdtree with F10
noremap <F8> :NERDTreeToggle<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=3
set notimeout

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Leave paste mode on exit
au InsertLeave * set nopaste

" Command aliases
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
  " When editing a file, always jump to the last known cursor position.
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

syntax on

filetype plugin indent on

set textwidth=80
set fo+=t
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80 " Set this up for all
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:>-,trail:-

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
set t_Co=256

set smartcase
set ignorecase
set noantialias

" Color scheme
colorscheme badwolf
set encoding=utf-8

" Numbers
set number
" Toggle for line numbers for easy copy/paste
nnoremap <leader>N :setlocal number!<cr>

set numberwidth=5

function! ToggleRelativeNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

nnoremap <leader>RN :call ToggleRelativeNumber()<cr>

set undolevels=1000

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" In normal mode, if the arrow keys are pressed, display a message below that
" says to use either h,j,k or l instead.
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
" Use ctrl+j to move to the window below, ctrl+k to move to the window above,
" etc.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set foldmethod=marker

" This formats spaces between brackets and such to the way that I like things to
" be.
function! BracketSpacing()
  " I do not want this to do anything for this vim file because otherwise when I
  " save this file this mapping will mess itself up.
  " So this returns nothing when the filetype is vim.
  if &filetype =~ 'vim'
    return
  endif
  " TODO find a better way of doing this as it is very repetitive.
  :%s/){/) {/ge
  :%s/else{/else {/ge
  :%s/if(/if (/ge
  :%s/do{/do {/ge
  :%s/while(/while (/ge
  :%s/}while/} while/ge
  :%s/for(/for (/ge

  " These have two \s characters to eliminate recursive subs.
  :%s/)\s\s\+{/) {/ge
  :%s/else\s\s\+{/else {/ge
  :%s/if\s\s\+(/if (/ge
  :%s/do\s\s\+{/do {/ge
  :%s/while\s\s\+(/while (/ge
  :%s/}\s\s\+while/} while/ge
  :%s/for\s\s\+(/for (/ge

  :%s/)\n\s\+{/) {/ge
  :%s/else\n\s\+{/else {/ge
  :%s/if\n\s\+(/if (/ge
  :%s/do\n\s\+{/do {/ge
  :%s/while\n\s\+(/while (/ge
  :%s/}\n\s\+while/} while/ge
  :%s/for\n\s\+(/for (/ge

  :%s/)\n{/) {/ge
  :%s/else\n{/else {/ge
  :%s/if\n(/if (/ge
  :%s/do\n{/do {/ge
  :%s/while\n(/while (/ge
  :%s/}\nwhile/} while/ge
  :%s/for\n(/for (/ge
endfun

" Remove trailing whitespace on save for all filetypes.
function! s:MyFormattingSubs()
  "Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  "For the filetypes listed here, do all the formatting except removing tab
  "characters.
  if &filetype !~ 'make'
    %s/\t/  /ge
  endif

  %s/\s\+$//ge
  "Replace a tab wtih 2 spaces
  call BracketSpacing()

  let @/=_s
  call cursor(l,c)
endfunction

au BufWritePre * :call <SID>MyFormattingSubs()

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maps the <F7> key to use git-time-lapse
map <F7> :call TimeLapse()<cr>

" Keep the cursor in the middle of the page if possible
:set so=999

" Open .vimrc in a vsplit with <space>ev
" If $MYVIMRC does not work as a path, either add it, or replace it with the
" path of your vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Abbreviations that fix typos
iabbrev waht what
iabbrev adn and

" In normal mode, press leader s and search result highlighting will go off.
nnoremap <leader>s :nohlsearch<cr>

" With a J move the current line up, with K move the current line down.
nnoremap J ddp
nnoremap K ddkP

" H and L move the cursor to the beginning and end of the line.
nnoremap H 0
nnoremap L $

" Delete or change everything within a comma
nnoremap di, f,dT,
nnoremap ci, f,cT,

" Delete Surrounding Characters
nnoremap ds{ F{xf}x
nnoremap cs{ F{xf}xi
nnoremap ds} F{xf}x
nnoremap cs} F{xf}xi
nnoremap ds" F"x,x
nnoremap cs" F"x,xi
nnoremap ds' F'x,x
nnoremap cs' F'x,xi
nnoremap ds( F(xf)x
nnoremap cs( F(xf)xi
nnoremap ds) F(xf)x
nnoremap cs) F(xf)xi

"Create Closing Tag
nnoremap cct F<yf>f>pF<a/<esc>hi

" also exit vim with :Q or :Q
" and save with :W or :w
cnoremap W w
cnoremap Q q

"Evaluate a mathematical expression
"usage: On a new line type out a math expression ex: 5+5=
"put the cursor anywhere on the expresssion and type <leader>m in normal mode
"The answer will be put at the end of the equals sign, and the dec, hex, and
"octal answers will be in the bottom of the vim window.
nnoremap <leader>m yyA<c-r>=<c-r>"<bs><bs><cr><esc>vT=y$:echo printf('Dec: %d    Hex: 0x%x    Oct: 0%o', <c-r>", <c-r>", <c-r>")<cr>

"With gvim, these should work, in a Linux terminal an install of vim-gnome may
"be required.
"sudo apt-get install vim-gnome
"Use the windows clipboard when copying and pasting in gvim
nnoremap y "*y
nnoremap p "*p
nnoremap d "*d
vnoremap y "*y
vnoremap p "*p
vnoremap d "*d

" When using vimdiff or diff mode
highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white  cterm=bold guibg=DarkGreen  guifg=White    gui=bold
highlight DiffText   term=reverse,bold ctermbg=lightblue ctermfg=black  cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
highlight DiffChange term=bold         ctermbg=black     ctermfg=white  cterm=bold guibg=Black      guifg=White    gui=bold
highlight DiffDelete term=none         ctermbg=DarkRed   ctermfg=white  cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none

" When viewing a diff or patch file
highlight diffRemoved term=bold ctermbg=black   ctermfg=red    cterm=bold guibg=DarkRed     guifg=white gui=none
highlight diffAdded   term=bold ctermbg=black   ctermfg=green  cterm=bold guibg=DarkGreen   guifg=white gui=none
highlight diffChanged term=bold ctermbg=black   ctermfg=yellow cterm=bold guibg=DarkYellow  guifg=white gui=none
highlight diffLine    term=bold ctermbg=magenta ctermfg=white  cterm=bold guibg=DarkMagenta guifg=white gui=none
highlight diffFile    term=bold ctermbg=yellow  ctermfg=black  cterm=none guibg=DarkYellow  guifg=white gui=none

