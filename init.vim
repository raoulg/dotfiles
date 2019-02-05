    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
    
" define <leader> 
let mapleader=","

" start plugs
call plug#begin('~/.local/share/nvim/plugged')

" a theme
Plug 'nightsense/simplifysimplify'

" latex support
Plug 'vim-latex/vim-latex'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:Tex_Leader='§'
" http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart/lsq-keyboard-shortcuts.html
" latex preview
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Syntax checker
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vimdiff
Plug 'rickhowe/diffchar.vim'
"noremap <leader>d <ESC>:windo diffthis \| windo set wrap<CR> 
nnoremap <silent> <Leader>d :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        windo diffthis
        windo set wrap
    endif
endfunction

" toggle showing of warnings or errors
nnoremap <leader>e :SyntasticToggleMode<CR>
nnoremap <leader>ew :SyntasticToggleWarnings<CR>

"python plugins
Plug 'tmhedberg/SimpylFold' " proper python folding
Plug 'vim-scripts/indentpython.vim' " indentation to match PEP8
Plug 'cjrh/vim-conda' " conda integration 
" use as CondaChangeEnv

" R environment
Plug 'jalvesaq/Nvim-R'
let R_term = 'iTerm'
" shortcuts to leave the R terminal in Nvim-R
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-h> <C-\><C-n><C-w>h

" nice formatting of csv files
Plug 'chrisbra/csv.vim'

" auto completion
"Plug 'ncm2/ncm2'
"Plug 'gaalcaras/ncm-R'

" tags (icm with ctags) 
Plug 'majutsushi/tagbar'
nnoremap <leader>t :TagbarOpenAutoClose<CR>
let g:tagbar_show_linenumbers=2

" rainbow colors for matching parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" configuration for colors
let g:rainbow_conf = {
\    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\    'ctermfgs': ['lightblue', 'lightyellow', 'lightgreen', 'lightmagenta', 'darkred'],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\    }
\}

" Ack search
Plug 'mileszs/ack.vim'

" navigation
Plug 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1 "nerdtree linenumbers
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" save windowconfiguration
"Plug 'thaerkh/vim-workspace'
"nnoremap <leader>w :ToggleWorkspace<CR>
Plug 'tpope/vim-obsession'
" Use :Obsess (with optional file/directory name)
"
" nice airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn'

" natural motion
Plug 'yuttie/comfortable-motion.vim'

" git support
Plug 'tpope/vim-fugitive'

" orgfiles
Plug 'jceb/vim-orgmode'
Plug 'godlygeek/tabular'

" markdown files
Plug 'plasticboy/vim-markdown'

" automated bullet lists in textfiles
Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" more themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme' " PaperColor

" C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"

Plug 'honza/vim-snippets'

" commenting all sorts of files
Plug 'scrooloose/nerdcommenter'

" surrounding words etc
Plug 'tpope/vim-surround'

" show marks in sideline
Plug 'kshenoy/vim-signature'

" completion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 0

" different distraction free writing plugins
Plug 'junegunn/goyo.vim'
Plug 'jacekd/vim-iawriter'
Plug 'junegunn/limelight.vim'
Plug 'bilalq/lite-dfm'
noremap <leader>l :Limelight!!<CR>
"noremap <leader>g :Goyo<CR>
noremap <leader>z :LiteDFMToggle<CR>
" keep cursor away from top or bottom
set scrolloff=7

" opening links
Plug 'vim-scripts/utl.vim'
" open links in safari
let g:utl_cfg_hdl_scm_http = "silent !open -a Safari '%u'"

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" fix center of document
Plug 'vim-scripts/scrollfix'
let g:scrollfix=-1
noremap <leader>fj :let g:scrollfix=50<CR>
noremap <leader>fn :let g:scrollfix=-1<CR>

" fast notetaking
Plug 'Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/org', '~/Dropbox/todo', './notes.md', '.notes.org']
let g:nv_ignore_pattern = ['*archive']
call plug#end()
" Plugin settings
"
filetype plugin indent on

" vertical and horizontal line
set cursorline
"set colorcolumn=80
"highlight ColorColumn ctermbg=9 guibg=LightBlue

" toggle for syntaxchecker
fun! SyntasticToggleQuiet(k, v)
  let idx = index(g:syntastic_quiet_messages[a:k], a:v)
  if idx == -1
    call add(g:syntastic_quiet_messages[a:k], a:v)
    echom 'Syntastic: '.a:k.':'.a:v.' disabled (filtered).'
  else
    call remove(g:syntastic_quiet_messages[a:k], idx)
    echom 'Syntastic: '.a:k.':'.a:v.' enabled (not filtered).'
  endif
endfun
command! SyntasticToggleWarnings call SyntasticToggleQuiet('level', 'warnings')
command! SyntasticToggleStyle    call SyntasticToggleQuiet('type', 'style')
let g:syntastic_quiet_messages = { "level": [],
      \ 'type': ['style'] }
" let g:syntastic_quiet_messages = {
        \ "regex":   'missing-docstring'}

" move through syntax list (I think)
nnoremap <leader>j :lne<CR>
nnoremap <leader>k :lprev<CR>

" show latex equations in markdown
let g:vim_markdown_math = 1 "markdown math

"remove highlight after search
nnoremap <leader><space> :nohlsearch<CR> 

