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

" autocomplete Parenthesis
" When you type an open brace, this will automatically
" insert a closing brace on the same line, after the cursor.
" If you quickly hit Enter after the open brace, (to begin
" a code block), the closing brace will be inserted on the
" line below the cursor. If you quickly press the open brace
" key again after the open brace, Vim won't insert anything extra,
" you'll just get a single open brace. Finally, if you quickly
" type an open and close brace, Vim will not do anything special.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []


" COMPILE FUNCTIONS-----------------------
" Keybindings for code compilation
" compiling using F8
map <F8> : call CompileGpp()<CR>
func! CompileGpp()
	exec "w"
	exec "!g++ % -o %<"
endfunc

" Compile and execute using F9
map <F9> :call CompileRunGpp()<CR>
func! CompileRunGpp()
	exec "w"
	exec "!g++ % -o %<"
	exec "! ./%<"
endfunc
" ----------------------------------------


" KEY MAPPINGS
nmap        T			:TaskList<CR>
nnoremap    P 	    		:TagbarToggle<CR>



