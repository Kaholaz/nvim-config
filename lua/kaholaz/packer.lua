-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use("wbthomason/packer.nvim") -- Let packer take care of itself

	-- Fuzzy find
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Colors
	use("ellisonleao/gruvbox.nvim")
	vim.o.background = "dark" -- or "light" for light mode
	vim.cmd([[colorscheme gruvbox]])

	-- Language parseing
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use("nvim-treesitter/nvim-treesitter-context")

	-- Git
	use("tpope/vim-fugitive")

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                         -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}

	}

	-- TMUX naviagion
	use {
		'numToStr/Navigator.nvim',
		config = function()
			require('Navigator').setup()
		end
	}

	-- Utility
	use('mbbill/undotree')
end)
