call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'arcticicestudio/nord-vim'
" You need to put color scheme plug install BEFORE colorscheme solarized
Plug 'micha/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
so ~/.config/nvim/coc-config.vim
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
" <Leader>cc	加入註解
" <Leader>cn	巢狀加入註解
" <Leader>c<space>	切換註解
" <Leader>cs	區塊註解
Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-move'
" vmap <C-j> <Plug>MoveBlockDown
" vmap <C-k> <Plug>MoveBlockUp
" nmap <C-j> <Plug>MoveLineDown
" nmap <C-k> <Plug>MoveLineUp
Plug 'mileszs/ack.vim'
" nnoremap <C-f> :Ack!<Space>
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
call plug#end()
nnoremap <space> za <CR>
nnoremap <silent> <C-a> :NERDTreeToggle <CR>
nnoremap <Leader>r :NERDTreeRefreshRoot <CR>
nnoremap <Leader>f :NERDTreeFocus <CR>

nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>1 :bfirst<CR>
nnoremap <Leader>2 :bfirst<CR>:bn<CR>
nnoremap <Leader>3 :bfirst<CR>:2bn<CR>
nnoremap <Leader>4 :bfirst<CR>:3bn<CR>
nnoremap <Leader>5 :bfirst<CR>:4bn<CR>
nnoremap <Leader>6 :bfirst<CR>:5bn<CR>
nnoremap <Leader>7 :bfirst<CR>:6bn<CR>
nnoremap <Leader>8 :bfirst<CR>:7bn<CR>
nnoremap <Leader>9 :blast<CR>
nnoremap <Leader>w :bd<CR>

let NERDTreeShowHidden=1
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42b883'
"let g:airline_theme='nord'
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
let g:solarized_termcolors=256
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ['c']
let g:syntastic_cpp_checkers = ['cpp']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_html_tidy_quiet_messages={"level":"warnings"}

let g:SuperTabMappingForward='<s-tab>'
let g:SuperTabMappingBackward='<tab>'

let g:NERDSpaceDelims = 1
map <C-_> <Leader>c<space>

vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

nnoremap <C-f> :Ack!<Space>

set updatetime=100

set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono\ Windows\ Compatible\ 16

" 打開語法突顯
syntax on


" 256 色
set t_Co=256
" 解決和 tmux 衝突，https://vi.stackexchange.com/questions/238/tmux-is-changing-part-of-the-background-in-vim
set t_ut=
" 選一個你喜歡的 colorschema
" available color schema
" blue darkblue default delek desert elflord evening industry koehler
" morning  murphy pablo peachpuff ron shine slate torte zellner
"colorscheme koehler

" solarized
set background=light
colorscheme solarized

" 雜項設定，詳細解說請用 `:help <opeion>`，例如 `:help showcmd`
set showcmd
set nu
set tabstop=4
set shiftwidth=4
set autoindent
set nowrap
set incsearch
set cindent
set smartindent
set cursorline
set encoding=utf8

" make lightline work in single screen
" https://github.com/itchyny/lightline.vim/issues/71#issuecomment-47859569
set laststatus=2
" 開啟滑鼠功能，對初學者來說非常好用
set mouse=a

" markdown
" 如果是檔案類型是 markdown 或 text，打開文字折疊（超出螢幕寬度會折到下一行）
" au 的語法等等會講
au FileType markdown set wrap
au FileType text set wrap

" ejs
" 不加這個的話 ejs 的語法突顯會很奇怪，順便附帶一個 ft, filetype 的坑
" https://vi.stackexchange.com/questions/16341/what-is-the-difference-between-set-ft-and-setfiletype
au BufNew,BufNewFile,BufRead *.ejs :set filetype=ejs
au FileType ejs set syntax=html

" ts 
" 這只是因為我比較喜歡 vim 對 javascript 的配色，typesript 的我覺得很醜，所以強制 vim 用 javascript 的配色
" au 就是 autocmd 的縮寫啦！（vim 幾乎每個超過三個字的命令、選項都有縮寫，寫程式的人都很懶XD）
autocmd BufNewFile,BufRead *.ts set syntax=javascript

" yaml
" yaml 機車的空格限制，這樣在寫 yaml 檔時比較方便
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" hotkey
" 這邊是自訂快捷鍵，語法等等會講，這邊只說明用法
" 在命令模式按 <tab> 會把整行字向右移一個 tab。<S-tab> 會移回來
map <tab> :s/^/\t<CR>
map <S-tab> :s/^\t/<CR>
"  如果要從系統剪貼簿貼上多行程式碼，建議這樣用，才不會被 vim 的自動縮排雷到（你試試就知道是什麼問題，很討厭）
nmap <F3> :r! cat<CR>
" 切換行號，在複製到系統鍵貼簿時很好用，這樣就不會複製到行號
nmap <F7> :set invnumber<CR>
" 清除搜尋結果的語法突顯
nmap cs :noh<CR>

" alias
" 冒號命令的別名，語法等等會講
" 常用就知道為什麼要設這個（按冒號時要按 <shift>，然後下一個字就很常變大寫，簡稱手殘）
command W w
command Q q
command Wq wq
command WQ wq

" fix bg color error in Pmenu
" 這個只是顯示問題，有時候背景色和前景色一樣你就看不到字了，所以要自己把他換掉，語法等等會講
" https://vi.stackexchange.com/questions/23328/change-color-of-coc-suggestion-box
"hi Pmenu ctermbg=black ctermfg=white
"hi Ignore ctermbg=black ctermfg=lightblue

nmap <C-s> :w!<cr>
imap <C-s> <esc>:w!<cr>i<Right>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

vmap <C-c> y<Esc>i<Right>
vmap <C-x> d<Esc>i<Right>
map <C-v> pi<Right>
imap <C-v> <Esc>pi<Right>
imap <C-z> <Esc>ui<Right>

function StartUp()
    if ''==@%
        NERDTree
    endif
endfunction
autocmd VimEnter * call StartUp()
