" this script is being ln -s to ~/.config/nvim/init.vim ~/.vimrc ~/.nvimrc

set nocompatible              " be iMproved, required
filetype off                  " required

"General
set number  "Show line numbers
set relativenumber
nmap <leader>num :set nu! <CR>:set rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling

" :imap jj <Esc>
:imap <C-L> <Esc>

set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set visualbell  "Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>


set virtualedit=onemore  "allow to go one character behind the end of the line
set autoindent  "Auto-indent new lines
set expandtab   "Use spaces instead of tabs
set shiftwidth=4    "Number of auto-indent spaces
set smartindent "Enable smart-indent
set smarttab    "Enable smart-tabs
set softtabstop=4   "Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=150          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set t_ut=
set previewheight=7

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

command! Ctagsgenerate :!ctags -R .

" for pasting in terminal
set pastetoggle=<F2>

nnoremap <leader>a <C-A>
set splitbelow    " more natural split opening
set splitright    " more natural split opening
"split movement
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
"saner splits
nnoremap <C-w>\| <C-w>v
nnoremap <C-w>_ <C-w>s
"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+
nnoremap <C-w><C-w><C-w>h <C-w><
nnoremap <C-w><C-w><C-w>l <C-w>>
nnoremap <C-w><C-w><C-w>k <C-w>-
nnoremap <C-w><C-w><C-w>j <C-w>+

" buffers
:nmap \] :bnext<CR>
:nmap \[ :bprev<CR>
:nmap <leader>w :bd<CR>
:command! Bda :bufdo bd

:command! Bd bp|bd<space>#
:nnoremap <leader>W :Bd<CR>

" syntax enable           " enable syntax processing
syntax on           " enable syntax processing

"reload vimrc
:nmap \rv :source $MYVIMRC<CR>

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" z= choose spell          ]s [s move 
" zg add to spellfile      zw add as bad,           zug/zuw remove from spellfile
set spellfile=~/.vim/spell.misc.utf-8.add
command! Spellen :setlocal spell spelllang=en_us
command! Spellcs :setlocal spell spelllang=cs
command! Spellnone :setlocal nospell

" quickfix next, prev
:nmap [q :cprev<CR>
:nmap ]q :cnext<CR>
:nmap [Q :cfirst<CR>
:nmap ]Q :clast<CR>

" Theme stuff
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
nnoremap <leader>1 :colorscheme railscasts<cr>:AirlineTheme dark<cr>
nnoremap <leader>2 :colorscheme molokai<cr>:AirlineTheme base16_monokai<cr>
nnoremap <leader>3 :colorscheme themeinabox<cr>:AirlineTheme base16_eighties<cr>
nnoremap <leader>4 :colorscheme themeinabox-light<cr>:AirlineTheme sol<cr>
nnoremap <leader>5 :colorscheme themeinabox-transparent<cr>:AirlineTheme base16_eighties<cr>

" get current syntax class
nmap <leader>sy :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" duplicate lanes TODO
nmap <leader>dd :s/\(^.*$\)/\1\r\1/<CR>:noh<CR>
xmap <leader>dd :'<,'>s/\(.*\)/\1\r\1/<CR>:noh<CR>

" json indent
command! -range -nargs=0 -bar IndentJson <line1>,<line2>!python -m json.tool
command! -range -nargs=0 -bar JsonIndent <line1>,<line2>!python -m json.tool

"xml indent
command! IndentXml :silent %!xmllint --encode UTF-8 --format -
command! XmlIndent :silent %!xmllint --encode UTF-8 --format -
augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile content.txt set ft=fitnesse
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
augroup END


let g:syntastic_cpp_compiler_options = "-std=c++14"
" add constant
nmap <leader>acr /[,)]<CR>:nohlsearch<CR>Bhi&<ESC>?[,(]<CR>:nohlsearch<CR>wiconst <ESC>
command! E :e %:p:h
command! LS :!ls -alh --color=always %:p:h

"folding

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
nnoremap z<space> zA
set foldmethod=indent   " fold based on indent level


" Paste without yanking selected
xnoremap <leader>p "_dP
" Stamp = delete current word (without yanking) and paste
nnoremap S "_diwPb
nnoremap x "_x
nnoremap X "_X
xnoremap S "_diwPb
xnoremap x "_x
xnoremap X "_X


" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" move to beginning/end of line
nmap <Home> ^
nmap <End> $

nnoremap gV `[v`]  " This mapping allows you to reselect the text you just pasted:
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>  " goto midle of line

