lua require'impatient'.enable_profile()
lua require'yuregsf'

" Basics ======================================================
" autocmd
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

filetype plugin on
filetype indent plugin on
syntax on
"
" Colorscheme
colorscheme gruvbox

" NERDTree ====================================================
map <C-b> :NERDTreeToggle <CR>
map <leader>b :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


" Remaps ======================================================
autocmd filetype tex inoremap $ $$<Esc>i

nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>do :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>f :lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gne :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> gpe :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> gnp :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>s :lua vim.lsp.diagnostic.get_line_diagnostics()<CR>
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
