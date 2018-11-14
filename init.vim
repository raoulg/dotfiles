    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

let mapleader=","
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'rlue/vim-getting-things-down'
Plug 'nightsense/simplifysimplify'
Plug 'vim-latex/vim-latex'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:Tex_Leader='§'
" http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart/lsq-keyboard-shortcuts.html
"
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"python plugins
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'cjrh/vim-conda'
" use as CondaChangeEnv

Plug 'jalvesaq/Nvim-R'
let R_term = 'iTerm'
" exit terminal and move to the upper window
tnoremap <C-k> <C-\><C-n><C-w>k

Plug 'ncm2/ncm2'
Plug 'gaalcaras/ncm-R'
Plug 'majutsushi/tagbar'
nnoremap <leader>t :TagbarOpenAutoClose<CR>
let g:tagbar_show_linenumbers=2

Plug 'skwp/vim-easymotion'
let g:EasyMotion_leader_key = '\'

Plug 'mileszs/ack.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1 "nerdtree linenumbers
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
Plug 'thaerkh/vim-workspace'
nnoremap <leader>w :ToggleWorkspace<CR>

Plug 'bling/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'jceb/vim-orgmode'
"Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

"themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

"Plug 'nightsense/night-and-day'
Plug 'OmniSharp/omnisharp-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1

" distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'jacekd/vim-iawriter'
Plug 'junegunn/limelight.vim'
Plug 'bilalq/lite-dfm'

Plug 'vim-scripts/utl.vim'

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/scrollfix'
let g:scrollfix=-1
noremap <leader>fj :let g:scrollfix=50<CR>
noremap <leader>fn :let g:scrollfix=-1<CR>

Plug 'Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/org', '~/Dropbox/todo', './notes.md', '.notes.org']
let g:nv_ignore_pattern = ['*archive']
call plug#end()
" Plugin settings
"
filetype plugin on
filetype plugin indent on

" night-and-day
"let g:nd_themes = [
"  \ ['sunrise+0', 'badwolf', 'light' ],
  "\ ['sunset+0',  'gruvbox', 'dark'  ],
  "\ ]
"let g:nd_latitude = '50'
"let g:nd_timeshift = '40'

set cursorline
set colorcolumn=80

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
nnoremap <leader>e :SyntasticToggleMode<CR>
nnoremap <leader>ew :SyntasticToggleWarnings<CR>

nnoremap <leader>j :lne<CR>
nnoremap <leader>k :lprev<CR>
let g:vim_markdown_math = 1 "markdown math
"stop highlight after search
nnoremap <leader><space> :nohlsearch<CR> 
" edit nvim-init
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR> 
" edit zsh-init
nnoremap <leader>ez :vsp ~/.zshrc<CR> 
" source vim-init after changes
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR> 
nnoremap <leader>" ea"<esc>bi"<esc>lel
nnoremap H ^
nnoremap L $

inoremap <leader><leader> <Esc>:w<CR> 
" remap movement for multiline navigation
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <C-j> j
nnoremap <C-k> k
" let return create a blank line
noremap <CR> o<Esc>
noremap <S-Enter> O<Esc>

" change pwd to current file's dir
noremap <leader>cd :cd %:p:h<CR>
let g:utl_cfg_hdl_scm_http = "silent !open -a Safari '%u'"

"" theme
colorscheme badwolf

"" tabs, folding
set tabstop=4
set shiftwidth=4
set expandtab
"set sessionoptions+=folds
set fdm=manual
"
let g:python3_host_prog = '/usr/bin/python3'
let g:UltiSnipsExpandTrigger="<tab>"


" run python files below
augroup python_files
autocmd!
autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <leader>m :!tmux run-shell -t 1 'python %'<CR> 
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 |
    \ set textwidth=79 expandtab autoindent fileformat=unix foldmethod=indent |
    \ set foldlevel=99 encoding=utf-8 |
    nnoremap <buffer> <leader>fo za
augroup END

augroup note_files
autocmd!
autocmd FileType org,markdown,tex set fdm=manual
autocmd Filetype tex setlocal nofoldenable
augroup END

" R
augroup r_files
autocmd!
autocmd FileType r inoremap <leader>- <space><-<space>
autocmd FileType r inoremap <leader>p <space>%>%
augroup END

"autocmd FileType r :iabbrev <buffer> func function() {}<left><CR><CR><esc>:norm kf(a<CR>

let R_assign_map = '<A-->'
set rnu
set nu

noremap <leader>l :Limelight!!<CR>
noremap <leader>g :Goyo<CR>
noremap <leader>z :LiteDFMToggle<CR>
set scrolloff=7

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

function Getparams()
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

function  Rdoc()
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
