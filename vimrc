" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    vimrc                                              :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: kcheung <marvin@42.fr>                     +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/04/15 00:37:25 by kcheung           #+#    #+#              "
"    Updated: 2018/06/19 21:08:25 by filemaker        ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"Vundle Plugin Manager ------------------------------------------------------{{{

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Begin Plugin List

"Core
Plugin 'scrooloose/nerdtree'				"Directories Navigation
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'pbondoer/vim-42header' 				"Insert 42 header
Plugin 'tomtom/tcomment_vim'				"smart commenting based on file type
Plugin 'vim-scripts/funprototypes.vim'		"auto prototype your entire file
Plugin 'vim-scripts/L9' 					"Ctrlp dependency
Plugin 'kien/ctrlp.vim'						"search current directory with file name pattern
Plugin 'jiangmiao/auto-pairs'				"auto finish brackets [,{,(
Plugin 'vim-syntastic/syntastic'			"syntax notification
Plugin 'terryma/vim-multiple-cursors'		"Multiple cursor edit
Plugin 'gioele/vim-autoswap'
Plugin 'editorconfig/editorconfig-vim'		"editorconfig
Plugin 'ronakg/quickr-cscope.vim'			"Cscope keybind

"Themes and Display
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sickill/vim-monokai'

"Like Snippet/Tab complete
Plugin 'tomtom/tlib_vim.git'				"snipmate dependency
Plugin 'MarcWeber/vim-addon-mw-utils.git'	"snipmate dependency
Plugin 'garbas/vim-snipmate'				"tab launch for snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'					"Snips

"Django
Plugin 'Valloric/YouCompleteMe'
Plugin 'fisadev/vim-isort'
Plugin 'Vimjas/vim-python-pep8-indent'		"Fix indentations
Plugin 'tweekmonster/django-plus.vim'
Plugin 'portante/pycscope'					"cscope for python


"Experimental
"Plugin 'lunaru/vim-twig' "for PHP
Plugin 'nixon/vim-vmath'					"calculator in vim
Plugin 'chazy/cscope_maps'
Plugin 'tpope/vim-surround'
Plugin 'gotcha/vimpdb'						"python debugger
Plugin 'dhruvasagar/vim-table-mode'			"Vim tables
Plugin 'chrisbra/csv.vim'					"csv files

"Solidity
Plugin 'tomlion/vim-solidity'

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'vimwiki/vimwiki'

"React jsx
Plugin 'MaxMEllon/vim-jsx-pretty'			"pretty indents
Plugin 'pangloss/vim-javascript'

"Filemaker
Plugin 'chivalry/filemaker.vim'

"End Plugin List
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins;
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" }}}
"Basics options -------------------------------------------------------------{{{

syntax on
:set number
:set hlsearch
:set mouse=a
:set shiftwidth=4
:set tabstop=4
:set showcmd
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
set backspace=indent,eol,start
set ttymouse=sgr

"set Leader key to ,
let mapleader = ","


"}}}
"Color/Display --------------------------------------------------------------{{{

colorscheme monokai

" set termguicolors
set t_Co=256
set background=dark
set term=screen-256color

"Set Special Tab and End of line char
set listchars=eol:¬,tab:\┆\ 
:set list

"quick resize of vertical size
noremap <leader>1 :vertical resize 85 <ENTER>
noremap <leader>2 :vertical resize 25 <ENTER>
noremap <leader>3 :vertical resize 0 <ENTER>
nnoremap <leader>= :exe "vertical resize +5"<CR>
nnoremap <leader>- :exe "vertical resize -5"<CR>

"Cursor Guid
au BufEnter * setlocal cursorline "distinct cursor line for each buffer"
au BufLeave * setlocal nocursorline
augroup CulHighlight
	autocmd!
	autocmd InsertEnter * hi cursorline guibg=Black
	autocmd InsertLeave * hi cursorline guibg=#3c3836
augroup END

"Specific for Python files
function! SetupPython()
	" Here, you can have the final say on what is set.  So
	" fixup any settings you don't like.
	setlocal softtabstop=2
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()

"}}}
"Convenience Remappings -----------------------------------------------------{{{
:set timeoutlen=500
:imap jk <Esc>
:vmap jk <Esc>
:imap kk [
:imap jj {
:imap ii (
:map ; :
:noremap ;; ;
autocmd FileType php imap <buffer> ss $

let maplocalleader = "\\"

"Execute line as if on command, return current buffer
noremap Q !!$SHELL <cr>

"allow vim to share clipboard with the system's clipboard
" set clipboard=unnamedplus,unnamed,autoselect
set clipboard=unnamedplus

"}}}
"Searching and Movement -----------------------------------------------------{{{

" Navigating betwen splts
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>

"Remove visual Highlights
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

"Keep search matches in the middle of the window and pulse line when moving to them
nnoremap n nzzzv
nnoremap N Nzzzv

"copy selection in visual mode to search: mapped to //
vnoremap // y/<C-R>"<CR>

"Normal mode: Move to end or beginning of line
nnoremap H ^
nnoremap L g_

"Clear Highlghts
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

"}}}
"Folding --------------------------------------------------------------------{{{

"sets folding to use syntax in C files.
"Sets folding to use marker in vimrc

:autocmd FileType c setlocal foldmethod=syntax
:autocmd FileType c setlocal foldnestmax=1
:autocmd FileType c setlocal foldtext=MyFoldText()
:autocmd FileType cpp setlocal foldmethod=syntax
:autocmd FileType cpp setlocal foldnestmax=1
:autocmd FileType cpp setlocal foldtext=MyFoldText()
:autocmd FileType html setlocal foldmethod=indent
:autocmd FileType html setlocal foldtext=MyFoldText()
:autocmd FileType python setlocal foldmethod=indent
:autocmd FileType python setlocal foldnestmax=2
:autocmd FileType python setlocal foldtext=MyFoldText()
:autocmd FileType python setlocal noexpandtab
:autocmd FileType python setlocal tabstop=4
:autocmd FileType python setlocal shiftwidth=4
:autocmd BufRead ~/.vim/vimrc setlocal foldmethod=marker
:autocmd BufRead ~/.vim/vimrc setlocal foldnestmax=10
autocmd FileType javascript set tabstop=2|set shiftwidth=2

"Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za;

"Use ,f to "focus" the current fold.
nnoremap <leader>f zMzvzz

function! MyFoldText() " {{{
	let line = getline(v:foldstart)

	let nucolwidth = &fdc + &number * &numberwidth
	let windowwidth = winwidth(0) - nucolwidth - 3
	let foldedlinecount = v:foldend - v:foldstart

	" expand tabs into spaces
	let onetab = strpart('          ', 0, &tabstop)
	let line = substitute(line, '\t', onetab, 'g')

	let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
	return line . '-' . repeat(" ",fillcharcount) . (foldedlinecount - 1) . '…' . ' '
endfunction
set foldtext=MyFoldText()
"}}}

"}}}
"Quick Edits ----------------------------------------------------------------{{{

"Upper Case
" nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

"Select (charwise) the contents of the current line, excluding indentation
nnoremap vv ^vg_

"Shortcut for []
onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[
map ;; A;<Esc>

imap <C-l> <Esc>$a


"}}}
"Paste Mode (Toggle) --------------------------------------------------------{{{

nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<<F5>>
set showmode

"}}}
"Relative Index (Toggle) ----------------------------------------------------{{{

nnoremap <leader><Tab> :call NumberToggle()<cr>

function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc
"}}}
"Vsplit and auto scroll lock ------------------------------------------------{{{

:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"}}}
"Django ---------------------------------------------------------------------{{{

"Navigation ------------------------------------------{{{

" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in stringj

"}}}
"Navigation ------------------------------------------{{{

let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/"  )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/"  )<cr>
nnoremap \8 :call RelatedFile ( "management/"  )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
	" #This is to check that the directory looks djangoish
	if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
		exec "edit %:h/" . a:file
		let g:last_relative_dir = expand("%:h") . '/'
		return ''
	endif
	if g:last_relative_dir != ''
		exec "edit " . g:last_relative_dir . a:file
		return ''
	endif
	echo "Cant determine where relative file is : " . a:file
	return ''
endfun

fun SetAppDir()
	if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
		let g:last_relative_dir = expand("%:h") . '/'
		return ''
	endif
endfun
autocmd BufEnter *.py call SetAppDir()

"}}}
"Surround Mappings -----------------------------------{{{

let b:surround_{char2nr("v")} = "{{ \r  }}"
let b:surround_{char2nr("{")} = "{{ \r  }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% enor %}"
let b:surround_{char2nr("c")} = "{% comment %	}\r{% endcomment %}"

"}}}

"}}}
"Python ---------------------------------------------------------------------{{{

"Run Python inside vim wih F9
:autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
	" SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

	" save and reload current file
	silent execute "update | edit"

	" get file path of current file
	let s:current_buffer_file_path = expand("%")

	let s:output_buffer_name = "Python"
	let s:output_buffer_filetype = "output"

	" reuse existing buffer window if it exists otherwise create a new one
	if !exists("s:buf_nr") || !bufexists(s:buf_nr)
		silent execute 'botright new ' . s:output_buffer_name
		let s:buf_nr = bufnr('%')
	elseif bufwinnr(s:buf_nr) == -1
		silent execute 'botright new'
		silent execute s:buf_nr . 'buffer'
	elseif bufwinnr(s:buf_nr) != bufwinnr('%')
		silent execute bufwinnr(s:buf_nr) . 'wincmd w'
	endif

	silent execute "setlocal filetype=" . s:output_buffer_filetype
	setlocal bufhidden=delete
	setlocal buftype=nofile
	setlocal noswapfile
	setlocal nobuflisted
	setlocal winfixheight
	setlocal cursorline " make it easy to distinguish
	setlocal nonumber
	setlocal norelativenumber
	setlocal showbreak=""
	resize 15

	" clear the buffer
	setlocal noreadonly
	setlocal modifiable
	%delete _

	" add the console output
	silent execute ".!python3 " . shellescape(s:current_buffer_file_path, 1)

	" resize window to content length
	" Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
	"       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
	"       But if you close the output buffer then it returns to using the default size when its recreated
	"execute 'resize' . line('$')

	" make the buffer non modifiable
	setlocal readonly
	setlocal nomodifiable
endfunction

"}}}
"Plugin Setup ---------------------------------------------------------------{{{

"Automatically Start Nerd Tree --------{{{

autocmd VimEnter * NERDTree
autocmd VimEnter * vertical resize 25
autocmd VimEnter * wincmd p
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

"}}}
"Vim Status Lines ---------------------{{{

let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

"}}}
"Vim Plugin: Ctrl-P -------------------{{{

let g:ctrlp_working_path_mode = 'ra'

"}}}
"Better Digraph -----------------------{{{
inoremap <expr>  <C-K>   BDG_GetDigraph()

"}}}
"vmath --------------------------------{{{

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

"}}}
"Dragvisuals --------------------------{{{

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"}}}
"Funprototype -------------------------{{{

let g:fun_prototypes_static_first = 0
let g:fun_prototypes_skip_fun_list=["main"]
let g:fun_prototypes_header = "/******************************************************/"
let g:fun_prototypes_body   = "/**              funtion prototypes                  **/"
let g:fun_prototypes_footer = "/******************************************************/"
" let g:fun_prototypes_header =""
" let g:fun_prototypes_body   ="/***************funtion prototypes*******************/"
" let g:fun_prototypes_footer =""
nnoremap <silent> <leader>fd :call FunProto()<CR>

"}}}
"Cscope_maps --------------------------{{{

"Horizontal Split output Ctrl-spacebar Ctrl-spacebar
nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

"Vertical Split output Ctrl-spacebar
nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"}}}
"Vim-Markdown -------------------------{{{

let g:vim_markdown_folding_disabled = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

"}}}
"Vim-Instant Markdown -----------------{{{

let g:instant_markdown_autostart = 0 "disable autostart
nnoremap <leader>md :InstantMarkdownPreview<CR>

"}}}
"VimWiki ------------------------------{{{

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"}}}
"YouCompleteMe ------------------------{{{

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0

"}}}
"isort --------------------------------{{{

let g:vim_isort_map = ''

"}}}
"UltiSnips ----------------------------{{{
" allowing javascript files to have html snippets
:autocmd FileType javascript UltiSnipsAddFiletypes html

" work with django
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

"}}}
"Ctrl-P -------------------------------{{{

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"}}}
"Table-Mode ---------------------------{{{

let g:table_mode_corner='|'

"}}}
" "Cscope ---------------------------{{{
" "
" let g:quickr_cscope_keymaps = 0
" nmap \s <plug>(quickr_cscope_symbols)
" nmap \g <plug>(quickr_cscope_global)
" nmap \c <plug>(quickr_cscope_callers)
" nmap \f <plug>(quickr_cscope_files)
" nmap \i <plug>(quickr_cscope_includes)
" nmap \t <plug>(quickr_cscope_text)
" nmap \e <plug>(quickr_cscope_egrep)
" nmap \d <plug>(quickr_cscope_functions)
"
" nmap <C-g>s <plug>(quickr_cscope_global_split)
" nmap <C-g>v <plug>(quickr_cscope_global_vert_split)
" "}}}
"
"----------------------------------------------------------------------------}}}

