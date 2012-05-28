" For Pathogen
filetype off							" needs to be off for Pathogen to load properly
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()					" generate helptags for everything in 'runtimepath'
filetype on
filetype plugin indent on

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checker = 'pyflakes'

" For minibufexpl
let g:miniBufExplMapWindowNavVim 	= 1
let g:miniBufExplMapWindowNavArrows 	= 1
let g:miniBufExplMapCTabSwitchBufs 	= 1
let g:miniBufExplModSelTarget 		= 1 

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
colo wombat

" for code folding
set foldmethod=indent
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
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()

" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap [[     [
" inoremap []     []


" COMPILE FUNCTIONS-----------------------
" Keybindings for code compilation

"running python programs
map <F7> : call RunPython()<CR>
func! RunPython()
    exec "w"
    exec "!python %"
endfunc

" compiling c++ programs through g++ using F8  
map <F8> : call CompileGpp()<CR>
func! CompileGpp()
	exec "w"
	exec "!g++ % -o %<"
endfunc

" Compile and execute c++ programs using F9
map <F9> :call CompileRunGpp()<CR>
func! CompileRunGpp()
	exec "w"
	exec "!g++ % -o %<"
	exec "! ./%<"
endfunc
" ----------------------------------------


" Omnicomplete stuff----------------------
" map supertab plugin tab key to contextual omnicomplete
let g:SuperTabDefaultCompletionType = "context"

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
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="TONG Haowen Joel"
let g:DoxygenToolkit_licenseTag="Copyright (c) <2012> <TONG Haowen Joel> \n \nPermission is hereby granted, free of charge, to any person \nobtaining a copy of this software and associated documentation \nfiles (the \"Software\"), to deal in the Software without \nrestriction, including without limitation the rights to use, \ncopy, modify, merge, publish, distribute, sublicense, and/or sell \ncopies of the Software, and to permit persons to whom the \nSoftware is furnished to do so, subject to the following \nconditions: \n \nThe above copyright notice and this permission notice shall be \n included in all copies or substantial portions of the Software.  \n \nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, \nEXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \nOF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND \nNONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT \nHOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, \nWHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING \nFROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR \nOTHER DEALINGS IN THE SOFTWARE."    " Do not end this line with <Enter>
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

" Write buffer through sudo using w!!
cnoreabbrev w!! w !sudo tee % >/dev/null

" KEY MAPPINGS
set                             pastetoggle=<F11>       "so everything is pasted correctly
nmap        T			:TaskList<CR>
nnoremap    P 	    		:TagbarToggle<CR>


