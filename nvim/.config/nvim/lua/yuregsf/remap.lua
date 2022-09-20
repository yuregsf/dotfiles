local nnoremap = require("yuregsf.keymap").nnoremap
local inoremap = require("yuregsf.keymap").inoremap
local vnoremap = require("yuregsf.keymap").vnoremap

nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-H>', '<C-W><C-H>')
nnoremap('<C-L>', '<C-W><C-L>')

nnoremap('<leader>rr', ':source $MYVIMRC<CR>')

nnoremap("Y", 'y$')
nnoremap("n", 'nzzzv')
nnoremap("N", 'Nzzzv')
nnoremap("J", "mzJ'z")

inoremap(',', ',<c-g>u')
inoremap('.', '.<c-g>u')
inoremap('!', '!<c-g>u')
inoremap('?', '?<c-g>u')
nnoremap('<expr>', "k (v:count > 5 ? \"m'\" . v:count : \"\") . 'k'")
nnoremap('<expr>', "j (v:count > 5 ? \"m'\" . v:count : \"\") . 'j'")

vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

inoremap('<C-j>', '<esc>:m .+1<CR>==')
inoremap('<C-k>', '<esc>:m .-2<CR>==')

nnoremap('<leader>j', ':m .+1<CR>==')
nnoremap('<leader>k', ':m .-2<CR>==')

nnoremap('<leader>gs', ':Git<CR>')
nnoremap('<leader>gc', ':Git commit<CR>')
