local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'scrooloose/nerdtree'
  use  'neovim/nvim-lspconfig'
  use  'nvim-lua/plenary.nvim'
  use  'nvim-telescope/telescope.nvim'
  use  'numToStr/Comment.nvim'
  use  'ThePrimeagen/harpoon'
  use  'hrsh7th/nvim-cmp'
  use  'hrsh7th/cmp-nvim-lsp'
  use  'hrsh7th/cmp-buffer'
  use  'hrsh7th/cmp-path'
  use  'hrsh7th/cmp-nvim-lua'
  use  'saadparwaiz1/cmp_luasnip'
  use  'L3MON4D3/LuaSnip'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'PotatoesMaster/i3-vim-syntax'
  use 'gruvbox-community/gruvbox'
  use 'vimwiki/vimwiki'
  use 'mattn/emmet-vim'
  use 'wakatime/vim-wakatime'
  use { 'prettier/vim-prettier', run = 'yarn install' }
  use  'lervag/vimtex'
  use  'tpope/vim-fugitive'
  use  'tpope/vim-surround'
  use  'windwp/nvim-autopairs'
  use  'nvim-treesitter/playground'
  use  'liuchengxu/vim-which-key'
  use   'ryanoasis/vim-devicons'
  use  'tiagofumo/vim-nerdtree-syntax-highlight'
  use  'dstein64/vim-startuptime'
  use  'lewis6991/impatient.nvim'
  use  'onsails/lspkind.nvim'
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
