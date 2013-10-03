
"Show line number
set nu

"The order of file encodingsd
set fileencodings=ucs-bom,utf-8,default,euc-kr,latin1

"status bar
set laststatus=2
set statusline=%F\ %m%h%r%=\ [FORMAT=%{&ff},%{&fenc}]\ [TYPE=%Y]\ [BUF=%n/%{bufnr('$')}]\ [POS=%l,%v]\ [LEN=%L]\ [%p%%]

"Background color
set background=dark

"Tab key and space(Tab is 4 spaces)
set expandtab
set softtabstop=4
set shiftwidth=4

"Indent plugin
filetype indent plugin on

"Syntax highlight
syntax on

"Python
autocmd BufEnter wscript set filetype=python
autocmd FileType python map <C-c> :s/^/#/<CR>
autocmd FileType python map <C-x> :s/^[#]//<CR>
autocmd FileType python imap <C-c> #

"Java, C, C++ comment(//)
autocmd BufEnter *.glsl set filetype=cpp
autocmd FileType c,cpp,java,javascript map <C-c> :s/^/\/\//<CR>
autocmd FileType c,cpp,java,javascript map <C-x> :s/^\/\///<CR>
autocmd FileType c,cpp,java,javascript imap <C-c> //

"css comment(/* */)
autocmd FileType css map <C-c> :s/^\(.*\)$/\/\* \1 \*\//<CR>
autocmd FileType css map <C-x> :s/^\([/(]\*\) \(.*\) \(\*[/)]\)$/\2/<CR>
autocmd FileType css imap <C-c> /*  */<ESC>hhi

"xml, html comment
autocmd FileType xml,html map <C-c> :s/^\(.*\)$/<!-- \1 -->/<CR>
autocmd FileType xml,html map <C-x> :s/^\(<!--\) \(.*\) \(-->\)$/\2/<CR>
autocmd FileType xml,html imap <C-c> <!--  --><ESC>hhhi
autocmd FileType xml,html set matchpairs+=<:>

"Makefile syntax
autocmd FileType make set noexpandtab
autocmd FileType make set softtabstop=8
autocmd FileType make set shiftwidth=8

"Shortcut
map <F4> :shell<CR>
map <F5> <C-W>w
map <F6> :bn<CR>
map ,q <C-W>q
"ctags
map <F7> :pts <C-R><C-W><CR>
map <F8> :TlistToggle<CR>

"Function command
command ToUnix call Tounix()
command ToDos call Todos()
command ToEuc call Toeuc()
command ToUtf call Toutf()
command MyDoc sp /home/hda2/Programming/Vim/shortcut.txt

"Tab and Shift-Tab
nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
imap <S-Tab> <ESC><<i

"Clip board copy and paste
nmap "+y ^v$"+y

"Detect GVIM
if has("gui_win32")
    "Windows GUI
    set guifont=DeJaVu_Sans_Mono:h10:cANSI
    colorscheme torte
    set lines=55 columns=110
    set bs=2
    set ff=unix
    set guioptions-=l
    set guioptions-=r
    set guioptions-=b
    set guioptions-=T
    nmap "+p "+gP
else
    "Linux clipboard copy and paste
    vmap "+y y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
    nmap "+p :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
endif

"File Format Dos to Unix
function Tounix ()
    update
    e ++ff=dos
    setlocal ff=unix
    w
endfunction

"File Format Unix to Dos
function Todos ()
    update
    e ++ff=dos
    w
endfunction

"File Encoding to EUC-KR
function Toeuc ()
    update
    set fileencoding=euc-kr
    w
endfunction

"File Encoding to UTF-8
function Toutf ()
    update
    set fileencoding=utf-8
    w
endfunction

set nu
set nocompatible "Vim 디폴트 기능들을 사용함
set autoindent "자동 들여쓰기
set cindent "C언어 자동 들여쓰기
set smartindent "자동 들여쓰기
set nowrap "자동 줄바꿈 안함
"set nowrapscan "찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음
"set nobackup "백업파일을 만들지 않음
set nojoinspaces "j 명령어로 줄을 붙일때 마침표 뒤에 한칸만 띔
set title "타이틀바에 현재 편집중인 파일을 표시
set history=200 "명령어 기록 갯수
set ruler "상태 표시줄에 커서 위치를 보여줌
set tabstop=4 "탭간격
set showcmd "(부분적인)명령어를 상태라인에 보여줌
set showmatch "매치되는 괄호의 반대쪽을 보여줌
"set autowrite ":next나 :make 같은 명령를 입력하면 자동으로 저장
set mousehide "When typing mouse hide
set hlsearch "When Seach, Result on highlight
set incsearch "점진적으로 찾기
set ignorecase "찾기에서 대/소문자를 구별하지 않음
set linespace=3 "줄간격
set background=dark
"set fileencoding=utf-8 "UTF-8을 기본 저장포맷으로
"set encoding=utf-8 "UTF-8을 기본 읽기포맷으로
"set termencoding=euc-kr "단 터미널은 euc-kr로
"set fenc=utf-8
"set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1
"set tags+=./tags "add current directory's generated tags file to available tags
set vb "오류음 대신 비주얼 벨 사용
set paste! "붙여넣기시 계단현상 제거


set fileencoding=utf-8 
set encoding=utf-8 

colorscheme molokai
set t_Co=256
set background=light
