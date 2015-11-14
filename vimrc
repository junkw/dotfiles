set undodir=~/.cache/vim/undo
set directory=~/.cache/vim/swap
set backupdir=~/.cache/vim/backup
set viminfo+=n~/.cache/vim/viminfo

set langmenu=japanese
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac                     " end-of-line formats

" adding extended attribute for QuickLook
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))

function! SetUTF8Xattr(file)
    let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
    if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
        call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
    endif
endfunction

set vb t_vb=                                     " stop the beeping

set nobackup
set noswapfile

set background=dark
syntax on
set listchars=eol:$,tab:>-                       " highlight hard tab and EOL
set showmatch                                    " highlight matching braces
set hlsearch                                     " highlight matching pattern

" hilight multibyte space
if has('syntax')
    syntax enable

    function! ZenkakuSpace()
        highlight ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=red
        silent! match ZenkakuSpace /　/
    endfunction

    augroup ZenkakuSpace
        autocmd!
        autocmd VimEnter,BufEnter * call ZenkakuSpace()
    augroup END
endif

set autoindent
set tabstop=4

set ruler

" line number
if version < 703
  set nu
elseif version >= 703
  set relativenumber
endif

set wildmenu                                     " completion in the command line by TAB
set backspace=indent,eol,start                   " delete indent, end-of-line, start of insert

" opening file of relative path with `gf (goto file)'
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

set incsearch                                    " incremental search
set ignorecase                                   " ignore upper and lower case
set smartcase                                    " disable 'ignorecase' when uppercase has pattern
set wrapscan                                     " wrap around to the beginning