" diff merge
nnoremap <leader>d1 :diffget 1<CR>
nnoremap <leader>d2 :diffget 2<CR>
nnoremap <leader>d3 :diffget 3<CR>

command! Diffstart :windo diffthis
command! Diffstop :diffoff!

"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set tabpagemax=50 " max number of pages

" colorscheme themeinabox

"save with root
command! Wroot :execute ':silent w !sudo tee % > /dev/null' | :edit!
" fix typo
command! W :w

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------------------------
" fast indentations changes
nmap <leader>t1 :set expandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>T1 :set noexpandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>T2 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T4 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t6 :set expandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>T6 :set noexpandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nmap <leader>T8 :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>


" -----------------------------------------------------------------------------
" cn

let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
    nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"



" -----------------------------------------------------------------------------
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" -----------------------------------------------------------------------------
" search for visually selected text
vnoremap // y/<C-R>"<CR>

" -----------------------------------------------------------------------------
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" -----------------------------------------------------------------------------
" execute macro on visal range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" -----------------------------------------------------------------------------
" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" -----------------------------------------------------------------------------
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos. 
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" -----------------------------------------------------------------------------

set t_Co=256
let g:colors_name = "themeinabox"

hi Normal                    guifg=#dfdfdf guibg=#262626 ctermfg=188 ctermbg=235
hi VertSplit                 guifg=#444444 guibg=#262626 gui=NONE ctermfg=238 ctermbg=235 cterm=NONE
hi Search                    guifg=#000000 guibg=#5f5f87 ctermfg=0 ctermbg=60 cterm=NONE
hi Visual                    guibg=#5f5f87 ctermbg=60
hi LineNr                    guifg=#666666 ctermfg=242
hi Cursor                    guifg=#000000 guibg=#FFFFFF ctermfg=0 ctermbg=15
hi CursorLine                guibg=#323232 gui=NONE ctermbg=236 cterm=NONE
hi CursorLineNr              guifg=#666666 gui=NONE ctermfg=253 cterm=NONE
hi ColorColumn               guibg=#1c1c1c ctermbg=234
hi! link CursorColumn ColorColumn
hi SignColumn                guifg=#FFFFFF guibg=NONE ctermfg=15 ctermbg=NONE

" StatusLine
" Bold
hi User1                     guifg=#eeeeee guibg=#606060 gui=bold ctermfg=255 ctermbg=241 cterm=bold
" Yellow
hi User2                     guifg=#FFAF00 guibg=#606060 gui=bold ctermfg=214 ctermbg=241 cterm=bold
" Green
hi User3                     guifg=#5fff00 guibg=#606060 gui=bold ctermfg=82 ctermbg=241 cterm=bold
" Red
hi User4                     guifg=#870000 guibg=#606060 gui=bold ctermfg=88 ctermbg=241 cterm=bold
hi User5                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User6                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User7                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User8                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User9                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi StatusLine                guifg=#e4e4e4 guibg=#606060 gui=NONE ctermfg=254 ctermbg=241 cterm=NONE
hi StatusLineNC              guifg=#585858 guibg=#303030 gui=NONE ctermfg=240 ctermbg=236 cterm=NONE

" Folds
" -----
" line used for closed folds
hi Folded                    guifg=#af87d7 guibg=NONE gui=NONE ctermfg=140 ctermbg=NONE cterm=NONE
hi! link FoldColumn SignColumn