" edit nvim-init
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR> 
" edit zsh-init
nnoremap <leader>ez :vsp ~/.zshrc<CR> 
" source vim-init after changes
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR> 

" surround word with ""
nnoremap <leader>" ea"<esc>bi"<esc>lel

" move to start or end of line
nnoremap H ^
nnoremap L $

" write file
inoremap <leader><leader> <Esc>:w<CR> 
nnoremap <leader><leader> :w<CR> 

" remap movement for multiline navigation
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <C-j> j
nnoremap <C-k> k

" let return create a blank line
nnoremap <CR> o<Esc>
nnoremap <S-Enter> O<Esc>

" change pwd to current file's dir
noremap <leader>cd :cd %:p:h<CR>

"" theme
colorscheme badwolf
"colorscheme PaperColor
" set background=light
"
function! ToggleBackground()
  if &background == "dark"
    colorscheme PaperColor
    set background=light
	else
    colorscheme badwolf
		set background=dark
	endif	
endfunction
noremap <Leader>b :call ToggleBackground() <CR>

"" tabs, folding

set tabstop=2
set shiftwidth=2
set expandtab
set fdm=manual

" python env
let g:python3_host_prog = '/usr/local/bin/python3'

augroup python_files
autocmd!
" run python files below
autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
" run python files in tmux
autocmd FileType python nnoremap <buffer> <leader>m :!tmux run-shell -t 1 'python %'<CR> 
" python indent
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 |
    \ set textwidth=79 expandtab autoindent fileformat=unix foldmethod=indent |
    \ set foldlevel=99 encoding=utf-8 |
    nnoremap <buffer> <leader>fo za
augroup END

augroup note_files
autocmd!
" better folding for text files
autocmd FileType org,markdown,tex set fdm=manual
autocmd Filetype tex setlocal nofoldenable
"autocmd BufNew, BufNewFile, BufRead *.tex set filetype=tex
augroup END
let g:tex_flavor='latex'

" R
augroup r_files
autocmd!
autocmd FileType r inoremap – <space><-<space>
autocmd FileType r inoremap π <space>%>%
autocmd FileType r set tabstop=2 softtabstop=2 shiftwidth=2
augroup END
let R_assign_map = '<A-->'

" linenumbers
set rnu
set nu


function! s:goyo_enter()
    set relativenumber
    set scrolloff=99
    Limelight
    " ...
endfunction

function! s:goyo_leave()
   Limelight!
   set scrolloff=7
   " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" configuration for tags
set tags=./tags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'R',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
    \ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds'     : [
        \ 'h:headings',
        \ 't:todo',
        \ 'd:done',
    \ ],
    \ 'sort' : 0
    \ }

let g:tagbar_type_tex = {
            \ 'ctagstype' : 'tex',
            \ 'kinds' : [
            \ 's:section',
            \ 'u:subsection',
            \ 't:subsubsection',
            \ 'l:label',
            \],
            \ 'replace' : 1,
            \ 'sort' : 0,
            \}

let g:tagbar_type_bib = {
            \ 'ctagstype' : 'bib',
            \ 'kinds' : [
            \ 'e:entry',
            \]
            \}

" code to create roxygen frameworks in R functions
function! Getparams()
    let s:start = line('.')
    let s:end = search("{")
    if stridx(getline(s:end),"{") == 0
        let s:end = s:end - 1
    endif
    let s:lines=getline(s:start,s:end)
    let linesCnt=len(s:lines)
    let mlines=join(s:lines)
    let mlines=substitute(mlines," ","","g")
    let paraFlag1=stridx(mlines,'(')
    let paraFlag2=strridx(mlines,')')
    let paraLen=paraFlag2-paraFlag1-1
    let parastr=strpart(mlines,paraFlag1+1,paraLen)
    let alist=[]
    if  stridx(parastr,',') != -1
       let s:paras=split(parastr,',')
       let s:idx=0
       while s:idx < len(s:paras)
             if stridx(s:paras[s:idx],'=') != -1
                  let s:realpara = split(s:paras[s:idx],'=')[0]
             else
                  let s:realpara = s:paras[s:idx]
             endif
             "strip the leading blanks
             "call append(s:start - 1 + s:idx , "#' @param " . s:realpara)
             call add(alist,s:realpara)
             let s:idx = s:idx + 1
       endwhile
    else
       "call append(s:start-1,parastr) 
       if parastr != ""
          call add(alist,parastr)
       endif
    endif
    return alist
endfunction

function!  Rdoc()
    let s:wd=expand("")
    let s:lineNo=line('.')-1
    let plist=Getparams()
    call append(s:lineNo,"#' title ")
    call append(s:lineNo + 1,"#' ")
    call append(s:lineNo + 2,"#' description")
    call append(s:lineNo + 3,"#' ")
    let s:idx =0
    while s:idx < len(plist)
        call append(s:lineNo + 4 + s:idx , "#' @param " . plist[s:idx] . " value")
        let s:idx = s:idx + 1
    endwhile
    call append(s:lineNo + 4 + s:idx,"#' @return returndes")
    call append(s:lineNo + 4 + s:idx + 1,"#' @export ")
    call append(s:lineNo + 4 + s:idx + 2,"#' @examples ")
    call append(s:lineNo + 4 + s:idx + 3,"#' x=c(1,2,3) ")
endfunction


nnoremap <F3> :call Rdoc() <CR>
