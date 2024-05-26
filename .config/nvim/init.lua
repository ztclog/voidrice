vim.o.ic = true
vim.o.nu = true
vim.o.rnu = true
vim.o.wrap = false
vim.o.title = true
vim.o.cb = "unnamedplus"
vim.o.encoding = "utf-8"
vim.o.termguicolors = true

vim.g.mapleader = " " 

-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
	"sbdchd/neoformat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"rcarriga/nvim-notify",
	"neovim/nvim-lspconfig",
	"kevinhwang91/nvim-hlslens",
	"terryma/vim-multiple-cursors",
	"nvim-treesitter/nvim-treesitter",
	{
		"junegunn/goyo.vim",
		keys = {
			{ "<leader>y", "<cmd>Goyo<CR>" },
		},
	},
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		keys = {
			{ "<C-p>", "<cmd>MarkdownPreviewToggle<CR>" },
		},
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>n", "<cmd>Neotree toggle<CR>" },
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	}
}
local opts = {}

require("lazy").setup(plugins, opts)
require("hlslens").setup()

-- cargo install
require'lspconfig'.harper_ls.setup{}
-- npm i -g 
require'lspconfig'.astro.setup{}
-- pacman -S
require'lspconfig'.ccls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.yamlls.setup{}
