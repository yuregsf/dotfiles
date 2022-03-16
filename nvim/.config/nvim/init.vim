" Load plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
set softtabstop=2
set shiftwidth=2
" plugin graveyard
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'posva/vim-vue'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ctrlpvim/ctrlp.vim'

" Plugins =====================================================
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'gruvbox-community/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'akinsho/flutter-tools.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'hrsh7th/nvim-compe'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()


" Basics ======================================================

" autocmd
autocmd FileType tex,md set spell
autocmd FileType tex,md set spelllang=pt,en
"autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
"autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"autocmd BufEnter *.{js,jsx,ts,tsx} :LspStart tsserver
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let mapleader = " "

filetype plugin on
filetype indent plugin on

syntax on

set number relativenumber
set encoding=utf-8
set wildmode=longest,list,full
set splitbelow splitright
set expandtab
set nocompatible
set nohlsearch
set mouse=a
set completeopt=menuone,noinsert,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Colorscheme
set termguicolors
set background=dark
colorscheme gruvbox

" ctrlp ====================================================
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
"let g:ctrlp_working_path_mode = 'wa'
" NERDTree ====================================================
map <C-b> :NERDTreeToggle <CR>
map <leader>b :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


" Remaps ======================================================
autocmd filetype tex inoremap $ $$<Esc>i
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <leader>rr :source $MYVIMRC<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Coc keybindings ==============================================
"nmap <F3> :CocSearch 
"nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
"nmap <F2> <Plug>(coc-rename)

" TAB trigger completion
"inoremap <silent><expr> <TAB>
"	\ pumvisible() ? "\<C-n>" :
"	\ <SID>check_back_space() ? "\<TAB>" :
"	\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col -1] =~# '\s'
"endfunction

" Load extensions
"let g:coc_global_extensions = [
"  \ 'coc-tsserver'
"  \ ]

" conditional linting
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"  let g:coc_global_extensions += ['coc-prettier']
"endif
"
"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"  let g:coc_global_extensions += ['coc-eslint']
"endif

" ctrl+spce trigger completion
"inoremap <silent><expr> <c-space> coc#refresh()

"GoTo navigation
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> gne :call CocAction("diagnosticNext")<CR>
"nmap <silent> gpe :call CocAction("diagnosticPrevious")<CR>

" doc on hover
"nnoremap <silent> K :call CocAction('doHover')<CR>

" diagnostics
"nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

"code action
"nmap <leader>do <Plug>(coc-codeaction)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

"Prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"vmap <leader>f :CocCommand prettier.formatFile
"nmap <leader>f :CocCommand prettier.formatFile

" treesitter ==================================================
lua << EOF
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true
    }
}
EOF


" native-lsp ==================================================
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.tsserver.setup{
  root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", "tsconfig.json", "jsconfig.json", ".git"),

  init_options = {
    plugins = {
      {
          name = 'typescript-styled-plugin',
          location = '/lib/node_modules/typescript-styled-plugin'
        }
      }
    }
}

require('lspconfig').clangd.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').tailwindcss.setup{}
require('flutter-tools').setup{
  widget_guides = {
  enabled = true,
    }
}
EOF


nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>do :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>f :lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gne :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gpe :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gnp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>s :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>


"Vimtex =======================================================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

"Emmet ========================================================
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript': {
\      'extends': 'jsx'
\  }
\}

" Remapping <C-E>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return emmet#expandAbbrIntelligent("\<tab>")
    " return "\<C-E>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction

autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()

" nvim-completion =============================================
"let g:completion_enable_auto_popup = 0
"imap <tab> <Plug>(completion_smart_tab)
"imap <s-tab> <Plug>(completion_smart_s_tab)

" nvim-autopairs ==============================================
lua require('nvim-autopairs').setup{}

" nvim-compe ==================================================
 let g:compe = {}
 let g:compe.enabled = v:true
 let g:compe.autocomplete = v:true
 let g:compe.debug = v:false
 let g:compe.min_length = 1
 let g:compe.preselect = 'enable'
 let g:compe.throttle_time = 80
 let g:compe.source_timeout = 200
 let g:compe.incomplete_delay = 400
 let g:compe.max_abbr_width = 100
 let g:compe.max_kind_width = 100
 let g:compe.max_menu_width = 100
 let g:compe.documentation = v:true

 let g:compe.source = {}
 let g:compe.source.path = v:true
 let g:compe.source.buffer = v:true
 let g:compe.source.calc = v:true
 let g:compe.source.nvim_lsp = v:true
 let g:compe.source.nvim_lua = v:true
 let g:compe.source.vsnip = v:false

 inoremap <silent><expr> <C-Space> compe#complete()
 inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
 "inoremap <silent><expr> <C-e>     compe#close('<C-e>')
 inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
 inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
 inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
 inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Telescope =================================================
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <F3> <cmd>Telescope live_grep<cr>

"vim-which-key =============================================
nnoremap <silent> <leader> :WhichKey '\'<CR>

"Comment
lua require'Comment'.setup{}

"harpoon
lua require'harpoon'.setup{}
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-t> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

"jupyter-nvim

lua require'jupyter-nvim'.setup{}
