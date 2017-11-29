set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" NERD-tree
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'cespare/mxml.vim'
Plugin 'vim-scripts/xmledit'
Plugin 'msanders/cocoa.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tfnico/vim-gradle'
Plugin 'adragomir/javacomplete'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'molok/vim-smartusline'
Plugin 'bpdp/vim-java'
Plugin 'mattn/emmet-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"=============================================================================
" General settings
"=============================================================================

highlight OverLength ctermbg=blue ctermfg=white
set colorcolumn=120

set nocp

" Tab related
set ts=4
set sw=4
set smarttab
set et
set ambiwidth=double

" Format related
set tw=0
set lbr
set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive

" Misc
set wildmenu
set nospell

" Encoding related
set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
filetype plugin indent on
au BufRead *.as set filetype=actionscript et
au BufRead *.mxml set filetype=mxml et
au BufRead *.mml set filetype=mathml et

" Display related
set ru
set nu
set sm
set hls
set nowrap
syntax on

" Refer to: https://github.com/bpdp/vim-java
set ofu=syntaxcomplete#Complete
if (has("gui_running"))
    colo bluegreen
else
    colo bluegreen
endif

" Default Colors for CursorLine
highlight CursorLine ctermbg=Blue ctermfg=Yellow

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight CursorLine ctermbg=Darkgray ctermfg=Red

"Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight CursorLine ctermbg=Blue ctermfg=Yellow

" autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=30

au BufRead,BufNewFile *.gradle set filetype=groovy

" set foldmethod=indent
" set foldnestmax=2

let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='.'
let g:indentLine_color_term=7
let g:indentLine_color_gui='#FFB3B3'
" let g:indentLine_char = '|'

hi Modified guifg=black guibg=#FFA500
set statusline=%2.2n\ %t\ %h%#Modified#%m%r%*%=%l%L\ %2c\ %P
let g:smartusline_string_to_highlight='%2.2n %t %h'

au BufNewFile,BufRead *.groovy setf groovy
au BufNewFile,BufRead *.gradle setf groovy

if (has("autocmd"))
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

