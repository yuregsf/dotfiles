" Load plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
set softtabstop=2
set shiftwidth=2

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
Plug 'liuchengxu/vim-which-key'
Plug 'akinsho/flutter-tools.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dstein64/vim-startuptime'
Plug 'lewis6991/impatient.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind.nvim'
call plug#end()

lua require'impatient'.enable_profile()
lua require'yuregsf'


" Basics ======================================================
" autocmd
autocmd FileType tex,md set spell
autocmd FileType tex,md set spelllang=pt,en
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
set completeopt=menu,menuone,noinsert,noselect

" Colorscheme
set termguicolors
set background=dark
colorscheme gruvbox

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
"   function! s:expand_html_tab()
" " try to determine if we're within quotes or tags.
" " if so, assume we're in an emmet fill area.
"    let line = getline('.')
"    if col('.') < len(line)
"      let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
"      if len(line) >= 2
"         return "\<C-n>"
"      endif
"    endif
" " expand anything emmet thinks is expandable.
"   if emmet#isExpandable()
"     return emmet#expandAbbrIntelligent("\<tab>")
"     " return "\<C-E>,"
"   endif
" " return a regular tab character
"   return "\<tab>"
"   endfunction
"
" autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
"
"Telescope =================================================
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <F3> <cmd>Telescope live_grep<cr>

"vim-which-key =============================================
nnoremap <silent> <leader> :WhichKey '\'<CR>

"harpoon
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-t> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

"vim-devicons
"let g:webdevicons_enable_nerdtree = 1

"press <Tab> to expand or jump in a snippet. These can also be mapped separately
"via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
"-1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
