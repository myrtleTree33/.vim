" For Pathogen
filetype off							" needs to be off for Pathogen to load properly
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()					" generate helptags for everything in 'runtimepath'
filetype plugin indent on

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

"let g:syntastic_auto_loc_list=1
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1
let g:syntastic_python_checker = 'pyflakes'

