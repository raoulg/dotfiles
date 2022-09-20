
let mapleader=","


call plug#begin()

Plug 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1 "nerdtree linenumbers
noremap <leader>n :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>
let NERDTreeQuitOnOpen=1


Plug 'nvim-lua/plenary.nvim' " requirement for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'

Plug 'chrisbra/csv.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='tomorrow'


Plug 'plasticboy/vim-markdown'

" more themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme' " PaperColor
Plug 'Rigellute/shades-of-purple.vim'
Plug 'marko-cerovac/material.nvim'
"" quarto
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'

"" commenting all sorts of files
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'voldikss/vim-floaterm'

call plug#end()


set rnu

"" copy selection to other window
noremap <leader>vc y<c-w>wpG<c-w>pgv
"" copy visual selection to other window
noremap <leader>vx d<c-w>wpG<c-w>p
noremap <silent> <leader> :<c-u>WhichKey ','<CR>
noremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>


"" timeout for which key
set timeoutlen=500 

let g:which_key_map =  {}
call which_key#register(',', "g:which_key_map")
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)

function! s:gitModified()
   let files = systemlist('git ls-files -m 2>/dev/null')
   return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
   let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
   return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

let g:startify_lists = [
         \ { 'type': 'files',     'header': ['   files']            },
         \ { 'type': 'dir',       'header': ['   dir '. getcwd()] },
  	  \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
 	  \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
         \ { 'type': 'commands',  'header': ['   Commands']       },
         \ ]


" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"""" enable the theme
syntax enable
colorscheme shades_of_purple


lua << EOF

local keymap = {
	e = {
		name = '+edit',
		v = {'<Cmd>vsp ~/.config/nvim/init.vim<CR>' , 'edit vimrc'},
		z = {'<Cmd>vsp ~/.zshrc<CR>', 'edit zshrc'},
		p = {'<Cmd>PlugInstall<CR>', 'plug install'},
		s = {'<Cmd>source ~/.config/nvim/init.vim<CR>', 'source init.vim'},
	},

	w = {
		name = '+windows',
		d = {'<C-w>c', 'delete-window'},
		w = {'<C-w>w', 'other window'},
		H = {'<C-w>10<', 'expand left'},
		L = {'<C-w>10>', 'expand right'},
		J = {'<Cmd>resize +5<CR>', 'expand below'},
		K = {'<Cmd>resize -5<CR>', 'expand up'},
		b = {'<C-w>=', 'balance'},

	},
	
	p = {
		name = '+paths',
		c = {'<Cmd>cd %:p:h<CR>', 'change pwd to this file'},
		p = {'<Cmd>PlugInstall<CR>', 'pluginstall'},
	},
	
	t = {
		name = "+terminal",
		n = {'<Cmd>FloatermNew<CR>', 'new terminal'},
		t = {'<Cmd>FloatermToggle<CR>', 'toggle terminal'},
		},
	b = {name = "+buffers",
	h = {'<Cmd>Startify<CR>', 'home buffer'},
	},
	
	g = {
		name = "+git",
		s = {"<Cmd>Git<CR>", "status"},
		c = {"<Cmd>Git commit<CR>", "commit"},
		d = {"<Cmd>Git diff<CR>", "diff"},
		l = {"<Cmd>Git log<CR>", "log"},

		},
    
    f = { -- set a nested structure
        name = '+find/files',
	f = {'<Cmd>Files<CR>', 'files'},
	t = {'<Cmd>NvimTreeToggle<CR>', 'tree'},
	g = {'<Cmd>Telescope git_files<CR>', 'git files'},
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'},
        },
        q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
        g = {
            name = '+git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
        },
    }
}

local wk = require('whichkey_setup')
wk.register_keymap('leader', keymap)

EOF
