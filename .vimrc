" =============================================================================
" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this file,
" You can obtain one at http://mozilla.org/MPL/2.0/.
"
" Copyright (c) 2015, MPL Steven Hall Hallzy.18@gmail.com
"
" =============================================================================

" keys that I dont use so are free for mappings"{{{

"""" Normal Mode

" ^
" &
" #  -- this has been remapped to <nop>
" -
" |
" `   --- turns out this does the same as ' but ' is easier to hit

"}}}

" vim-plug Settings"{{{

if has("gui_running")
  " Use the specified location, and supress the git error.
  silent call plug#begin('~/vim/vimfiles/plugged')
else
  call plug#begin()
endif

Plug 'vim-scripts/a.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sjl/badwolf'
Plug 'vim-scripts/Conque-GDB'
Plug 'brookhong/cscope.vim'
Plug 'ciaranm/detectindent'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'vim-scripts/git-time-lapse'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'Yggdroot/indentLine'
Plug '844196/lightline-badwolf.vim'
Plug 'hallzy/lightline-iceberg'
Plug 'hallzy/lightline-onedark'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'joshdick/onedark.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'abudden/taghighlight-automirror'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-abolish'
Plug 'PeterRincker/vim-argumentative'
Plug 'gioele/vim-autoswap'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jamessan/vim-gnupg'
Plug 'suan/vim-instant-markdown'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-notes'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'xolox/vim-session'
Plug 'kshenoy/vim-signature'
Plug 'christoomey/vim-sort-motion'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'kurkale6ka/vim-swap'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'iago-lito/vim-visualMarks'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'yaroot/vissort'
Plug 'gavinbeatty/vmath.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

"}}}

" Settings"{{{

filetype plugin indent on
set nocompatible  " Use Vim settings, rather then Vi settings

set shell=/bin/bash
set title titlestring=

set clipboard=unnamed

" Disable mouse
set mouse=

set ttyfast
set lazyredraw

" Allow project specific vimrc files
" set exrc
" Prevents autocmd, shell, and write command from being run inside
" project-specific vimrc files.
" set secure

let $PATH='/usr/local/bin:' . $PATH

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=3
set notimeout

" Turn off column and cursor highlight when leaving a vim window, and turn them
" on when entering
augroup highlightCursorLine
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Start with highlighted columns and lines
set cursorline
set cursorcolumn

" Leave paste mode on exit of insert mode
augroup pastegroup
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
  " When editing a file, always jump to the last known cursor position.
set history=500
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set hlsearch          " highlight matches
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set autoread          " If the current file is updated elsewhere auto update it
set showmatch         " Shows the matching bracket or brace
set tildeop           " Tilde (~) changes case of letter. Setting this option
                      " lets the tilde have movement options
set pastetoggle=<f2>  " The toggle for paste mode is F2
set spelllang=en_ca
set nostartofline     " when using gg or G, stay in the same column

syntax on


set textwidth=80

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:>-,trail:-

set t_Co=256

" Ignore case sensitivity, unless I specify an Uppercase character. Then the
" string is case sensitive
set smartcase
set ignorecase

set encoding=utf-8

" With both of these set, I get relative numbers, but the current line gets the
" line number - Hybrid Numbering
set number
set relativenumber

set numberwidth=5

set undolevels=1000

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Use markers for folds
set foldmethod=marker

" Keep the cursor within 10 lines of the bottom and top
set scrolloff=10

"}}}
" Mappings"{{{

" Leader"{{{

" Leader Mappings
map <Space> <leader>

"}}}
" Tab Navigation"{{{

" Firefox like tab manipulations (except next and previous because <c-tab> does
" not work :(
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <C-t>      :tabnew<cr>
nnoremap <C-w>t     :tabclose<cr>

"}}}
" Line Number Toggle"{{{

" Toggle for line numbers for easy copy/paste
nnoremap <leader>N :setlocal number!<cr>:setlocal relativenumber!<cr>

"}}}
" Resize Split Windows"{{{

"Arrow keys expand and shrink vim split
nnoremap <Left>   <C-w><
nnoremap <Right>  <C-w>>
nnoremap <Up>     <C-w>+
nnoremap <Down>   <C-w>-

"}}}
" Better Split Window Movement"{{{

" Use ctrl+j to move to the window below, ctrl+k to move to the window above,
" etc.
nnoremap UJ <C-W>j
nnoremap UK <C-W>k
nnoremap UL <C-W>l
nnoremap UH <C-W>h

" Move splits with U<movement>
nnoremap Uj <C-W>J
nnoremap Uk <C-W>K
nnoremap Ul <C-W>L
nnoremap Uh <C-W>H

"}}}
" Change what "*" does"{{{

" Make * search the currently selected word, without going to the next result
nnoremap * *N

"}}}
" Shortcut for opening vimrc"{{{

" Open .vimrc in a vsplit with <space>ev
" If $MYVIMRC does not work as a path, either add it, or replace it with the
" path of your vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"}}}
"German Chars"{{{

" ä
inoremap a'' <c-k>:a
" Ä
inoremap A'' <c-k>:A
" ö
inoremap o'' <c-k>:o
" Ö
inoremap O'' <c-k>:O
" ü
inoremap u'' <c-k>:u
" Ü
inoremap U'' <c-k>:U
" ß
inoremap ss' <c-k>ss

"}}}
" Remove search highlighting"{{{

" In normal mode, press leader s and search result highlighting will go off.
nnoremap <leader>hl :nohlsearch<cr>

"}}}
" Move a Line, or selected lines up or down"{{{

"Both methods work but do slightly different things
" The first one moves the lines inside of folds when you hit a fold
" The second one moves the lines over the fold, as if the fold was a single line
" Other than these differences, they function exactly the same

" First Method"{{{

" As of about vim 7.4 patch 700 these :m mappings cause all my folds to collapse
" As a result, these mappings needed to become more complex, by setting the
" foldmethod to manual, and then to marker afterwards

" With a J move the current line up, with K move the current line down.
" nnoremap J :set foldmethod=manual<cr>:m .+1<CR>==:set foldmethod=marker<cr>
" nnoremap K :set foldmethod=manual<cr>:m .-2<CR>==:set foldmethod=marker<cr>

" With a J move the current Selected lines up, with K move the current selected lines down.
" vnoremap J :set foldmethod=manual<cr>'<V'>:m '>+1<CR>gv=:set foldmethod=marker<cr>gv
" vnoremap K :set foldmethod=manual<cr>'<V'>:m '<-2<CR>gv=:set foldmethod=marker<cr>gv

"}}}
" Second Method"{{{

" With a J move the current line up, with K move the current line down.
nnoremap K :call MoveLineUp()<cr>
nnoremap J ddp==

" With a J move the current Selected lines up, with K move the current selected lines down.
vnoremap K <esc>:call MoveSelectionUp()<cr>
vnoremap J <esc>'<V'>dp`[V`]=gv
"}}}


"}}}
" H and L move to the beginning and end of the line"{{{

" If I am on the first character of a line, and press H, take me to the
" first column. Otherwise take me to the first non whitespace character of the
" line.
nnoremap <silent> H :call HMapping()<cr>
onoremap <silent> H :call HMapping()<cr>
vnoremap <silent> H <esc>:call HMappingVisual()<cr>

nnoremap <silent> L :call LMapping()<cr>
onoremap <silent> L :call LMapping()<cr>
vnoremap <silent> L <esc>:call LMappingVisual()<cr>


"}}}
"Create Closing Tag for HTML Tags"{{{

" Creates a corresponding closing tag for a given open tag.
nnoremap cct F<yf>f>pF<a/<esc>hi

"}}}
" Escape removes trailing whitespace from eol"{{{

"esc now removes whitespace from the line that you are escaping from
nnoremap <silent> dtw <esc>:call RemoveTrailingWhitespaceFromCurrentLine()<cr>

"}}}
"Evaluate a mathematical expression"{{{

" Calculate Math
xnoremap <silent> <space>c :!octave --silent \| cut -c8-<cr>:call AddCommas()<cr>
nnoremap <silent> <space>c v:!octave --silent \| cut -c8-<cr>:call AddCommas()<cr>

"}}}
" For merge conflicts easily choose what version to use"{{{

" For use in git mergetool using vimdiff
nnoremap $ :diffget<space>

"}}}
" > and <"{{{

" Now when I try to move several lines at once sideways, the visual selection
" stays selected so that I can move it multiple times easily.
vnoremap > >gv
vnoremap < <gv

"}}}
" Visually select the last pasted item"{{{

nnoremap gV `[v`]

"}}}
" Remap the Default usage of J"{{{

" I like using J to move the current line down. But the default function of J is
" very useful, so I am mapping it to Q because I don't use Q (Does anyone
" actually use Q?)

" Before I had this mapping, I remapped Q to nop to avoid accidentally pressing
" it. I am leaving it here commented so that If I change the below mapping, I
" won't forget to nop it again

" nnoremap Q <nop>

nnoremap Q J
vnoremap Q J

"}}}
" Remap w W e and E"{{{

" I find that I don't often use the lowercase versions of these, so I will just
" map them to the uppercase versions, and the uppercase letters will be to go
" backwards. This leaves b and B freen, which are now used for easymotion
" movements.
noremap w W
noremap W B

noremap e E
noremap E gE

"}}}
" Extra mappings for saving and closing vim"{{{

nnoremap ZX :qa!<cr>
nnoremap ZA :wqa<cr>
nnoremap ZS :w<cr>

"}}}
" _ is now K - but special"{{{

" _ behaves like the default K, except for files of the "vim" or "help"
" filetypes, where it opens help
nnoremap <expr> _ OpenHelp()
vnoremap <expr> _ OpenHelp()

"}}}
" Replace local variable with something else"{{{

nnoremap gr gd<c-o>[{V%::s/<c-r>///gc<left><left><left>

"}}}
" Use apostrophe instead of a back tick for going to marks"{{{

nnoremap ' `

"}}}
" ctrl+m, ctrl+h, ctrl+l"{{{

" ctrl+m moves cursor to the middle of the screen
noremap <leader>M M
" ctrl+h moves cursor to the top of the screen
noremap <leader>H H
" ctrl+l moves cursor to the bottom of the screen
noremap <leader>L L

" zh moves the current line to the top of the screen
noremap zh zt
" zm moves the current line to the middle of the screen
noremap zm zz
" zh moves the current line to the top of the screen
noremap zl zb

" Move down and put the cursor and line at the top of the file
noremap j jzt
" Move up and put the cursor and line at the bottom of the file
noremap k kzb

" easier combinations. Consider the scenario where I use j to move down to a
" line, but I go past the line. then I press k to go back up to the line, but
" now my cursor is towards the bottom of the screen when I would prefer it to be
" at the top, as if I was pressing j to go down, but without moving to the line
" below. Basically, these mappings shift the screen just as j and k do, but
" without moving my cursor up or down a line.
noremap <c-k> zb
noremap <c-j> zt

"}}}
" ToggleColourScheme"{{{

nnoremap <leader>tc :call ToggleColourScheme("next")<cr>
nnoremap <leader>TC :call ToggleColourScheme("prev")<cr>

"}}}
" Make Y behave similarly to D."{{{

nnoremap Y y$

"}}}

"}}}
" abbrevs"{{{

" Greek Alphabet
inoremap   alpha''     α
inoremap   Alpha''     Α
inoremap   beta''      β
inoremap   Beta''      Β
inoremap   gamma''     γ
inoremap   Gamma''     Γ
inoremap   delta''     δ
inoremap   Delta''     Δ
inoremap   epsilon''   ε
inoremap   Epsilon''   Ε
inoremap   zeta''      ζ
inoremap   Zeta''      Ζ
inoremap   eta''       η
inoremap   Eta''       Η
inoremap   theta''     θ
inoremap   Theta''     Θ
inoremap   iota''      ι
inoremap   Iota''      Ι
inoremap   kappa''     κ
inoremap   Kappa''     Κ
inoremap   lambda''    λ
inoremap   Lambda''    Λ
inoremap   mu''        μ
inoremap   Mu''        Μ
inoremap   nu''        ν
inoremap   Nu''        Ν
inoremap   xi''        ξ
inoremap   Xi''        Ξ
inoremap   omicron''   ο
inoremap   Omicron''   Ο
inoremap   pi''        π
inoremap   Pi''        Π
inoremap   rho''       ρ
inoremap   Rho''       Ρ
inoremap   sigma''     σ
inoremap   Sigma''     Σ
inoremap   tau''       τ
inoremap   Tau''       Τ
inoremap   upsilon''   υ
inoremap   Upsilon''   Υ
inoremap   phi''       φ
inoremap   Phi''       Φ
inoremap   chi''       χ
inoremap   Chi''       Χ
inoremap   psi''       ψ
inoremap   Psi''       Ψ
inoremap   omega''     ω
inoremap   Omega''     Ω

"}}}
" Plugins"{{{

" Easy Motion"{{{

" Easy motion leader is <leader>b
map <leader>b <Plug>(easymotion-prefix)

" Single Character search
map b <Plug>(easymotion-s)

" two character searches
nmap B <Plug>(easymotion-s2)

" Easy motion search
map <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)

" Easy Vertical Motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <leader>; <plug>(easymotion-repeat)
let g:EasyMotion_startofline = 0

"use easy motion with no case sensitivity
let g:EasyMotion_smartcase = 1

" let's me navigate to folded lines with easymotion.
let g:EasyMotion_skipfoldedline = 0

" It is worth noting that when using the easymotion search (<leader>/ with this
" config) you can hit ctrl+z and it will open all of the folds in the file so
" that you can search and find text with the EasyMotion search function. Vim by
" default lets me use zM to close all folds in a file after that
" TODO: Find a way to map a key to restore the previous state of my folds. Ie.
" Open folds that were previously opened, and close those that were closed.

"}}}
" Fanfingtastic"{{{

"let g:fanfingtastic_ignorecase = 1

" Only do this, if they exist (It should only not exist if I have disabled
" fanfingtastic
if exists(':call FanfingTasticDisable()')
  " Disable when using multi cursors. Lots of problems occur if I leave it.
  function Multiple_cursors_before()
    call FanfingTasticDisable()
  endfun

  function Multiple_cursors_after()
    call FanfingTasticEnable()
  endfun
endif

"}}}
" Quick Scope"{{{

" Colours for quick-scope
if has("gui_running")
  " gui vim
  let g:qs_first_occurrence_highlight_color = '#75fff3'
  let g:qs_second_occurrence_highlight_color = '#6b98fb'
else
  " terminal vim - cyan :
  " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  let g:qs_first_occurrence_highlight_color = 51
  " terminal vim - blue :
  " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  let g:qs_second_occurrence_highlight_color = 33

" Can only use these if I don't have fanfingtastic
  " Only highlight when I press one of the keys below
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
endif

"}}}
" NERDTree"{{{

" function! OpenNerdTreeStartup()
"   NERDTree
"   exec "normal! \<c-w>l"
" endfun
" Start nerdtree automatically if I give vim a file name
" autocmd VimEnter * call OpenNerdTreeStartup()


" Toggle nerdtree with F10
noremap <F8> :NERDTreeToggle<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

"}}}
" vmath"{{{

"For using vmath.vim
vnoremap ++  y:call VMATH_Analyse()<CR>
nnoremap ++  vipy:call VMATH_Analyse()<CR>

"}}}
" dragvisuals"{{{

" This is for dragvisuals.vim
runtime plugin/dragvisuals.vim

vmap  <expr>  <left>   DVB_Drag('left')
vmap  <expr>  <right>  DVB_Drag('right')
vmap  <expr>  <down>   DVB_Drag('down')
vmap  <expr>  <up>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"}}}
" Visual Marks"{{{

" Visual marks are the same as normal, except done in visual mode
vmap m <Plug>VisualMarksVisualMark
nmap M <Plug>VisualMarksGetVisualMark

"}}}
" Git Time Lapse"{{{

" Maps the <F7> key to use git-time-lapse
map <F7> :call TimeLapse()<cr>

"}}}
" MRU"{{{

" excludes any file in /tmp file, and commit messages in my results.
let g:MRU_Exclude_Files = '^/tmp/.*\|.*/COMMIT_EDITMSG$'

" Only show most recent 20 files
let g:MRU_Max_Entries = 20

"}}}
" vim-gitgutter"{{{

" This makes the diff updates happen more frequently. The default is 4000. This
" value is measured in ms.
set updatetime=1000

nmap ]h <plug>GitGutterNextHunk
nmap [h <plug>GitGutterPrevHunk

" Now the sign column will always be open
let g:gitgutter_sign_column_always = 1

"}}}
" vim-signature"{{{

"Support for gitgutter. When this =1 :
"The mark is displayed over the gitgutter sign, but inherits the same colour so
"you can tell what was there
let g:SignatureMarkTextHLDynamic = 1

"}}}
"vim-session"{{{

" Manipulates global vim sessions
nnoremap <leader>so :OpenSession<cr>
nnoremap <leader>sv :ViewSession<cr>
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

" Manipulates tab vim sessions
nnoremap <leader>sto :OpenTabSession<cr>
nnoremap <leader>stno :AppendTabSession<cr>
nnoremap <leader>sts :SaveTabSession<cr>
nnoremap <leader>stc :CloseTabSession<cr>

" Restarts vim and opens the sessions that were open - only for gvim
nnoremap <leader>sr :RestartVim<cr>


" Sessions will be saved here
let g:session_directory = "~/.my-vim-sessions"

" if the default session exists, do not prompt me on opening vim to open the default
let g:session_autoload = "no"

" On exiting vim, do not prompt me to save the session
let g:session_autosave = "no"

" Make messages less verbose
let g:session_verbose_messages = 0

"}}}
" Lightline - Status Bar"{{{

" Use the powerline theme
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'component': {
      \ 'fugitive': '%{exists("*fugitive#head")?"BR: " . fugitive#head():""}',
      \ 'lineinfo': "LN %l/%{line('$')}",
      \ 'colinfo': "COL %-2v",
      \ 'charvaluehex' : "char: 0x%B",
  \ },
  \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
\ }

" This is where I define a variable to a function
" I used to use this but I left it here as an example in case I want to use this
" in the future. The total number of lines is done above in lineinfo
" TotalNumberOfLines will contain the number of lines in a file.
" let g:lightline.component_function = {
"       \ 'totalNumberOfLines': 'NumberOfLinesFunction',
"       \ }

" The layout of lightline when it is the active window
" Left Side
" Mode | Paste Mode || Branch | Read Only | Relative Path | Modified ||
"Right Side
" Format | Encoding | Filetype || Percent || line info | column ||
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo', 'colinfo', 'charvaluehex' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

" The layout of lightline when it is not the active window
" Left Side
" Read Only |  Relative Path | Modified ||
"Right Side
" Percent || line info | column ||
let g:lightline.inactive = {
    \ 'left': [ [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo', 'colinfo', 'charvaluehex' ],
    \            [ 'percent' ] ] }

" The layout of lightline for the tab line when tabs exist.
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ] }

"}}}
" vim-multiple-cursor"{{{

" With vim-multiple-cursors, let me exit insert and visual mode with esc and
" still keep the multiple cursors active.
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
noremap <c-m> :MultipleCursorsFind<space>

"}}}
" Syntastic"{{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

" Use :SyntasticCheck to run syntastic


"Ignore unused argument, and missing scriptencoding
let g:syntastic_vim_vimlint_quiet_messages = { 'regex': '\v\[EVL%(103|205)\]'  }

"}}}
" Unite.vim"{{{

" File Searching like ctrlp
nnoremap <C-p> :UniteWithInputDirectory file_rec/async<cr>

" Content searching like ack.vim
nnoremap <leader>1 :UniteWithInputDirectory grep<cr>

" Buffer switching like lustyJuggler
nnoremap <leader>2 :Unite -quick-match buffer<cr>

"}}}
" vim-swap"{{{

" For swapping position of text
vmap <leader>x         <plug>SwapSwapOperands
vmap <leader><leader>x <plug>SwapSwapPivotOperands
nmap <leader>x         <plug>SwapSwapWithR_WORD
nmap <leader>X         <plug>SwapSwapWithL_WORD

"}}}
" VimShell"{{{

" Opens a shell inside of vim
nnoremap <leader>vs :VimShell<cr>

"}}}
" Cscope"{{{

set cscopetag
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

"}}}
" Conque GDB"{{{

cnoremap gdb :ConqueGdb

"}}}
" Tabularize Mapping"{{{

noremap <leader>tz :Tabularize /

"}}}
" EasyAlign"{{{

vnoremap <silent> <Enter> :EasyAlign<cr>

"}}}
" Vissort"{{{

" Make vissort case insensitive
let g:vissort_option= "i"

"}}}
" vim-over"{{{

" Easy mapping to do substitutions live
noremap :%s/ :OverCommandLine<cr>:%s/
noremap :s/ :OverCommandLine<cr>:s/

"}}}
" Vim table mode"{{{

" Make the tables markdown compatible
let g:table_mode_corner="|"

"}}}
" vim-surround"{{{

let b:surround_indent = 1

"}}}
" vim-startify"{{{

" Order of headings, and the heading text
let g:startify_list_order = [
      \ ['   Bookmarks'],      'bookmarks',
      \ ['   MRU'],            'files',
      \ ['   MRU '. getcwd()], 'dir',
      \ ['   Sessions'],       'sessions',
      \ ]

" My Bookmarks
let g:startify_bookmarks = [
      \  '~/.vimrc',
      \  '/var/spool/mail/steven',
      \ ]

" When opening a version controlled file using startify, change the cwd of vim
" to the root of that repository
let g:startify_change_to_vcs_root = 1

"}}}
" DetectIndent"{{{

" When the correct value of expandtab cannot be determined, treat it as though
" expandtab is set, meaning that pressing tab gives x number of spaces
let g:detectindent_preferred_expandtab = 1

" When indent size cannot be determined use 2
let g:detectindent_preferred_indent = 2


" Automatically run detectIndent
autocmd BufReadPost * :DetectIndent

"}}}
" Indentline"{{{

let g:indentLine_char = '│'
let g:indentLine_first_char='│'
let g:indentLine_showFirstIndentLevel=1

" Use the colour of gruvbox comments. Looks descent for my colourschemes
let g:indentLine_color_term = 245
let g:indentLine_color_gui = '#928374'

"}}}
" TagHighlight"{{{

" Make the files hidden files
if ! exists('g:TagHighlightSettings')
  let g:TagHighlightSettings = {}
endif

" Make the tag files be hidden files. I don't want to see them.
let g:TagHighlightSettings['TypesFilePrefix'] = '.types'
let g:TagHighlightSettings['TagFileName'] = '.tags'

"}}}
" vim-gnupg"{{{

" Source an external file that contains recipients. I keep it external so I don't
" push identities of people I know. Identities can be found using the
" \"gpg--list-keys" Command. The gpg_recipients.vim file looks like this:
" let g:GPGPossibleRecipients=[
"   \"Steven Hall <Hallzy.18@gmail.com>",
"   \"Someone Else <other@person.com>"
"   \]
source $dotfiles/gpg_recipients.vim

"}}}
" vim-notes"{{{

let g:notes_directories = [
      \ '~/Documents/notes',
      \ ]

"}}}

"}}}
" Functions"{{{

" HLNext"{{{

" Blink the next selection of a search
function! HLNext (blinktime)
  let target_pat = '\c\%#\%('.@/.'\)'

  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'

  call matchdelete(ring)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 250) . 'm'

  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'

  call matchdelete(ring)
  redraw

endfunction
"}}}
" Tab Completion - InsertTabWrapper"{{{

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
"}}}
" AddCurlyBraces"{{{

function! AddCurlyBraces()
  :exe "normal! $a\<space>{\<esc>jo}\<esc>"
endfun

"}}}
" BracketSpacing"{{{

" This formats spaces between brackets and such to the way that I like things to be.
function! BracketSpacing()
  " TODO find a better way of doing this as it is very repetitive.
  if (&filetype !~ 'sh')
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
  endif
endfun
"}}}
" MyFormattingSubs"{{{

" Remove trailing whitespace on save for all filetypes.
function! MyFormattingSubs()
  "Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Note: Filetypes listed are excluded.
  " Note: Java is excluded because For CPEN 422 at UBC we are given a Java
          " project that would make lots of changes to many files which would
          " be a bit of a waste

  "Replace a tab wtih 2 spaces, except for the filetypes specified
  if (&filetype !~ 'make' &&
     \&filetype !~ 'xml' &&
     \&filetype != 'java')

    " Don't do this now. DetectIndent will make it so that I may have tabs. Just
    " leaving this here incase I decide to get rid of detectIndent
    " %s/\t/  /ge
  endif

  " Remove trailing whitespace except for the filetypes specified
  " Commented because I should still remove trailing whitespace from java files.
  " Just leaving this here as an example of how to change it if I decide I need
  " exclusions
  " if (&filetype != 'java')
    %s/\s\+$//ge
  " endif

  " Change bracket spacings for me
  " Note: I need to exclude vim files from this otherwise vim will mess up the
  " BracketSpacing() function - There are spacings that would change in the
  " function implementation
  if &filetype !~ 'vim'
    call BracketSpacing()
  endif

  let @/=_s
  call cursor(l,c)
  call histdel("search", -1)
endfunction
"}}}
" Remove trailing whitespace"{{{

function! RemoveTrailingWhitespace()
  let l = line(".")
  let c = col(".")

  "  if (&filetype != 'java')
    %s/\s\+$//ge
  "  endif

  call cursor(l,c)
endfunction

" }}}
" VisualSelection - perform search and replacements for visual text"{{{

" This is used for the next function
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Perform searches and replacements for visually selected text
function! VisualSelection(direction) range
  " Temporarily store your last yank as a temp variable
  let l:saved_reg = @"
  " Selects and yanks the highlighted text
  execute "normal! vgvy"

  " if the highlighted text has any of these special characters, then escape
  " them with a \
  let l:pattern = escape(@", '\\/.*$^~[]')
  " Get rid of next line characters in the highlighted text
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  let @/ = l:pattern

  " Search for highlighted text
  if a:direction == 'b'
      execute "normal ?\<C-R>/\<cr>"
  " substitute highlighted text
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  " Search for highlighted text
  elseif a:direction == 'f'
      execute "normal /\<C-R>/\<cr>"
  endif

  "Restore your last yank bank into the " register
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
"}}}
" Underline the current line"{{{

" Underline the current line with a -
function! UnderlineCurrentLineWithDash()
  exe "normal! $"
  let c = col(".")
  exe "normal! o"

  while c > 0
    exe "normal! i-\<esc>"
    let c -= 1
  endwhile
endfunc

"Underline the current line with =
function! UnderlineCurrentLineWithEquals()
  exe "normal! $"
  let c = col(".")
  exe "normal! o"

  while c > 0
    exe "normal! i=\<esc>"
    let c -= 1
  endwhile
endfunc
"}}}
" DimInactiveWindows"{{{

" This changes the way that non active splits appear.
" The background will be a lighter black and will have no colour.
function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      if &wrap
        let l:width=256 " max
      else
        let l:width=winwidth(i)
      endif
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction
"}}}
" OpenMultipleFilesVSplit"{{{

function! OpenMultipleFilesVSplit()
  call inputsave()
  let option = input("Enter a file name or regex expression: ")
  call inputrestore()
  execute ":args " . option . " | vertical all"
endfun
"}}}
" SaveVimSession"{{{

" function! SaveVimSession()
"   call inputsave()
"   let name = input("enter a session name: ")
"   call inputrestore()
"   execute ":mksession! ~/.my-vim-sessions/" . name
" endfun

"}}}
" RestoreVimSession"{{{

" function! RestoreVimSession()
"   let cwd = getcwd()
"   :cd ~/.my-vim-sessions/
"   :silent !clear
"   :!ls -1
"   call inputsave()
"   let name = input("enter a session name: ")
"   call inputrestore()
"   execute ":source " . name
"   execute ":cd " . cwd
" endfun

"}}}
" Toggle the functionality of ctrl+a and ctrl+x"{{{

" This will make ! toggle whether or not ctrl+a and ctrl+x can work on alpha
" characters or not. By default it is off.
function! Togglenrformats()
  if &nrformats == "octal,hex"
    set nrformats=octal,hex,alpha
  else
    set nrformats=octal,hex
  endif
  echo &nrformats
endfun
"}}}
" Functions for moving lines and blocks up and down"{{{

" Note that there are no down functions because it was really easy to implement
" as part of the mappings only.

"Move Line Up"{{{

function! MoveLineUp()
  let currentLine = line(".")
  let lastLine = line("$")

  if currentLine == lastLine
    " Do this on the bottom of the file otherwise the line will go up 2 lines
    " instead of one
    exec "normal! ddP=="
  elseif currentLine == 1
    " Don't go off the top of the page
  else
    " For anywhere else in the file, do this
    exec "normal! ddkP=="
  endif
endfun

"}}}
" Move Selection Up"{{{

function! MoveSelectionUp()
  " Selects the top part of the visual selection and Save that line number
  exec "normal! '<"
  let currentLineTop = line(".")

  " Selects the block, with the cursor on the bottom of the block and Save that
  " line number
  exec "normal! V'>"
  let currentLineBottom = line(".")

  let lastLine = line("$")

  if currentLineBottom == lastLine
    " Do this on the bottom of the file otherwise the line will go up 2 lines
    exec "normal! gvdP`[V`]=gv"
  elseif currentLineTop == 1
    " Don't go off the top of the page
  else
    exec "normal! gvdkP`[V`]=gv"
  endif

endfun

"}}}

"}}}
" OpenHelp()"{{{

" Used to open :help for vim and vim help files, but use default K for anything
" else
function! OpenHelp()
  if &filetype is# 'vim' || &filetype is# 'help'
    return ':help ' . fnameescape(expand('<cword>')) . "\n"
  else
    return 'K'
  endif
endfun

"}}}
" RemoveTrailingWhitespaceFromCurrentLine()"{{{

" Used by <esc> key to remove trailing whitespace off of the current line, and
" also deletes that replace entry from the history
function! RemoveTrailingWhitespaceFromCurrentLine()
  if &modifiable == 1
    s/\s\+$//e
    call histdel("search", -1)
  endif
endfun

"}}}
"HMapping()"{{{

" If I am on the first character of a line, and press H, take me to the
" first column. Otherwise take me to the first non whitespace character of the
" line.
function! HMapping()
  let c = col(".")
  exec "normal! ^"

  if c <= col(".")
    exec "normal! 0"
  endif
endfun

function! HMappingVisual()
  let startc = col(".")
  exec "normal! gv^\<esc>"
  let endc = col(".")

  if startc <= endc
    exec "normal! gv0"
  else
    exec "normal! gv"
  endif
endfun

"}}}
"LMapping()"{{{

" If I am on the first character of a line, and press H, take me to the
" first column. Otherwise take me to the first non whitespace character of the
" line.
function! LMapping()
  let c = col(".")
  exec "normal! 80|"

  if c >= col(".")
    exec "normal! $"
  endif
endfun

function! LMappingVisual()
  let startc = col(".")
  exec "normal! gv80|\<esc>"
  let endc = col(".")

  if startc >= endc
    exec "normal! gv$"
  else
    exec "normal! gv"
  endif
endfun

"}}}
" Sort Plugins"{{{

" This function has no mapping.

" This function sorts my list of plugins at the top of this file by the plugin
" name... not by the actual line
function! SortPlugins()
  if exists(':Tabularize') && exists(':Vissort')
    "Save current cursor position. We will go back here once the function is done
    " Also save the search history
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Take me to the first line of the Plug list. This will be called top
    exec "normal! gg/Plug\<cr>"
    let top = line(".")

    " Open the fold and go to the last line of the Plug list. Set this line number
    " to bottom
    exec "normal! zo}k"
    let bottom = line(".")

    " Call tabularize to align all / slash characters in the plug block
    :Tabularize /\/
    " Move to the / character, and go ahead one word. This is the column I want to
    " sort.
    exec "normal! f/w"

    " Enter block visual mode, and move the cursor to the top of the block in the
    " Last column (I gave 200 because it is easier, and no line should be that
    " long anyways. And if there are, it should be unique before it reaches the
    " 200th column). Escape out of visual mode. This will save the bounds of the
    " visual selection in '< and '>
    exec "normal! \<c-v>"
    call cursor(top, 200)
    exec "normal! \<esc>"

    " Call Vissort on that column to sort it.
    :'<,'>Vissort

    " we are now on the bottom of the list. Loop this in order to get rid of the
    " alignment of the / character
    let currentLine = line(".")
    " Repeat this until I reach the top of the Plug list.
    while currentLine != top - 1
      exec "normal! f\/gEldwldwk0"
      let currentLine = line(".")
    endwhile
    " Close the fold
    exec "normal! zc"

    " Go back to where I was and restore the search history
    let @/=_s
    call cursor(l,c)
    call histdel("search", -1)

    echo "Plugins are Sorted..."

  else
    " Tabular or Vissort do not exist
    echoe "Tabular, or Vissort Not installed. Plugins are not Sorted!"
  endif
endfun

"}}}
"Add Commas to Numbers"{{{

function! AddCommas()
  exec "normal! 0f."
  let c = col(".")

  if c <= 1
    " No decimal point
    exec "normal! $"
    let numbers = col(".")
  else
    exec "normal! h"
    let numbers = col(".")
  endif

  " Only add commas for numbers >= 10,000
  if numbers >= 5
    exec "normal! hhi,"
    exec "normal! h"
    let numbers = col(".")

    " After the initial comma, add commas every 3 numbers afterwards.
    while numbers > 3
      exec "normal! hhi,"
      exec "normal! h"
      let numbers = col(".")
    endwhile
endif

  exec "normal! 0"

endfunction

"}}}
" Colourscheme Related"{{{

" The colour in the list deonted by the index is the default)
" The second field denotes whether to set the background
" 1 = set background=dark
" 0 = Do not set
" -1 = set background=light
" The 3rd field denotes whether or not to use their airline theme
let g:my_colours = [["iceberg", 0, 1],
                  \ ["badwolf", 0, 1],
                  \ ["gruvbox", 1, 1],
                  \ ["onedark", 0, 1],
                  \]

" Make a list of just the colour names
let g:colour_names = []
for colour in g:my_colours
  call add(colour_names, colour[0])
endfor

" ToggleColourScheme"{{{
" direction = next --> Go to the next colorscheme in the list
" direction = prev --> Go to the prev colorscheme in the list
" direction = setup --> This is the first execution, used as an initial
"                       colourscheme to use.
" direction = init --> This is the second execution, and assigns the
"                      colourscheme that we will actually be using.
function! ToggleColourScheme(direction)
  if (a:direction == "next")
    let g:index = g:index + 1
  elseif (a:direction == "prev")
    let g:index = g:index - 1
  endif

  if (g:index >= len(g:my_colours))
    let g:index = 0
  elseif (g:index < 0)
    let g:index = len(g:my_colours) - 1
  endif

  " Set the appropriate lightline theme
  if (g:my_colours[g:index][2] == 1)
    let g:lightline.colorscheme=g:my_colours[g:index][0]
  else
    let g:lightline.colorscheme="powerline"
  endif

  " Set the colorscheme
  exec 'colorscheme ' . g:my_colours[g:index][0]

  " Set the appropriate background level
  if (g:my_colours[g:index][1] == 1)
    set background=dark
  elseif (g:my_colours[g:index][1] == -1)
    set background=light
  endif

  " If this is not the first execution, then run these
  if (a:direction != "setup")
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endif

  if (a:direction != "setup")
    redraw
    echo g:my_colours[g:index][0]
  endif
endfun

"}}}

" Get DefaultColour"{{{
" This function finds the default colourscheme to use based on filetype
function! GetDefaultColour()
  " Setting up the default colourscheme
  if (&ft=='lua')
    " Default for lua
    " Badwolf has the best support for lua so we will use that as a default
    let g:index = index(g:colour_names, "badwolf")
  else
    " default for anything else
    let g:index = index(g:colour_names, "gruvbox")
  endif
endfunction

"}}}

"}}}

"}}}
" Function Mappings/ Settings"{{{

" HLNext"{{{

" Highlight matches when jumping to next
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

highlight WhiteOnRed ctermbg=red ctermfg=white guibg=red guifg=white
"}}}
" InsertTabWrapper"{{{

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"}}}
" VisualSelection"{{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>N
vnoremap <silent> # :call VisualSelection('b')<CR>N

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"}}}
" Underline Current Line"{{{

" Execute the above commands for underlining
nnoremap <leader>= :call UnderlineCurrentLineWithEquals()<cr>
nnoremap <leader>- :call UnderlineCurrentLineWithDash()<cr>
"}}}
" OpenMultipleFilesVSplit"{{{

nnoremap <f1> :call OpenMultipleFilesVSplit()<cr>
"}}}
"SaveVimSession"{{{

" nnoremap <f2> :call SaveVimSession()<cr>

"}}}
"RestoreVimSession"{{{

" nnoremap <f3> :call RestoreVimSession()<cr>

"}}}
" Togglenrformats - toggles functionality of ctrl+a and ctrl+x"{{{

nnoremap ! :call Togglenrformats()<cr>
"}}}

"}}}
" Autogroups/ Autocommands"{{{

" vimrcEx - filetypes, textwidth"{{{

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

"}}}
" markdownGroup"{{{

augroup markdownGroup
  autocmd!
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

"}}}
" spellCheck"{{{

augroup spellCheck
  autocmd!
  " Enable spellchecking for Markdown and gitcommit messages
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup END

"}}}
" MyFormattingSubs"{{{

augroup FormattingSubGroup
  autocmd!
  autocmd BufWritePre * :call MyFormattingSubs()
augroup END

"}}}
" DimInactiveWindows"{{{

let g:opt_DimInactiveWin=0
highlight Inactive ctermfg=237 guifg=#3a3a3a
function! ToggleDimInactiveWin()
  if g:opt_DimInactiveWin
    autocmd! DimWindows
    windo syntax clear Inactive
  else
    windo syntax region Inactive start='^' start='\vl' end='$'
    syntax clear Inactive
    augroup DimWindows
      autocmd BufEnter * syntax clear Inactive
      autocmd BufLeave * syntax region Inactive start='^' start='0' end='$'
    augroup end
  endif
  let g:opt_DimInactiveWin=!g:opt_DimInactiveWin
endfun

:call ToggleDimInactiveWin()

"}}}
" Format Options"{{{

augroup formatOptions
  autocmd!
  " Filetype specific text width
  autocmd FileType gitcommit setlocal textwidth=72


  " Auto wrap text using text width
  autocmd BufNewFile,BufRead * setlocal formatoptions+=t
  " Vim will not auto format a line that was already longer than textwidth
  autocmd BufNewFile,BufRead * setlocal formatoptions+=l
  " o = Do not automatically insert a comment character when I press o or O.
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o
  " Don't automatically add comment leader when pressing enter in insert mode
  autocmd BufNewFile,BufRead * setlocal formatoptions-=r
augroup END
"}}}

"}}}
" highlightings Before Colorscheme"{{{

" diffs"{{{

" when using vimdiff or diff mode
highlight diffadd    term=bold         ctermbg=darkgreen ctermfg=white  cterm=bold guibg=darkgreen  guifg=white    gui=bold
highlight difftext   term=reverse,bold ctermbg=lightblue ctermfg=black  cterm=bold guibg=darkred    guifg=yellow   gui=bold
highlight diffchange term=bold         ctermbg=black     ctermfg=white  cterm=bold guibg=black      guifg=white    gui=bold
highlight diffdelete term=none         ctermbg=darkred   ctermfg=white  cterm=none guibg=darkblue   guifg=darkblue gui=none

" when viewing a diff or patch file
highlight diffremoved term=bold ctermbg=black   ctermfg=red    cterm=bold guibg=darkred     guifg=white gui=none
highlight diffadded   term=bold ctermbg=black   ctermfg=green  cterm=bold guibg=darkgreen   guifg=white gui=none
highlight diffchanged term=bold ctermbg=black   ctermfg=yellow cterm=bold guibg=darkyellow  guifg=white gui=none
highlight diffline    term=bold ctermbg=magenta ctermfg=white  cterm=bold guibg=darkmagenta guifg=white gui=none
highlight difffile    term=bold ctermbg=yellow  ctermfg=black  cterm=none guibg=darkyellow  guifg=white gui=none
"}}}
" trailing whitespace"{{{

highlight highlighttrailingwhitespace ctermbg=white guibg=white

augroup trailingwhitespacegroup
  autocmd!
  autocmd bufwinenter * match highlighttrailingwhitespace /\s\+$/
  autocmd insertleave * match highlighttrailingwhitespace /\s\+$/
  autocmd insertenter * match highlighttrailingwhitespace /\s\+\%#\@<!$/
augroup end

"}}}
" highlighting for diminactivewindows()"{{{

highlight colorcolumn ctermfg=white
highlight colorcolumn guifg=white
"}}}
" highlightpast80"{{{

augroup vimrcex
  autocmd!
  autocmd filetype gitcommit let &colorcolumn="51"
augroup end

highlight colorcolumn ctermbg=red guibg=red

"}}}

"}}}


" Set the gitgutter sign column to be bg0 - same as the background
let g:gruvbox_sign_column="bg0"

" This sets my default colorscheme. I am putting this at the end of the file so
" that my other highlightings get influenced by the scheme
call GetDefaultColour()
call ToggleColourScheme("setup")

au BufRead,BufNewFile,BufEnter * call DoColour()
function DoColour()
  call GetDefaultColour()
  call ToggleColourScheme("init")
endfunction


" highlightings After Colorscheme"{{{

" trailing whitespace"{{{

highlight highlighttrailingwhitespace ctermbg=white guibg=white ctermfg=white guifg=white

augroup trailingwhitespacegroup
  autocmd!
  autocmd bufwinenter * match highlighttrailingwhitespace /\s\+$/
  autocmd insertleave * match highlighttrailingwhitespace /\s\+$/
  autocmd insertenter * match highlighttrailingwhitespace /\s\+\%#\@<!$/
augroup end

"}}}

" These conceals are basically only useful for programming, since they keep
" ascii characters as the actual source.

" Global Conceals"{{{
if has('conceal')
  au bufenter * syntax match Operator "==" conceal cchar=≡
  au bufenter * syntax match Operator "!=" conceal cchar=≠
  au bufenter * syntax match Operator ">=" conceal cchar=≥
  au bufenter * syntax match Operator "<=" conceal cchar=≤
  au bufenter * syntax match Operator "&nbsp;" conceal cchar=-

  au bufenter * hi! link Conceal Operator

  " Greek Alphabet {{{
  au bufenter * syntax match Greek "greek_alpha" conceal cchar=α
  au bufenter * syntax match Greek "greek_Alpha" conceal cchar=Α
  au bufenter * syntax match Greek "greek_beta" conceal cchar=β
  au bufenter * syntax match Greek "greek_Beta" conceal cchar=Β
  au bufenter * syntax match Greek "greek_gamma" conceal cchar=γ
  au bufenter * syntax match Greek "greek_Gamma" conceal cchar=Γ
  au bufenter * syntax match Greek "greek_delta" conceal cchar=δ
  au bufenter * syntax match Greek "greek_Delta" conceal cchar=Δ
  au bufenter * syntax match Greek "greek_epsilon" conceal cchar=ε
  au bufenter * syntax match Greek "greek_Epsilon" conceal cchar=Ε
  au bufenter * syntax match Greek "greek_zeta" conceal cchar=ζ
  au bufenter * syntax match Greek "greek_Zeta" conceal cchar=Ζ
  au bufenter * syntax match Greek "greek_eta" conceal cchar=η
  au bufenter * syntax match Greek "greek_Eta" conceal cchar=Η
  au bufenter * syntax match Greek "greek_theta" conceal cchar=θ
  au bufenter * syntax match Greek "greek_Theta" conceal cchar=Θ
  au bufenter * syntax match Greek "greek_iota" conceal cchar=ι
  au bufenter * syntax match Greek "greek_Iota" conceal cchar=Ι
  au bufenter * syntax match Greek "greek_kappa" conceal cchar=κ
  au bufenter * syntax match Greek "greek_Kappa" conceal cchar=Κ
  au bufenter * syntax match Greek "greek_lambda" conceal cchar=λ
  au bufenter * syntax match Greek "greek_Lambda" conceal cchar=Λ
  au bufenter * syntax match Greek "greek_mu" conceal cchar=μ
  au bufenter * syntax match Greek "greek_Mu" conceal cchar=Μ
  au bufenter * syntax match Greek "greek_nu" conceal cchar=ν
  au bufenter * syntax match Greek "greek_Nu" conceal cchar=Ν
  au bufenter * syntax match Greek "greek_xi" conceal cchar=ξ
  au bufenter * syntax match Greek "greek_Xi" conceal cchar=Ξ
  au bufenter * syntax match Greek "greek_omicron" conceal cchar=ο
  au bufenter * syntax match Greek "greek_Omicron" conceal cchar=Ο
  au bufenter * syntax match Greek "greek_pi" conceal cchar=π
  au bufenter * syntax match Greek "greek_Pi" conceal cchar=Π
  au bufenter * syntax match Greek "greek_rho" conceal cchar=ρ
  au bufenter * syntax match Greek "greek_Rho" conceal cchar=Ρ
  au bufenter * syntax match Greek "greek_sigma" conceal cchar=σ
  au bufenter * syntax match Greek "greek_Sigma" conceal cchar=Σ
  au bufenter * syntax match Greek "greek_tau" conceal cchar=τ
  au bufenter * syntax match Greek "greek_Tau" conceal cchar=Τ
  au bufenter * syntax match Greek "greek_upsilon" conceal cchar=υ
  au bufenter * syntax match Greek "greek_Upsilon" conceal cchar=Υ
  au bufenter * syntax match Greek "greek_phi" conceal cchar=φ
  au bufenter * syntax match Greek "greek_Phi" conceal cchar=Φ
  au bufenter * syntax match Greek "greek_chi" conceal cchar=χ
  au bufenter * syntax match Greek "greek_Chi" conceal cchar=Χ
  au bufenter * syntax match Greek "greek_psi" conceal cchar=ψ
  au bufenter * syntax match Greek "greek_Psi" conceal cchar=Ψ
  au bufenter * syntax match Greek "greek_omega" conceal cchar=ω
  au bufenter * syntax match Greek "greek_Omega" conceal cchar=Ω

  au bufenter * hi! link Conceal Greek
"}}}

  au bufenter * set conceallevel=2

  " Only conceal on the current line when it is a command line.
  " au bufenter * set concealcursor=c
  au bufenter * set concealcursor=c

endif

"}}}

"}}}


" This is only for CPEN 331 for using gdb with os161. I will remove this
" following the conclusion of this class.
cnoremap os161-gdb :ConqueGdbExe os161-gdb<cr>:ConqueGdb<cr>
cs add $REPOS/cpen331/src/cscope.out

