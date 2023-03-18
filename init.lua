-- 基础设置
require('basic')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "Mofiqul/dracula.nvim",
  {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }},
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  "williamboman/mason-lspconfig.nvim",
  'folke/neodev.nvim',
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "onsails/lspkind-nvim",
  "lukas-reineke/indent-blankline.nvim",
  "arkav/lualine-lsp-progress",
  -- Cmp Plugins
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  "rafamadriz/friendly-snippets",
  -- snippet
  -- 'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
 -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "<CurrentMajor>.*",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
  },
  {"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end},
  "kyazdani42/nvim-web-devicons",
  "moll/vim-bbye",
  "akinsho/bufferline.nvim",
  "nvim-telescope/telescope.nvim",
})

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2383
require 'nvim-treesitter.install'.compilers = { "clang" }

-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置 （新增）
-- require("colorscheme")
-- 插件配置
-- require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
-- require("plugin-config.telescope")
-- require 'nvim-treesitter.install'.compilers = { "clang" }
require("plugin-config.nvim-treesitter")

-- 内置LSP (新增)
require("lsp.setup")
-- 自动补全
require("cmp.setup")
require("plugin-config.indent-blankline")
