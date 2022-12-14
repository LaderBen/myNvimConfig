local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {"numToStr/Comment.nvim", config = function() require('Comment').setup() end} -- A comment nvim plugin
  use "gcmt/wildfire.vim"
  use "tpope/vim-surround"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "jmcantrell/vim-virtualenv"
  use "morhetz/gruvbox"
  use "dense-analysis/ale"
  use {'neoclide/coc.nvim', branch = 'release'}
  use "honza/vim-snippets"
  use 'junegunn/fzf'
  use 'ggandor/leap.nvim'
  use 'dhruvasagar/vim-table-mode'
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSInstall java c python"}
  use "JoosepAlviste/nvim-ts-context-commentstring"  
  use "SirVer/ultisnips"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
