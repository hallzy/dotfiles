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
" _

"}}}

" Settings"{{{

set shell=/bin/bash
set title titlestring=

set clipboard=unnamed

set ttyfast
set lazyredraw

let $PATH='/usr/local/bin:' . $PATH

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=3
set notimeout

" highlight vertical column of cursor
augroup highlightCursorLine
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter * set cursorline
augroup END

set cursorline

" Leave paste mode on exit of insert mode
augroup pastegroup
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
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
set tildeop           " Tilde (~) changes case of letter. Setting this option lets
                      " the tilde have movement options
set pastetoggle=<f2>  " The toggle for paste mode is F2
set spelllang=en_ca

syntax on

filetype plugin indent on

set textwidth=80

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:>-,trail:-

set t_Co=256

set smartcase
set ignorecase
set noantialias

" Color scheme
colorscheme badwolf
set encoding=utf-8

" With both of these set, I get relative numbers, but the current line gets the
" line number
set number
set relativenumber

set numberwidth=5

set undolevels=1000

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set foldmethod=marker

" Keep the cursor in the middle of the page if possible
:set so=999

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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move splits with U<movement>
nnoremap UJ <C-W>J
nnoremap UK <C-W>K
nnoremap UL <C-W>L
nnoremap UH <C-W>H

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

" With a J move the current line up, with K move the current line down.
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" With a J move the current Selected lines up, with K move the current selected lines down.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"}}}
" H and L move to the beginning and end of the line"{{{

noremap H 0
noremap L $

"}}}
" Delete Surrounding"{{{

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

"}}}
"Create Closing Tag for HTML Tags"{{{

nnoremap cct F<yf>f>pF<a/<esc>hi

"}}}
" Escape removes trailing whitespace from eol"{{{

"esc now removes whitespace from the line that you are escaping from
inoremap <esc> <esc>:s/\s\+$//e<cr>

"}}}
"Evaluate a mathematical expression"{{{

" Calculate Math
xnoremap <space>c :!octave --silent \| cut -c8-<cr>
nnoremap <space>c v:!octave --silent \| cut -c8-<cr>

"}}}
" Make Errors"{{{

nnoremap <leader>m :cnext<cr>
nnoremap <leader>M :cprevious<cr>

"}}}
" For merge conflicts easily choose what version to use"{{{

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

nnoremap w W
nnoremap W B

nnoremap e E
nnoremap E gE

"}}}
" Extra mappings for saving and closing vim"{{{

nnoremap ZX :qa!<cr>
nnoremap ZA :wqa<cr>
nnoremap ZS :w<cr>

" Train myself to use the above Z commands and the default Z commands instead
cnoremap w<cr> :echoe "Use ZS"<cr>
cnoremap qa!<cr> :echoe "Use ZX"<cr>
cnoremap wqa<cr> :echoe "Use ZA"<cr>
cnoremap q!<cr> :echoe "Use ZQ"<cr>
cnoremap wq<cr> :echoe "Use ZZ"<cr>

"}}}

"}}}
" abbrevs"{{{

" Typo fixes"{{{

" Abbreviations that fix typos
iabbrev waht what
iabbrev adn and

"}}}

"}}}
" Plugins"{{{

" Easy Motion"{{{

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

" Disable when using multi cursors
function Multiple_cursors_before()
  call FanfingTasticDisable()
endfun

function Multiple_cursors_after()
  call FanfingTasticEnable()
endfun

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
endif

"}}}
" NERDTree"{{{

function! Test()
  NERDTree
  exec "normal! \<c-w>l"
endfun
" Start nerdtree automatically if I give vim a file name
" autocmd VimEnter * NERDTree
autocmd VimEnter * call Test()

function! Test2()
  if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  exec "normal! \<c-w>l"
endfun
" Start Nerdtree automatically if I don't give vim a file name.
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * call Test2()

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

" excludes any file in /tmp file, and commit messages.
let MRU_Exclude_Files = '^/tmp/.*\|.*/COMMIT_EDITMSG$'

" Only show most recent 20 files
let MRU_Max_Entries = 20

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
noremap ? :MultipleCursorsFind<space>

"}}}

"}}}
" Functions"{{{

" HLNext"{{{

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
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
function! s:MyFormattingSubs()
  "Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Note: Filetypes listed are excluded.
  " Note: Java is excluded because For CPEN 422 at UBC we are given a Java
          " project that would make lots of changes to many files which would
          " be a bit of a waste

  "Replace a tab wtih 2 spaces
  if (&filetype !~ 'make' &&
     \&filetype !~ 'xml' &&
     \&filetype != 'java')

    %s/\t/  /ge
  endif

  " Remove trailing whitespace
  if (&filetype != 'java')
    %s/\s\+$//ge
  endif

  " Change bracket spacings for me
  " Note: I need to exclude vim files from this otherwise vim will mess up the
  " BracketSpacing() function - There are spacings that would change in the
  " function implementation
  if &filetype !~ 'vim'
    call BracketSpacing()
  endif

  let @/=_s
  call cursor(l,c)
endfunction
"}}}
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
  autocmd BufWritePre * :call <SID>MyFormattingSubs()
augroup END

"}}}
" DimInactiveWindows"{{{

let opt_DimInactiveWin=0
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
" Highlightings"{{{

" Diffs"{{{

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
"}}}
" trailing whitespace"{{{

highlight highlightTrailingWhiteSpace ctermbg=White guibg=White

augroup trailingWhitespaceGroup
  autocmd!
  autocmd BufWinEnter * match highlightTrailingWhiteSpace /\s\+$/
  autocmd InsertLeave * match highlightTrailingWhiteSpace /\s\+$/
  autocmd InsertEnter * match highlightTrailingWhiteSpace /\s\+\%#\@<!$/
augroup END

"}}}
" Highlighting for DimInactiveWindows()"{{{

highlight colorcolumn ctermfg=white
highlight colorcolumn guifg=white
"}}}
" highlightpast80"{{{

" Make it obvious where 80 characters is
let &colorcolumn="81,82,".join(range(120,999),",")

augroup vimrcEx
  autocmd!
  autocmd FileType gitcommit let &colorcolumn="51,73,74,".join(range(120,999),",")
augroup END

highlight ColorColumn ctermbg=red guibg=red

"}}}

"}}}

