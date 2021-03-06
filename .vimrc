set nocp
call pathogen#infect()
" For Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()	" generate helptags for everything in 'runtimepath'
filetype off " needs to be off for Pathogen to load properly
filetype plugin indent on
filetype on

" for snipmate-snippets loading
let g:snippets_dir="~/.vim/bundle/snipmate-snippets/snippets"

" for auto omni-complete (including latex) using neocomplcache
" NOTE: MIGHT SLOW PC. SET TO 0 IF UNDESIRED.
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 3

" for extra whitespace
" match errorMsg /[^\t]\zs\t\+/

" Match indentation !== space
match errorMsg /[\t]/

" highlight currently selected line
set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40


" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checker = 'pyflakes'

" for vimplate
"let g:Vimplate='~/.vim/bundle/vimplate/vimplate'

" For minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" For Ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"for all types of omni code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=ccomplete#CompleteCpp
autocmd FileType java set omnifunc=javacomplete#Complete

" for C0 filetype
au BufRead,BufNewFile *.c0 set filetype=c

" vim does not recognize latex files by default!
let g:tex_flavor="latex"

" remap omni-complete keybindings C-X C-O to C-<space>
inoremap <C-space> <C-x><C-o>

" configure indentation
set cindent
set smartindent
set autoindent
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set number
syntax on

"for the color scheme
" colo wombat 

" Solarized color scheme.  Does not work very well.
"syntax on
"set background=dark 
"colorscheme solarized
"se t_Co=16
"let g:solarized_termcolors=256

" for code folding
set foldmethod=syntax
set foldlevel=99

" set backspace to work like normal backspace
set backspace=indent,eol,start

" prompt for wildmenu even when typing buffers
set wildmode=longest:full
set wildmenu

" autocomplete Parenthesis
" When you type an open brace, this will automatically
" insert a closing brace on the same line, after the cursor.
" If you quickly hit Enter after the open brace, (to begin
" a code block), the closing brace will be inserted on the
" line below the cursor. If you quickly press the open brace
" key again after the open brace, Vim won't insert anything extra,
" you'll just get a single open brace. Finally, if you quickly
" type an open and close brace, Vim will not do anything special.
" inoremap { {}<Left>
" inoremap {<CR> {<CR>}<Esc>O
" inoremap {{ {
" inoremap {} {}

" inoremap ( ()<Left>
" inoremap (<CR> (<CR>)<Esc>O
" inoremap (( (
" inoremap () ()

" inoremap [ []<Left>
" inoremap [<CR> [<CR>]<Esc>O
" inoremap [[ [
" inoremap [] []


" COMPILE FUNCTIONS-----------------------
" Keybindings for code compilation

"running python programs
map <F7> : call RunPython()<CR>
func! RunPython()
    exec "w"
    exec "!python %"
endfunc

" Compile and execute c++ programs using F9
map <F9> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %< && ./%<"
endfunc

" Compile and execute all c++ files in common folder using F8
map <F8> :call CompileRunGppAll()<CR>
func! CompileRunGppAll()
exec "w | !g++ *.h *.cpp -o %< && ./%<"
endfunc

" Compile and execute c0 programs using F4
map <F4> :call CompileRunCc0()<CR>
func! CompileRunCc0()
    exec "w | !/home/joel/Documents/tarballs/cc0/bin/cc0 -d % -o %< && ./%<"
endfunc

" Run node scripts using F3
map <F3> :call CompileRunNode()<CR>
func! CompileRunNode()
    exec "w | !node %"
endfunc

" compiling latex docs using latex compiler
" remap omni-complete keybindings C-X C-O to C-<space>
map <F5> <leader>ll

" Compile and execute c++ programs using F9
map <F6> <leader>lv

" Convert tabs to spaces in program
map <F2> :call TabsToSpaces()<CR>
func! TabsToSpaces()
    exec "set expandtab | set tabstop=4 | set shiftwidth=4"
endfunc

