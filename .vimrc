set encoding=utf-8
scriptencoding utf-8
" =============================================================================
" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this file,
" You can obtain one at http://mozilla.org/MPL/2.0/.
"
" Copyright (c) 2015-2018, MPL Steven Hall <Hallzy.18@gmail.com>
"
" =============================================================================

" IMPORTANT NOTE: Do NOT set "gdefault" or "nogdefault". This vimrc file takes
" advantage of substitute commands. Therefore, setting one of these settings
" could mess up what was meant to happen in those substitute commands. If you
" are going to set one of these settings, make sure you change the substitute
" commands as necessary

" keys that I don't use so are free for mappings"{{{

"""" Normal Mode

" ^
" &
" #  -- this has been remapped to <nop>
" -
" =

"}}}

" vim-plug Settings"{{{

if has('gui_running')
  " Use the specified location, and suppress the git error.
  silent call plug#begin('~/vim/vimfiles/plugged')
else
  call plug#begin()
endif

" For fzf to have syntax highlighting in the preview window, install batcat
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-rooter'

Plug 'pangloss/vim-javascript', {'for': [ 'javascript' ]}

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jwalton512/vim-blade', {'for' : ['blade']}

Plug 'mattn/emmet-vim', {'for' : ['html', 'php', 'blade']}

" switch from source & headers
Plug 'vim-scripts/a.vim', {'for' : ['c', 'cpp']}

" Linting Engine
Plug 'w0rp/ale'

" Automatically print out paired characters like []
Plug 'jiangmiao/auto-pairs'

" Colourschemes
Plug 'dkasak/gruvbox'

Plug 'neovimhaskell/haskell-vim', {'for' : 'haskell' }

" CScope in vim
Plug 'brookhong/cscope.vim', {'for' : ['c', 'cpp']}

" Tries to detect indent settings of a file
Plug 'ciaranm/detectindent'

" Gravity syntax highlighting
Plug 'hallzy/gravity.vim', {'for' : 'gravity'}

" Shows vertical lines to show the indentation level
Plug 'Yggdroot/indentLine'

" Lightline Related
Plug 'itchyny/lightline.vim'

" File tree for vim
Plug 'scrooloose/nerdtree'

" Automatically alternates from relative to absolute line numbers depending on
" the editing mode I am in
Plug 'myusuf3/numbers.vim'

" Align text from different lines (I have this mapped to <leader>tz)
Plug 'godlygeek/tabular'
" Similar but offers a vim-like motion which is better in some cases, but it
" doesn't support as many delimiters as tabular
" NOTE that I found out regex's can be used for vim-easy-align which means it is
"      probably actually a better option that tabular now.
Plug 'junegunn/vim-easy-align'

" Adds a bunch of text objects including pairs of brackets or tags which also
" work over multiple lines, separators like commas, function arguments etc.
Plug 'wellle/targets.vim'

" Makes abbreviations easier by allowing multiple versions of a word and also
" matching cases. It also has a substitution command, and a search command.
" Instead of the normal substitution command, use ':Subvert' or ':S'. If subvert
" only has 1 argument it does a search.
" Also coercion to change text between snake_case, camelCase, MixedCase etc
Plug 'tpope/vim-abolish'

" If a file is already open in another terminal window, don't open it again,
" just focus that window for me.
Plug 'gioele/vim-autoswap'

" Toggle comments
Plug 'tpope/vim-commentary'
Plug 'hallzy/vim-context-commentstring'

" Dims inactive splits
Plug 'blueyed/vim-diminactive'

" Ends certain structures automatically, such as bash if statements, or vim
" functions etc.
Plug 'tpope/vim-endwise'

" A large list of common misspellings that will automatically be fixed.
Plug 'chip/vim-fat-finger'

" A git wrapper for vim, for example Gblame, Gstatus
Plug 'tpope/vim-fugitive'

" Support for encrypted files. If I try opening an encrypted file in vim it
" automatically runs GPG and prompts me to decrypt it for me.
Plug 'jamessan/vim-gnupg'

" Sublime style multiple cursors
Plug 'mg979/vim-visual-multi'

" Rename multiple files/folders using the power of vim
Plug 'qpkorr/vim-renamer'

" Used by many plugins to support being repeated with the '.' command
Plug 'tpope/vim-repeat'

" A better version of Damian Conway's DragVisuals
Plug 'zirrostig/vim-schlepp'

" Custom Motions
Plug 'christoomey/vim-sort-motion'
Plug 'chaoren/vim-wordmotion'

" Add, modify, or remove surround characters like quotes.
Plug 'tpope/vim-surround'

" Easy creation and modification of tables. Toggle with <leader>tm
Plug 'dhruvasagar/vim-table-mode'

"Custom text objects
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kentaro/vim-textobj-function-php', {'for' : ['php', 'blade']}

" vim linter
Plug 'syngan/vim-vimlint', {'for' : 'vim'}
Plug 'vim-jp/vim-vimlparser', {'for' : 'vim'}

" Block sorting. Differs from the sort motion in that I can select a visual
" block to sort by even if it isn't the first character of the line
Plug 'yaroot/vissort'

" Use ++ to calculate a block of numbers using sums, averages etc
Plug 'gavinbeatty/vmath.vim'

" Damian Conway's yankmatches. It yanks or cuts all lines that contain a match
" for your search
Plug 'hallzy/yankmatches.vim'

" Delete duplicated lines without sorting
Plug 'hallzy/delete-duplicate-lines.vim'

" This is separated from the rest of the list because it has to be after
" vim-textobj-comment, otherwise the comment text-object doesn't take effect.
Plug 'airblade/vim-gitgutter'

Plug 'hallzy/expression-evaluator.vim'

Plug 'StanAngelOff/php.vim', {'for' : ['php', 'blade']}

Plug 'hallzy/vim-php-manual', {'for' : ['php', 'blade']}

Plug 'linuxmagic/vdebug', {'for' : ['php', 'blade']}

call plug#end()

"}}}

" Settings"{{{

filetype plugin indent on

set shell=/bin/bash
set title titlestring=

set clipboard=unnamedplus

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

" Reduce timeout after <ESC> is received. This is only a good idea on fast links
set ttimeout
set ttimeoutlen=3
set timeoutlen=1
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
set spell
set nostartofline     " when using gg or G, stay in the same column
set virtualedit=block " Allow block selections to go past the last characters
set termguicolors     " Enables 24-bit RGB colours

set nrformats=hex,bin

syntax on

" Only do syntax highlighting for the first 81 columns. This improves
" performance for files with massively long lines like for example, a json file.
" Normally vim would slow to a crawl, but this prevents that. Given that columns
" past 80 don't highlight for me anyways, this makes no visual difference for me
" anyways.
" set synmaxcol=81

set textwidth=80
set colorcolumn=81

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Display extra white space
set list listchars=tab:>-,trail:-

set t_Co=256

" Ignore case sensitivity, unless I specify an Uppercase character. Then the
" string is case sensitive
set smartcase
set ignorecase

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

if has ('nvim')
  tnoremap <esc> <C-\><C-n>
  tnoremap UJ <C-\><C-n><C-w>j
  tnoremap UK <C-\><C-n><C-w>k
  tnoremap UL <C-\><C-n><C-w>l
  tnoremap UH <C-\><C-n><C-w>h
endif

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
" Shortcut for sourcing vimrc"{{{

" If $MYVIMRC does not work as a path, either add it, or replace it with the
" path of your vimrc file.
nnoremap <leader>sev :source $MYVIMRC<cr>

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
" first column. Otherwise take me to the first non white space character of the
" line.
nnoremap <silent> H :call HMapping()<cr>
onoremap <silent> H :call HMapping()<cr>
vnoremap <silent> H <esc>:call HMappingVisual()<cr>

nnoremap <silent> L :call LMapping()<cr>
onoremap <silent> L g_
vnoremap <silent> L <esc>:call LMappingVisual()<cr>


"}}}
" Escape removes trailing white space from eol"{{{

nnoremap <leader>tws :%s/\s\+$//g<cr>

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
" Extra mappings for saving and closing vim"{{{

nnoremap ZX :qa!<cr>
nnoremap ZA :wqa<cr>
nnoremap ZS :w<cr>

" When using q: or q/ or q? for some reason ZQ doesn't seem to work. Creating an
" explicit mapping makes it work.
nnoremap ZQ :q!<cr>

"}}}
" _ is now K - but special"{{{

" _ behaves like the default K, except for files of the "vim" or "help"
" file types, where it opens help
nnoremap <expr> _ OpenHelp()
vnoremap <expr> _ OpenHelp()

"}}}
" Use apostrophe instead of a back tick for going to marks"{{{

nnoremap ' `

"}}}
" ctrl+m, ctrl+h, ctrl+l"{{{

" ctrl+h moves cursor to the top of the screen
noremap <c-h> H
" ctrl+l moves cursor to the bottom of the screen
noremap <c-l> L

" zh moves the current line to the top of the screen
noremap zh zt
" zm moves the current line to the middle of the screen
noremap zm zz
" zh moves the current line to the top of the screen
noremap zl zb

" Move down and put the cursor and line at the top of the file. Also treat
" wrapped lines as new lines when moving up and down
noremap j gjzt
" Move up and put the cursor and line at the bottom of the file. Also treat
" wrapped lines as new lines when moving up and down
noremap k gkzb

" easier combinations. Consider the scenario where I use j to move down to a
" line, but I go past the line. Then I press k to go back up to the line, but
" now my cursor is towards the bottom of the screen when I would prefer it to be
" at the top, as if I was pressing j to go down, but without moving to the line
" below. Basically, these mappings shift the screen just as j and k do, but
" without moving my cursor up or down a line.
noremap <c-k> zb
noremap <c-j> zt

"}}}
" Fix previous and next spelling mistakes"{{{

nnoremap <silent> <leader>sp :normal! mzw[s1z=`z<cr>:delmarks z<cr>
nnoremap <silent> <leader>sn :normal! mz]s1z=`z<cr>:delmarks z<cr>

"}}}
" Command line mode"{{{

" Custom mappings for command line mode so that the default / ? and : keys open
" command line mode

nnoremap / q/i
vnoremap / q/i

nnoremap ? q?i
vnoremap ? q?i

nnoremap : q:i
vnoremap : q:i



" Also, preserve a way to get the original functionality back. For instance, if
" I want the default behaviour, or if I am recording a macro. As you can see
" with the above commands, it first performs a "q" command, which closes a
" macro. So doing either of those in a macro stops the macro and I need these 4
" following mappings to get around that.

nnoremap <leader>/ /
vnoremap <leader>/ /

nnoremap <leader>? ?
vnoremap <leader>? ?

nnoremap <leader>: :
vnoremap <leader>: :

"}}}
" Vim Easy-Mode"{{{

" This is a mode for others to use. Because my vimrc is so customized, I imagine
" it being difficult for others to use. This will load the open file with a
" minimalistic vimrc file.
nnoremap <silent> <leader>em :!vim -u $dotfiles/.vimrc-others %<cr>

"}}}
" Units"{{{

" Convert units using the external units command
nnoremap <silent> <leader>u :call Units()<cr>

"}}}
" Bold a words using markdown syntax"{{{

nnoremap <c-b> viw<esc>a**<esc>`<i**<esc>
vnoremap <c-b> <esc>`>a**<esc>`<i**<esc>

"}}}
" Insert the current date"{{{

nnoremap <leader>icd i<C-R>=strftime('%Y/%m/%d')<cr><esc>

"}}}

"}}}
" abbrevs"{{{

" spelling"{{{

" These are all in ~/.vim/after/plugin/abolish.vim

"}}}
" Greek Alphabet"{{{

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
" Math"{{{

inoremap forall''          ∀
inoremap thereexists''     ∃
inoremap therefore''       ∴
inoremap because''         ∵
inoremap in''              ∈
inoremap notin''           ∉
inoremap intersect''       ∩
inoremap union''           ∪
inoremap subset''          ⊂
inoremap subset_eq''       ⊆
inoremap integral''        ∫
inoremap double_integral'' ∬
inoremap natural''         ℕ
inoremap integer''         ℤ
inoremap rational''        ℚ
inoremap real''            ℝ
inoremap complex''         ℂ
inoremap prime''           ℙ

inoremap join''            ⋈

"}}}
" Other"{{{

inoremap degrees'' °

"}}}

"}}}
" Plugins"{{{

" NERDTree"{{{

function! OpenNerdTreeStartup()
  NERDTree
  exec "normal! \<c-w>l"
endfun

augroup NerdTreeStartup
  autocmd!
  " Start nerdtree automatically if I give vim a file name
  autocmd VimEnter * call OpenNerdTreeStartup()

  " New tabs, open nerdtree too
  autocmd BufWinEnter * silent! NERDTreeMirror
augroup END


" Toggle nerdtree
noremap <F8> :NERDTreeToggle<CR>
" Current file in nerdtree
noremap <F9> :NERDTreeFind<CR>

"}}}
" vmath"{{{

"For using vmath.vim
vnoremap ++  y:call VMATH_Analyse()<CR>
nnoremap ++  vipy:call VMATH_Analyse()<CR>

"}}}
" vim-schlepp "{{{

" Improved form of dragvisuals

" Move
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

" Duplicate
vmap Dk      <Plug>SchleppDupUp
vmap Dj      <Plug>SchleppDupDown
vmap Dh      <Plug>SchleppDupLeft
vmap Dl      <Plug>SchleppDupRight

let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlocks = 1

" " Remove any introduced trailing white space after moving...
let g:Schlepp#dupTrimWS = 1

"}}}
" vim-gitgutter"{{{

" This makes the diff updates happen more frequently. The default is 4000. This
" value is measured in ms.
set updatetime=1000

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Now the sign column will always be open
set signcolumn=yes

"}}}
" Lightline - Status Bar"{{{

" Use the powerline theme
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'component': {
      \ 'fugitive': '%{exists("*fugitive#head")?"BR: " . fugitive#head():""}',
      \ 'lineinfo': "LN %l/%{line('$')}",
      \ 'colinfo': 'COL %-2v',
      \ 'charvaluehex' : 'char: 0x%B',
  \ },
  \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
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
    \           [ 'fugitive', 'readonly', 'relativepath', 'modified' ]],
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
" ALE"{{{

nnoremap <silent> ]e :ALENextWrap<cr>
nnoremap <silent> [e :ALEPreviousWrap<cr>

"}}}
" Cscope"{{{

set cscopetag
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>ll :call ToggleLocationList()<CR>

"}}}
" Tabularize Mapping"{{{

noremap <leader>tz :Tabularize /

"}}}
" EasyAlign"{{{

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<cr>

"}}}
" Vissort"{{{

" Make vissort case insensitive
let g:vissort_option= 'i'

"}}}
" Vim table mode"{{{

" Make the tables markdown compatible
let g:table_mode_corner='|'

"}}}
" vim-surround"{{{

let b:surround_indent = 1

"}}}
" DetectIndent"{{{

" NOTE: Specific filetype settings can be set in ~/.vim/after/ftplugin

" When the correct value of expandtab cannot be determined, treat it as though
" expandtab is set, meaning that pressing tab gives x number of spaces
let g:detectindent_preferred_expandtab = 1

" When indent size cannot be determined use 4
let g:detectindent_preferred_indent = 4


" Automatically run detectIndent
augroup detectIndentGroup
  autocmd!
  autocmd BufReadPost * :DetectIndent
augroup END

function! CheckExpandTab()
  " If expandtab is off, then set the tabs to be 4 columns long
  if (&expandtab == 0)
    set tabstop=4
  endif
endfunction

augroup checkExpandTabGroup
  autocmd!
  autocmd BufReadPost * :call CheckExpandTab()
augroup END

"}}}
" Indentline"{{{

let g:indentLine_char = '│'
let g:indentLine_first_char='│'
let g:indentLine_showFirstIndentLevel=1

" Use the colour of gruvbox comments. Looks descent for my colourschemes
let g:indentLine_color_term = 245
let g:indentLine_color_gui = '#928374'

"}}}
" vim-gnupg"{{{

" Source an external file that contains recipients. I keep it external so I don't
" push identities of people I know. Identities can be found using the
" \"gpg--list-keys" Command. The gpg_recipients.vim file looks like this:
" let g:GPGPossibleRecipients=[
"   \"Steven Hall <Hallzy.18@gmail.com>",
"   \"Someone Else <other@person.com>"
"   \]
if filereadable($dotfiles . '/gpg_recipients.vim')
  source $dotfiles/gpg_recipients.vim
endif

"}}}
" Renamer"{{{

nmap <leader>rr <Plug>RenamerStart
nnoremap <leader>rs :Ren<cr>
nnoremap <leader>rd :call renamer#DeleteEntry()<CR>

"}}}
" vim-diminactive"{{{

" Dim inactive splits
let g:diminactive_enable_focus = 1

"}}}
" yankmatches"{{{

" YankMatches is used to yank complete lines that have a search term on them
" into one register for easy pasting.

" Delete all lines that match the search
" Saves the deleted lines in a register
nnoremap <silent> dm  :     call ForAllMatches('delete', {})<CR>
" Delete all lines that DON'T match the search
" Saves the deleted lines in a register
nnoremap <silent> dM  :     call ForAllMatches('delete', {'inverse':1})<CR>
" Copies all lines that match the search
" Saves those copied lines into a register
nnoremap <silent> ym  :     call ForAllMatches('yank',   {})<CR>
" Copies all lines that DON'T match the search
" Saves those copied lines into a register
nnoremap <silent> yM  :     call ForAllMatches('yank',   {'inverse':1})<CR>
" Deletes all lines that match the search that are inside your visual selection
" Saves those deleted lines into a register
vnoremap <silent> Dm  :<C-U>call ForAllMatches('delete', {'visual':1})<CR>
" Deletes all lines that DON'T match the search that are inside your visual
" selection
" Saves those deleted lines into a register
vnoremap <silent> DM  :<C-U>call ForAllMatches('delete', {'visual':1, 'inverse':1})<CR>
" Copies all lines that match the search that are inside your visual selection
" Saves those copied lines into a register
vnoremap <silent> Ym  :<C-U>call ForAllMatches('yank',   {'visual':1})<CR>
" Copies all lines that DON'T match the search that are inside your visual
" selection
" Saves those copied lines into a register
vnoremap <silent> YM  :<C-U>call ForAllMatches('yank',   {'visual':1, 'inverse':1})<CR>

"}}}
" vim-wordmotion"{{{

" Set this to the characters you want to treat the same as a space. This means
" that the w, e, b, and ge movements won't stop on these characters.

" The default is set to '_'.

" Example of multiple characters is '_.-'

" I am setting it to nothing so that i can use them as stopping points for a
" motion
let g:wordmotion_spaces = ''

"}}}
" vim-commentary"{{{


" Custom vim-commentary filetype specific comments
augroup vimCommentary
  autocmd!
  " VBScript uses a single quote to denote comments
  autocmd FileType vb setlocal commentstring='\ %s

  " Batch scripts use "::" denote comments
  autocmd FileType dosbatch setlocal commentstring=::\ %s

  " Awk scripts use "#" denote comments
  autocmd FileType awk setlocal commentstring=#\ %s

  " Override PHP Comments. I am making it the HTML comment string, since
  " everything in a PHP file is HTML unless stated otherwise. The Plugin
  " 'vim-context-commentstring' will take care of the context for me.
  autocmd FileType php setlocal commentstring=<!--\ %s\ -->
augroup END

"}}}
" Delete Duplicate lines"{{{

" A note about both of these mappings: The duplicated lines are saved in
" register d, so you can get access to the lines you just deleted with these
" commands if you need.

" Normal mode version will automatically remove duplicates from the current
" paragraph
nmap <leader>d <Plug>DeleteDuplicateLines
nmap <leader>D <Plug>DeleteAllButUnique

" Visual mode version will remove duplicates from the current visually selected
" lines
vmap <leader>d <Plug>DeleteDuplicateLinesVisual
vmap <leader>D <Plug>DeleteAllButUniqueVisual

"}}}
" Expression Evaluator"{{{

" I used to do this with Octave. However, that was significantly slower, and
" requires an extra dependency. This new solution just uses the built in
" expression register.
nmap <leader>c <Plug>ExpressionEvaluatorNormal
xmap <leader>c <Plug>ExpressionEvaluatorVisual

nmap <leader>C <Plug>ExpressionEvaluatorAnswerOnlyNormal
xmap <leader>C <Plug>ExpressionEvaluatorAnswerOnlyVisual

"}}}
" vim_sort_motion"{{{

let g:sort_motion_visual_block_command = 'Vissort'

"}}}
" FZF{{{

" Custom command to use grep to search lines of files in a git repository
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"}}}
" hexokinase{{{

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

let g:Hexokinase_highlighters = ['backgroundfull']

"}}}
" haskell-vim{{{

let g:haskell_indent_disable = 1

"}}}

"}}}
" Functions"{{{

" HLNext"{{{

" Blink the next selection of a search
function! HLNext ()
  let l:target_pat = '\c\%#\%('.@/.'\)'

  let l:ring = matchadd('WhiteOnRed', l:target_pat, 101)
  redraw
  sleep 20m

  call matchdelete(l:ring)
  redraw
  sleep 20m

  let l:ring = matchadd('WhiteOnRed', l:target_pat, 101)
  redraw
  sleep 20m

  call matchdelete(l:ring)
  redraw

endfunction
"}}}
" Tab Completion - InsertTabWrapper"{{{

" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let l:col = virtcol('.')
    let l:firstNonWhitespaceCol = indent(line('.')) + 1
    if l:col <= l:firstNonWhitespaceCol
        return "\<tab>"
    else
        return repeat(" ", &tabstop)
    endif
endfunction
"}}}
" AddCurlyBraces"{{{

function! AddCurlyBraces()
  :exe "normal! $a\<space>{\<esc>jo}\<esc>"
endfun

"}}}
" VisualSelection - perform search and replacements for visual text"{{{

" This is used for the next function
function! CmdLine(str)
    exe 'menu Foo.Bar :' . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Perform searches and replacements for visually selected text
function! VisualSelection(direction) range
  " Temporarily store your last yank as a temp variable
  let l:saved_reg = @"
  " Selects and yanks the highlighted text
  execute 'normal! vgvy'

  " if the highlighted text has any of these special characters, then escape
  " them with a \
  let l:pattern = escape(@", '\\/.*$^~[]')
  " Get rid of next line characters in the highlighted text
  let l:pattern = join(split(l:pattern, "\n"), '\n')

  let @/ = l:pattern

  " Search for highlighted text
  if a:direction ==? 'b'
      execute "normal! ?\<C-R>/\<cr>"
  " substitute highlighted text
  elseif a:direction ==? 'replace'
      call CmdLine('%s' . '/'. l:pattern . '/')
  " Search for highlighted text
  elseif a:direction ==? 'f'
      execute "normal! /\<C-R>/\<cr>"
  endif

  "Restore your last yank bank into the " register
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
"}}}
" Underline the current line"{{{

" Underline the current line with a -
function! UnderlineCurrentLineWithDash()
  exe 'normal! $'
  let l:c = col('.')
  exe 'normal! o'

  while l:c > 0
    exe 'normal! i-'
    let l:c -= 1
  endwhile
endfunc

"Underline the current line with =
function! UnderlineCurrentLineWithEquals()
  exe 'normal! $'
  let l:c = col('.')
  exe 'normal! o'

  while l:c > 0
    exe 'normal! i='
    let l:c -= 1
  endwhile
endfunc
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
  if &nrformats ==? ''
    set nrformats=hex,bin,octal,alpha
  elseif &nrformats ==? 'hex,bin,octal,alpha'
    set nrformats=hex,bin,octal
  elseif &nrformats ==? 'hex,bin,octal'
    set nrformats=hex,bin
  elseif &nrformats ==? 'hex,bin'
    set nrformats=hex
  elseif &nrformats ==? 'hex'
    set nrformats=
  else
    set nrformats=hex,bin,octal,alpha
  endif
  echo &nrformats
endfun
"}}}
" Functions for moving lines and blocks up and down"{{{

" Note that there are no down functions because it was really easy to implement
" as part of the mappings only.

"Move Line Up"{{{

function! MoveLineUp()
  let l:currentLine = line('.')
  let l:lastLine = line('$')

  if l:currentLine == l:lastLine
    " Do this on the bottom of the file otherwise the line will go up 2 lines
    " instead of one
    exec 'normal! ddP=='
  elseif l:currentLine == 1
    " Don't go off the top of the page
  else
    " For anywhere else in the file, do this
    exec 'normal! ddkP=='
  endif
endfun

"}}}
" Move Selection Up"{{{

function! MoveSelectionUp()
  " Selects the top part of the visual selection and Save that line number
  exec "normal! '<"
  let l:currentLineTop = line('.')

  " Selects the block, with the cursor on the bottom of the block and Save that
  " line number
  exec "normal! V'>"
  let l:currentLineBottom = line('.')

  let l:lastLine = line('$')

  if l:currentLineBottom == l:lastLine
    " Do this on the bottom of the file otherwise the line will go up 2 lines
    exec 'normal! gvdP`[V`]=gv'
  elseif l:currentLineTop == 1
    " Don't go off the top of the page
  else
    exec 'normal! gvdkP`[V`]=gv'
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
"HMapping()"{{{

" If I am on the first character of a line, and press H, take me to the
" first column. Otherwise take me to the first non whitespace character of the
" line.
function! HMapping()
  let l:c = col('.')
  " g is so it treats a word wrap as a newline
  exec 'normal! g^'

  if l:c <= col('.')
    " g is so it treats a word wrap as a newline
    exec 'normal! g0'
  endif
endfun

function! HMappingVisual()
  let l:startc = col('.')
  " second g is so it treats a word wrap as a newline
  exec "normal! gvg^\<esc>"
  let l:endc = col('.')

  if l:startc <= l:endc
    " second g is so it treats a word wrap as a newline
    exec 'normal! gvg0'
  else
    exec 'normal! gv'
  endif
endfun

"}}}
"LMapping()"{{{

" If I am to the left of the 80th column and press L, take me to the last space
" character before the 80th column. Otherwise take me to the end of the line.

" Get the column number as seen on screen (ex, a line that is wrapped to another
" line will have its column count reset because as it is seen, its column
" restarts)
function! GetLineWrappedColumn()
  " +2 For gitgutter adding 2 extra columns to the gutter
  let l:numberwidth = &numberwidth + 2
  " windwidth(0) is the column width of the current buffer
  " &numberwidth is the wdith of the gutter
  let l:number_of_wraps = (col('.')-1) / (winwidth(0) - l:numberwidth)
  if l:number_of_wraps > 0
    return col('.') - l:number_of_wraps*(winwidth(0) - l:numberwidth)
  else
    return col('.')
  endif
endfunction

function! LMapping()
  let l:c = GetLineWrappedColumn()
  exec 'normal! g$'
  if GetLineWrappedColumn() <= 80
    " If my current position after moving to the end of the line is at 80 or
    " less, then just move to the end of the line and leave it, because you have
    " reached the end of the line.
    return
  endif

  " g0 to go to the beginning of the line wrapped line
  " 79l to move 79 columns right
  exec 'normal! g079lF '

  " If my cursor position is further right than the last space until the 80th
  " column, then go to the end of the line
  if l:c >= GetLineWrappedColumn()
    " the g makes it so that it won't go to the end of a wrapped line
    exec 'normal! g$'

    " If I am not more to the right than the 80th column, then move to the first
    " space character before the 80th column.
  else
    " c is now the 80th column
    exec 'normal! g079l'
    let l:c = GetLineWrappedColumn()
    " move to the next space character
    exec 'normal! f '
    " of the 81st column is not a space, then go to the previous space
    if l:c+1 != GetLineWrappedColumn()
      exec 'normal! F '
      if GetLineWrappedColumn() <= 60
        " If after that last move to the previous space, we are further to the
        " left than the 60th column, just go to the 80th column because now we
        " are just too far.
        exec 'normal! g079l'
      endif
    endif
    " Otherwise, just stay on the 81st column
  endif
endfun

function! LMappingVisual()
  let l:startc = GetLineWrappedColumn()
  exec "normal! gvg079l\<esc>"
  let l:endc = GetLineWrappedColumn()

  if l:startc >= l:endc
    " the second g makes it so that it won't go to the end of a wrapped line
    exec 'normal! gvg$'
  else
    exec 'normal! gv'
  endif
endfun

"}}}
" Colourscheme Related"{{{

let g:gruvbox_contrast_dark='hard'

" Set the gitgutter sign column to be bg0 - same as the background
let g:gruvbox_sign_column='bg0'

set background=dark
colorscheme gruvbox

"}}}

"}}}
" Units Function"{{{

" This function uses the units bash program to convert values. Upon execution,
" the function will ask for the starting value and units (default value is 1),
" and the destination units. It will then use the units program to find the
" converted value. The answer will be stored in register @a, the source in
" register @s and the destination in register @d. The values will also be shown
" in the bottom of the page after function execution.

" If you do not type in any information at the prompts, the function checks @s
" and @d for inputs and uses those as defaults, so you can copy a value into
" those registers directly from vim. They just can't have a newline on them.
function! Units()
  let l:source = input('Enter Starting Units: ')
  let l:dest = input('Enter the Units that you Want: ')

  " If the above variables are empty because the user did not enter anything,
  " assume we are using the @s and @d registers.
  if l:source ==? ''
    let l:source = @s
  endif

  if l:dest ==? ''
    let l:dest = @d
  endif


  let l:mycommand = ':read !units "' . l:source . '" "' . l:dest .
        \ '" | grep -oP "\* \K.*" || echo ''AnErrorOcurred'''

  exec l:mycommand
  " Append the units to the end of the answer
  exec 'normal! A ' . l:dest
  " Save the answer in register 'a'
  exec 'normal! ^vg_"adddk'

  if @a =~# 'AnErrorOcurred'
    echoe 'An Error Occurred during Conversion. Double check that the units you
          \ are using are recognized by "units". Check the config file
          \ specified with the command: "units -U"'

  else
    let @s = l:source
    let @d = l:dest
    " Report the answer and save everything into a register
    let l:REPORT_GAP = 5  "spaces between components
    let l:gap = repeat(' ', l:REPORT_GAP)
    highlight NormalUnderlined term=underline cterm=underline gui=underline

    echohl NormalUnderlined
    echon 'a'
    echohl NONE
    echon  'nswer: ' . @a . l:gap

    echohl NormalUnderlined
    echo  's'
    echohl NONE
    echon  'rc: ' . @s . l:gap

    echohl NormalUnderlined
    echon 'd'
    echohl NONE
    echon  'est: ' . @d . l:gap
  endif

endfunction

"}}}
" Append to copy"{{{

" This is From Damian Conway
" NOTE: that I am using '@+' because I use the unnamedplus register for my
" clipboard. This will not work if you use a different register

" The delete commands are my own modifications

" Y Commands"{{{

" Make v<motions>Y act like an incremental v<motion>y
vnoremap <silent> YY  <ESC>:silent let @y = @+<CR>gv"Yy:silent let @+ = @y<CR>

" Make Y<motion> act like an incremental y<motion>
nnoremap <silent><expr> Y  Incremental_Y()

function! Incremental_Y ()
  " After the Y operator, read in the associated motion
  let l:motion = nr2char(getchar())

  " If it's a (slowly typed) YY, do the optimized version instead (see below)
  if l:motion ==# 'Y'
    call Incremental_YY()
    return

  " If it's a text object, read in the associated motion
  elseif l:motion =~? '[ia]'
    let l:motion .= nr2char(getchar())

  " If it's a search, read in the associated pattern
  elseif l:motion =~? '[/?]'
    let l:motion .= input(l:motion) . "\<CR>"
  endif

  " Copy the current contents of the default register into the 'y register
  let @y = @+

  " Return a command sequence that yanks into the 'Y register,
  " then assigns that cumulative yank back to the default register
  return '"Yy' . l:motion . ':let @+ = @y' . "\<CR>"
endfunction


" Make YY act like an incremental yy
nnoremap <silent>  YY  :call Incremental_YY()<CR>

function! Incremental_YY () range
  " Grab all specified lines and append them to the default register
  let @+ .= join(getline(a:firstline, a:lastline), "\n") . "\n"
endfunction

"}}}
" D Commands"{{{

" Make v<motions>Y act like an incremental v<motion>y
vnoremap <silent> DD  <ESC>:silent let @y = @+<CR>gv"Yd:silent let @+ = @y<CR>

" Make Y<motion> act like an incremental y<motion>
nnoremap <silent><expr> D  Incremental_D()

function! Incremental_D ()
  " After the D operator, read in the associated motion
  let l:motion = nr2char(getchar())

  " If it's a (slowly typed) DD, do the optimized version instead (see below)
  if l:motion ==# 'D'
    call Incremental_DD()
    return

  " If it's a text object, read in the associated motion
  elseif l:motion =~? '[ia]'
    let l:motion .= nr2char(getchar())

  " If it's a search, read in the associated pattern
  elseif l:motion =~? '[/?]'
    let l:motion .= input(l:motion) . "\<CR>"
  endif

  " Copy the current contents of the default register into the 'y register
  let @y = @+

  " Return a command sequence that deletes into the 'Y register,
  " then assigns that cumulative delete back to the default register
  return '"Yd' . l:motion . ':let @+ = @y' . "\<CR>"
endfunction

" Make DD act like an incremental dd
nnoremap <silent>  DD  :call Incremental_DD()<CR>

function! Incremental_DD () range
  " Grab all specified lines and append them to the default register
  let @+ .= join(getline(a:firstline, a:lastline), "\n") . "\n"
  :d _
endfunction

"}}}

"}}}
" Writable Search Register"{{{

function! ReadInputUntilNotNumber()
  let l:done = 0
  let l:input = ''
  while !l:done
    let l:input .= nr2char(getchar())
    " Check if input is a number
    let l:done = l:input !~# '^\d\+$'
  endwhile
  return l:input
endfunction

function! WritableSearchRegister(mode)
  " String list of commands that put me into insert mode
  let l:ops_to_insert_mode = 'cCsS'

  let l:no_motion_ops = 'YDCSs'

  " Take first argument which should be an operation like yank or delete
  " It could also be a number though, which is why I am calling this custom
  " function
    let l:op = ReadInputUntilNotNumber()

  " If the operator is one that puts me into insert mode, then let me know!
  let l:insert_mode = 'false'
  if l:ops_to_insert_mode =~# l:op
    let l:insert_mode = 'true'
  endif

  " If the operator doesn't use a motion, then we will skip getting the motion
  " Also, the mode has to be normal, as a visual selection doesn't need a motion
  if l:no_motion_ops !~# l:op && a:mode ==# 'normal'
    " Now take the second which should be a motion of some sort
    let l:motion = ReadInputUntilNotNumber()

    " If it's a text object, read in the associated motion
    if l:motion =~? '[ia]'
      let l:motion .= ReadInputUntilNotNumber()

      " If it's a search, read in the associated pattern
    elseif l:motion =~? '[/?]'
      let l:motion .= input(l:motion) . "\<CR>"
    endif
  else
    let l:motion = ''
  endif

  " Save the current contents of register z into a variable
  let g:reg_z = @z

  if l:insert_mode ==# 'true'
    let g:suffix = 'a'
  else
    let g:suffix = ''
  endif


  " Perform the operation with the motion, saving the data into register z
  let l:cmd = '"z' . l:op . l:motion
  " Make sure we are in normal mode
  let l:cmd .= "\<esc>"
  "Replace newline characters with a literal '\n'
  let l:cmd .= ":let @z = join(split(@z, \"\\n\"), '\\n')\<cr>"
  " Save the content of register z into the search register
  let l:cmd .= ":let @/ = @z\<cr>"
  " Restore the contents of register z
  let l:cmd .= ":let @z = g:reg_z\<cr>"
  " If our operation is supposed to put us into insert mode, do it
  let l:cmd .= g:suffix
  echom l:cmd
  return l:cmd
endfunction

"}}}
" Edit Vim Registers"{{{

function! EditRegister()
  " Ask user what register to edit
  echom 'What register to edit? '

  " Get that register, convert the input to a character and lowercase it
  let l:register = tolower(nr2char(getchar()))

  " If the register provided is not alphanumeric, or it is not * + - or " then
  " fail
  if l:register !~# '^[a-z0-9\*\+\-"]$'
    echo 'Invalid register [' . l:register . ']'
    echo 'Valid registers are alphanumerics or * + - "'
    return
  endif

  " The buffer name we assign needs to be escaped for registers * and "
  if l:register =~# '^[\*"]$'
    let l:registerFileName = '\' . l:register
  else
    let l:registerFileName = l:register
  endif

  " Create a new horizontal split that is 5 rows tall
  new
  resize 5

  " Paste whatever is in the provided register into this new split window
  exec 'normal! "' . l:register . 'p'

  " Change the buffer name to be the register that was provided
  silent exec 'file ' . l:registerFileName

  " Set the file as not modified
  set nomodified

  " Save the register in a variable for this buffer only
  let b:register = l:register

  " Add a new mapping to this new buffer to save the register
  nnoremap <buffer> <leader>sr :call SaveRegister()<cr>
endfunction

" Why does new lines and <cr> always use the ^M thing?
function! SaveRegister()
  " Copy the text from the 'register buffer' to the register
  exec 'normal! gg0vG$h"' . b:register . 'y'

  " The above is not good enough. If we saved the register and it has control
  " characters or escapes, they won't be converted properly. Do the below as
  " well. This will allow the use of control characters

  " Set the register variable to the contents of the register
  exec ':let @' . b:register . ' = "' . getreg(b:register) . '"'

  " Close the register buffer
  q!
endfunction

" Edit Specified Register
nnoremap <leader>er :call EditRegister()<cr>
" Set a dummy mapping by default
nnoremap <leader>sr :echoe 'Select a register first'<cr>

"}}}

" Function Mappings/ Settings"{{{

" HLNext"{{{

" Highlight matches when jumping to next
" This rewires n and N to do the highlighting...
nnoremap <silent> n   n:call HLNext()<cr>
nnoremap <silent> N   N:call HLNext()<cr>

highlight WhiteOnRed ctermbg=red ctermfg=white guibg=red guifg=white
"}}}
" InsertTabWrapper"{{{

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"}}}
" VisualSelection"{{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>N
vnoremap <silent> # :call VisualSelection('b')<CR>n

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"}}}
" Underline Current Line"{{{

" Execute the above commands for underlining
nnoremap <leader>= :call UnderlineCurrentLineWithEquals()<cr>
nnoremap <leader>- :call UnderlineCurrentLineWithDash()<cr>
"}}}
" Togglenrformats - toggles functionality of ctrl+a and ctrl+x"{{{

nnoremap ! :call Togglenrformats()<cr>
"}}}
" TruncateSurroundingWhitespaceofVisualSelection"{{{

" Given a visual selection, reselect that exact visual selection but eliminate
" any spaces at the beginning or end of the visual selection. For instance, if
" you visually select '   testing this text      ' then the visual selection
" becomes 'testing this text'. The spaces on the outside are still there, but
" they won't be selected visually.

function! TruncateSurroundingWhitespaceofVisualSelection()
  " Find out what character is at each end of the visual selection

  " We will use the y and z registers to save those, so backup the current
  " contents of those registers first
  let l:y = @y
  let @y  = ''
  let l:z = @z
  let @z  = ''

  " now get the beginning and end character
  " I am also saving the beginning and ending of the visual selections in
  " separate marks. This is because if you do a visual selection backwards the <
  " and > marks get all messed up.
  exec 'normal! `<"yylmy'
  exec 'normal! `>"zylmz'
  let l:begin = @y
  let l:end = @z

  " Reset the registers
  let @y  = l:y
  let @z  = l:z

  " Go to the beginning of the selection
  exec 'normal! `y'
  " If the beginning character happens to be a space then move forward a word
  if l:begin ==# ' '
    exec 'normal! w'
  endif
  " save the current location in the visual mark
  exec 'normal! m<'

  " Go to the ending of the selection
  exec 'normal! `z'
  if l:end ==# ' '
    " If the ending character happens to be a space then move back to the end of
    " the previous word
    exec 'normal! ge'
  endif
  " save the current location in the visual mark
  exec 'normal! m>'

  " Don't need the marks anymore
  delmarks y
  delmarks z

  " Restore the visual selection
  exec 'normal! gv'
endfunction

vnoremap <leader>v :call TruncateSurroundingWhitespaceofVisualSelection()<cr>

"}}}
" Writable Search Register"{{{

" use nmap instead of nnoremap so that custom objects like lines work
nmap <silent><expr> g/ WritableSearchRegister('normal')

" This mapping is more useless since the '*' does almost the same thing. The
" biggest difference is that '*' searches for strings literally, while mine
" allows you to copy a line that could be a regex, and use the regex for a
" search
vmap <silent><expr> g/ WritableSearchRegister('visual')

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
" template files "{{{

augroup templateGroup
  autocmd!
  autocmd BufRead,BufNewFile *.css.template set filetype=css
  autocmd BufRead,BufNewFile *.js.template set filetype=javascript
  autocmd BufRead,BufNewFile *.html.template set filetype=html
  autocmd BufRead,BufNewFile *.svg.template set filetype=svg
augroup END

"}}}
" markdownGroup"{{{

augroup markdownGroup
  autocmd!
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

"}}}
" set the filetype of a file with no filetype"{{{

augroup noft
  autocmd!
  autocmd BufNewFile,BufRead * if empty(&filetype) | :set filetype=noft | endif
augroup END

"}}}
" Google Script Group"{{{

augroup googleScriptGroup
  autocmd!
  " Set syntax highlighting for specific file types
  " Google Script is basically JavaScript, so I will just pretend it is a
  " JavaScript file for syntax highlighting
  autocmd BufRead,BufNewFile *.gs set filetype=javascript
augroup END

"}}}
" Visual Bash Mode "{{{

augroup visualBash
  autocmd!
  " Set syntax highlighting for specific file types
  " Google Script is basically JavaScript, so I will just pretend it is a
  " JavaScript file for syntax highlighting
  autocmd BufRead,BufNewFile /tmp/bash-fc-* set filetype=sh
augroup END

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
" trailing white space"{{{

" This is a dummy highlight. The real one is done later in the ApplyHighlights()
" function. This is just here in order to suppress an error that would otherwise
" have been thrown.
highlight extraWhitespace ctermbg=darkblue

augroup trailingwhitespacegroup
  autocmd!
  autocmd bufwinenter * match extraWhitespace /\s\+$/
  autocmd insertleave * match extraWhitespace /\s\+$/
  autocmd insertenter * match extraWhitespace /\s\+\%#\@<!$/
augroup end

"}}}
" colorcolumn for gitcommit "{{{

augroup vimrcex
  autocmd!
  autocmd filetype gitcommit setlocal colorcolumn=51,73
augroup end

"}}}
" No spell check for haskell, as it is very annoying"{{{

augroup NoSpellCheckHaskell
  autocmd!
  autocmd FileType haskell setlocal nospell
augroup END

"}}}

"}}}

" Global Conceals"{{{
if has('conceal')
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

  autocmd bufenter * set conceallevel=2

  " Only conceal on the current line when it is a command line.
  autocmd bufenter * set concealcursor=c

endif

"}}}

let g:php_manual_online_search_shortcut = ''
let g:php_manual_online_get_url = '-'


nnoremap <leader>a 0yt.j0vt.p<c-a>0


let g:vdebug_options = {
  \ 'port':                9876,
  \ 'timeout':             10,
  \ 'server':              '',
  \ 'on_close':            'stop',
  \ 'break_on_open':       1,
  \ 'ide_key':             '',
  \ 'debug_window_level':  0,
  \ 'debug_file_level':    0,
  \ 'debug_file':          '',
  \ 'path_maps':           {},
  \ 'watch_window_style':  'expanded',
  \ 'marker_default':      '⬦',
  \ 'marker_closed_tree':  '▸',
  \ 'marker_open_tree':    '▾',
  \ 'sign_breakpoint':     '▷',
  \ 'sign_current':        '▶',
  \ 'sign_disabled':       '▌▌',
  \ 'continuous_mode':     0,
  \ 'background_listener': 1,
  \ 'auto_start':          1,
  \ 'simplified_status':   1,
  \ 'layout':              'vertical',
  \}

let g:vdebug_keymap = {
  \ 'set_breakpoint':    '<F2>',
  \ 'detach':            '<F3>',
  \ 'run':               '<F5>',
  \ 'step_into':         '<F6>',
  \ 'step_over':         '<F7>',
  \ 'step_out':          '<F8>',
  \ 'run_to_cursor':     '<F9>',
  \ 'get_context':       '<F11>',
  \ 'eval_under_cursor': '<F12>',
  \ 'close':             ',q',
  \}

nnoremap ,e :VdebugEval<space>
vnoremap ,e y:VdebugEval <C-R>"<cr>

" Set the dir to the folder of the current file
" autocmd BufEnter * silent! lcd %:p:h
set autochdir

set guicursor=


function InsertDocBlock()
  " copy whole line
  exec 'normal! ^v$h"zy'

  let l:line = @z

  " Line is a function definition
  if l:line =~ 'function\s\+\S\+\s*(' || l:line =~ 'function\s*('
    " Is there a return type?
    if l:line =~ ')\s*:\s*\S\+$'
      exec 'normal! $F:l"zy$'
      let l:retType = trim(@z)
    else
      let l:retType = '<return type>'
    endif

    exec 'normal! 0f("zyi('

    " Break the args by the comma
    let l:args = map(split(@z, ','), {idx, val -> trim(val)})


    let l:comment  = "/**\<cr>"
    let l:comment .= " * <Description of Function>\<cr>"
    let l:comment .= " *\<cr>"
    let l:lineCount = 3

    for val in l:args
      let l:comment .= " * @param ". val ." <description>\<cr>"
      let l:lineCount += 1
    endfor

    if l:lineCount > 3
      let l:comment .= " *\<cr>"
      let l:lineCount += 1
    endif

    let l:comment .= " * @return ".l:retType." <description>\<cr>"
    let l:comment .= " */"
    let l:lineCount += 2

    " This is very finicky in JS which is why I have to go back and fix some
    " stuff after doing formatting with the =
    exec 'normal! O' . l:comment . "\<esc>V" . (l:lineCount - 1) . "k="
    exec 'normal! ' . (l:lineCount - 2) . "j0wji \<esc>dw"
    exec 'normal! ' . (l:lineCount - 2) . 'k0ww'

  " Line is a class definition
  elseif l:line =~ '^class\s\+\w'
    exec 'normal! 0w"zy$'
    let l:className = split(@z)[0]

    let l:comment  = "/*\<cr>"
    let l:comment .= "|--------------------------------------------------------------------------\<cr>"
    let l:comment .= "| " . l:className . "\<cr>""
    let l:comment .= "|--------------------------------------------------------------------------\<cr>"
    let l:comment .= "|\<cr>""
    let l:comment .= "| <Class Description>\<cr>""
    let l:comment .= "|\<cr>""
    let l:comment .= "*/\<cr>""

    exec 'normal! jo' . l:comment
    exec 'normal! kkVkkkkk<jjj0www'

  else
    let l:comment  = "/**\<cr>"
    let l:comment .= " * @var <var type>  <description>\<cr>"
    let l:comment .= " */"

    exec 'normal! O' . l:comment
    exec 'normal! Vkk='
  endif

endfunction


nnoremap <c-h> :call InsertDocBlock()<cr>


function InsertConsoleLog()
  let l:msg = input('Message: ')

  " Save the current textwidth
  let l:tw = &textwidth

  " Disable textwidth so that nothing is wrapped
  setlocal textwidth=0

  let l:css = 'background-color: tomato; padding: 5px; color: white; font-weight: bold; border: solid red;'
  exec 'normal! Oconsole.log("%c STEVEN LOG %c", "' . l:css . '", "", ' . l:msg . ');'

  " Restore the user's textwidth
  exec 'setlocal textwidth=' . l:tw
endfunction

nnoremap <leader>1 :call InsertConsoleLog()<cr>





" Rewrote the defaults for these commands so that they would ignore the library
" folder which is stuff that we don't write, and is all minified which makes it
" impossible to do anything with them

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(
    \ <q-args> . ' | grep -v "^public_html/library/"',
    \ <bang>0
  \ )

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \     'git grep --line-number -- '.shellescape(<q-args>) . ' | grep -v "^public_html/library/" | grep -v "^node_modules/"',
  \     0,
  \     fzf#vim#with_preview({'options': '--delimiter : --nth 3..', 'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