" Invisible Characters
" ------------------
hi NonText                   guifg=#767676 gui=NONE cterm=NONE ctermfg=243
hi SpecialKey                guifg=#767676 gui=NONE cterm=NONE ctermfg=243

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#87af5f gui=NONE ctermfg=107 cterm=NONE

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#ffffff guibg=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#87af5f gui=NONE ctermfg=0 ctermbg=107 cterm=NONE
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E gui=NONE ctermfg=15 ctermbg=60 cterm=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb                guifg=#ffffff guibg=#a8a8a8 gui=NONE ctermfg=15 ctermbg=248 cterm=NONE

" Code constructs
" ---------------
hi Comment                   guifg=#7d7d7d ctermfg=244
hi Todo                      guifg=#df5f5f guibg=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi Constant                  guifg=#d75faf ctermfg=169
hi Error                     guifg=#990000 guibg=NONE ctermfg=88 ctermbg=NONE
hi WarningMsg                guifg=#800000 guibg=NONE ctermfg=1 ctermbg=NONE
hi ErrorMsg                  guifg=#800000 guibg=NONE ctermfg=1 ctermbg=NONE
hi Identifier                guifg=#a6e043 gui=NONE ctermfg=149 cterm=NONE
hi Keyword                   guifg=#e09146 gui=NONE ctermfg=173 cterm=NONE
hi Number                    guifg=#78add2 ctermfg=110
hi Statement                 guifg=#e09146 gui=NONE ctermfg=173 cterm=NONE
hi String                    guifg=#78add2 ctermfg=110
hi! link Title Statement
hi Type                      guifg=#e0a743 gui=NONE ctermfg=179 cterm=NONE
hi PreProc                   guifg=#ff8700 ctermfg=208
hi Special                   guifg=#afd75f ctermfg=149

" C++
" ---

hi Operator                  guifg=#e88958 ctermfg=173

" Diffs
" -----
hi DiffAdd                   guifg=#e4e4e4 guibg=#005f00 ctermfg=254 ctermbg=22
hi DiffDelete                guifg=#000000 guibg=#5f0000 gui=bold ctermfg=16 ctermbg=52 cterm=bold
hi DiffChange                guibg=#1c1c1c ctermbg=234
hi DiffText                  guifg=#FFFFFF guibg=#5f0087 gui=bold ctermfg=15 ctermbg=54 cterm=bold

hi diffAdded                 guifg=#008700 ctermfg=28
hi diffRemoved               guifg=#800000 ctermfg=1
hi diffNewFile               guifg=#FFFFFF guibg=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi diffFile                  guifg=#FFFFFF guibg=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold


" Python
" ------
hi pythonExceptions          guifg=#ffaf87 ctermfg=216
hi pythonDoctest             guifg=#8787ff ctermfg=105
hi pythonDoctestValue        guifg=#87d7af ctermfg=115

" Mail
" ----
hi mailEmail                 guifg=#87af5f ctermfg=107 gui=italic cterm=underline
hi mailHeaderKey             guifg=#ffdf5f ctermfg=221
hi! link mailSubject mailHeaderKey

" Spell
" ----
hi SpellBad                  guifg=#D70000 guibg=NONE gui=undercurl ctermfg=160 ctermbg=NONE cterm=underline
hi SpellRare                 guifg=#df5f87 guibg=NONE gui=underline ctermfg=168 ctermbg=NONE cterm=underline
hi SpellCap                  guifg=#dfdfff guibg=NONE gui=underline ctermfg=189 ctermbg=NONE cterm=underline
hi SpellLocal                guifg=#00FFFF guibg=NONE gui=undercurl ctermfg=51 ctermbg=NONE cterm=underline
hi MatchParen                guifg=#FFFFFF guibg=#005f5f ctermfg=15 ctermbg=23

" XML
" ---
hi xmlTag                    guifg=#dfaf5f ctermfg=179
hi xmlTagName                guifg=#dfaf5f ctermfg=179
hi xmlEndTag                 guifg=#dfaf5f ctermfg=179

" HTML
" ----
hi! link htmlTag              xmlTag
hi! link htmlTagName          xmlTagName
hi! link htmlEndTag           xmlEndTag