" ----------------------------------------


" Omnicomplete stuff----------------------
" map supertab plugin tab key to contextual omnicomplete
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" set prompt to longest list
set completeopt+=longest,menuone

" remap the <enter> key to a contextual one
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" keep prompt menu selected even when typing entry
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : <C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : <C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"-----------------------------------------


"-----------------------------------------
" Doxygen toolkit stuff - makes creating doxygen tag comments VERY FAST
" let g:DoxygenToolkit_briefTag_pre="@"
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Joel Haowen TONG"
let g:DoxygenToolkit_licenseTag="Copyright (c) <2012> <TONG Haowen Joel> \n \nPermission is hereby granted, free of charge, to any person \nobtaining a copy of this software and associated documentation \nfiles (the \"Software\"), to deal in the Software without \nrestriction, including without limitation the rights to use, \ncopy, modify, merge, publish, distribute, sublicense, and/or sell \ncopies of the Software, and to permit persons to whom the \nSoftware is furnished to do so, subject to the following \nconditions: \n \nThe above copyright notice and this permission notice shall be \n included in all copies or substantial portions of the Software. \n \nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, \nEXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \nOF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND \nNONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT \nHOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, \nWHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING \nFROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR \nOTHER DEALINGS IN THE SOFTWARE." " Do not end this line with <Enter>
" -------------------------------------

" Set highlighting search mode
set hlsearch

" Show command
set showcmd

" Search pattern while typing
set incsearch

" Ignore case while searching
set ignorecase

" Create tempfile backup to prevent file losses if file not written properly
set writebackup


" Fswitch plugins for cpp ------------------
" Switch to the file and load it into the current window
nmap <silent> <Leader>of :FSHere<cr>

"  Switch to the file and load it into the window on the right 
nmap <silent> <Leader>ol :FSRight<cr>

" Switch to the file and load it into a new window split on the right 
nmap <silent> <Leader>oL :FSSplitRight<cr>

" Switch to the file and load it into the window on the left 
nmap <silent> <Leader>oh :FSLeft<cr>

" Switch to the file and load it into a new window split on the left 
nmap <silent> <Leader>oH :FSSplitLeft<cr>

" Switch to the file and load it into the window above 
nmap <silent> <Leader>ok :FSAbove<cr>

" Switch to the file and load it into a new window split above 
nmap <silent> <Leader>oK :FSSplitAbove<cr>

" Switch to the file and load it into the window below 
nmap <silent> <Leader>oj :FSBelow<cr>

" Switch to the file and load it into a new window split below 
nmap <silent> <Leader>oJ :FSSplitBelow<cr>
" End Fswitch plugins for cpp ----------------


" Protodef plugin for cpp / h files -----------

" Location of pullproto.pl for plugin to work
let g:protodefprotogetter='./bundle/protodef/pullproto.pl'


let g:protodefctagsexe='/usr/local/bin/ctags'

" Generate .cpp gile from .h normally
nmap <buffer> <silent> <leader> ,YK

" Generate .cpp file from .h without namespace definition
nmap <buffer> <silent> <leader> ,YN
"----------------------------------------------


" Write buffer through sudo using w!!
cnoreabbrev w!! w !sudo tee % >/dev/null


" For using Arduino IDE in vim --------------------
" Detect filetypes
" au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.pde set filetype=cpp
au BufRead,BufNewFile *.ino set filetype=arduino
" End for using Arduino IDE in vim ----------------

" Code folding for Javascript =D
set foldmethod=syntax
set foldlevelstart=99

let javaScript_fold=0         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


" KEY MAPPINGS
set pastetoggle=<F11> "so everything is pasted correctly
nmap T :TaskList<CR>
nnoremap P :TagbarToggle<CR>

" For markdown - .md files recognized as markdown
au BufRead,BufNewFile *.md set filetype=markdown

" For vim-instant-markdown plugin, LIVE preview
let g:instant_markdown_slow=1