" ============================================================================
" Shortcuts
" ============================================================================
" Escape arrow in putty
map <Esc>[A <C-Up>
map <Esc>[B <C-Down>
map <Esc>[C <C-Right>
map <Esc>[D <C-Left>
map! <Esc>[A <C-Up>
map! <Esc>[B <C-Down>
map! <Esc>[D <C-Left>
map! <Esc>[C <C-Right>
" Move lines
nmap <C-Down> :move .+1<CR>
nmap <C-Up> :move .-2<CR>

" Toggle line number
nmap <F12> :set nu!<CR>
imap <F12> :set nu!<CR>

" Toggle NERDTree window
nmap <silent> <F9> :NERDTreeToggle<CR>
nmap <silent> <C-O> :NERDTreeToggle<CR><ESC>

" miniBufExploer config
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" buffer change
nmap <S-Tab> :bn<CR>
nmap <S-Left> :bp<CR>
nmap <S-Right> :bn<CR>

" Toggle Tagbar
nmap <C-t> :TagbarToggle<CR>

"=============================================================================
" Modes
"=============================================================================

function EnglishMode()
    "set imactivatekey=
    "set noimcmdline
    "set iminsert=0
    "set imsearch=0
    setlocal nospell
endfunction
command -nargs=0 EnglishMode call EnglishMode()

function ChineseMode()
    "set imactivatekey=C-space
    "set noimcmdline
    "set iminsert=2
    "set imsearch=2
    setlocal nospell
endfunction
command -nargs=0 ChineseMode call ChineseMode()

function TextMode()
    setlocal nocin
    setlocal nosm
    setlocal noai
    setlocal tw=0
endfunction
command -nargs=0 TextMode call TextMode()

function CodeMode()
    setlocal cin
    setlocal sm
    setlocal ai
    setlocal tw=0
endfunction
command -nargs=0 CodeMode call CodeMode()

function MailMode()
    call TextMode()
    setlocal ft=mail
    setlocal tw=0
endfunction
command -nargs=0 MailMode call MailMode()

function BBSMode()
    call MailMode()
    call ChineseMode()
    setlocal ft=bbs
    setlocal fenc=cp936
    setlocal tw=0
endfunction
command -nargs=0 BBSMode call BBSMode()

function VikiMode()
    call ChineseMode()
    setlocal ft=viki
endfunction
command -nargs=0 VikiMode call VikiMode()

"=============================================================================
" Functions
"=============================================================================

function TimeStamp()
    let curposn= SaveWinPosn()
    %s/\$Date: .*\$/\=strftime("$Date: %Y-%m-%d %H:%M:%S$")/ge
    %s/Last Change: .*$/\=strftime("Last Change: %Y-%m-%d %H:%M:%S")/ge
    %s/Last Modified: .*$/\=strftime("Last Modified: %Y-%m-%d %H:%M:%S")/ge
    " Replace once and never update.
    %s/Created: *$/\=strftime("Created: %Y-%m-%d %H:%M:%S")/ge
    call RestoreWinPosn(curposn)
endfunction
command -nargs=0 TimeStamp call TimeStamp()

function AutoTimeStamp()
    augr tagdate
    au!
    au BufWritePre,FileWritePre * call TimeStamp()
    augr END
endfunction
command -nargs=0 AutoTimeStamp call AutoTimeStamp()

function NoAutoTimeStamp()
    augr tagdate
    au!
    augr END
endfunction
command -nargs=0 NoAutoTimeStamp call NoAutoTimeStamp()

command -nargs=1 Margin exec "match Error /.\\%>" . (<args> + 1) . "v/"
command -nargs=0 NoMargin match none

function CodeLayout()
    call CodeMode()
    WManager
    Tlist
endfunction
command -nargs=0 CodeLayout call CodeLayout()

function CodeLayoutSmall()
    call CodeLayout()
    set columns=141
    exec "norm \<c-w>l"
    set nu
    set lines=100
endfunction
command -nargs=0 CodeLayoutSmall call CodeLayoutSmall()

function CodeLayoutLarge()
    call CodeLayout()
    set columns=226
    exec "norm \<c-w>l"
    set nu
    vsplit
    set lines=100
endfunction
command -nargs=0 CodeLayoutLarge call CodeLayoutLarge()

" ============================================================================
" Plugins settings
" ============================================================================

" Tlist
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1

" A
let g:alternateNoDefaultAlternate=1
let g:alternateRelativeFiles=1

" Viki
let g:vikiNameSuffix=".viki"
autocmd! BufRead,BufNewFile *.viki call VikiMode()

" BBS
autocmd! BufRead,BufNewFile *.bbs call BBSMode()

" Mail
autocmd! FileType mail call MailMode()

" XML
autocmd! FileType html,xml,yaml setlocal sw=2 ts=2

" FencView
let g:fencview_autodetect=0

"=============================================================================
" Platform dependent settings
"=============================================================================

if (has("win32"))

    "-------------------------------------------------------------------------
    " Win32
    "-------------------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
        set guifontwide=NSimSun:h9:cGB2312
    endif

    " For Viki
    let g:netrw_browsex_viewer="start"

    " For tee
    set shellpipe=2>&1\|\ tee

    " VimTweak
    if (has("gui_running"))
        command -nargs=1 SetAlpha call libcallnr("vimtweak.dll",
            \"SetAlpha", <args>)
        command -nargs=0 TopMost call libcallnr("vimtweak.dll",
            \"EnableTopMost", 1)
        command -nargs=0 NoTopMost call libcallnr("vimtweak.dll",
            \"EnableTopMost", 0)
    endif

else

    "-------------------------------------------------------------------------
    " Linux
    "-------------------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

    " For Viki
    let g:vikiHomePage="~/document/Viki/index.viki"
    let g:netrw_browsex_viewer="kfmclient exec"

    set makeprg=build

endif
