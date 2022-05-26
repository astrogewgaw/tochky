local cmd = vim.cmd
local glob = vim.fn.glob
local none = vim.fn.empty
local exe = vim.fn.system
local data_path = vim.fn.stdpath("data")
local packer_url = "https://github.com/wbthomason/packer.nvim"
local install_path = data_path .. "/site/pack/packer/start/packer.nvim"

if none(glob(install_path)) > 0 then
	INSTALL_PATH = exe({ "git", "clone", "--depth", "1", packer_url, install_path })
	print("Packer is being installed!")
	print("Restart Neovim.")
	print("This ensures that all plugins are installed and loaded.")
	cmd([[ packadd packer.nvim ]])
end

cmd([[
    augroup _packer
        autocmd!
        autocmd BufWritePost core.lua source <afile> | PackerSync
    augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local plugins = {
	"lervag/vimtex",
	"roxma/nvim-yarp",
	"sbdchd/neoformat",
	"sirver/ultisnips",
	"Lilja/vim-chezmoi",
	"fladson/vim-kitty",
	"goolord/alpha-nvim",
	"alker0/chezmoi.vim",
	"folke/trouble.nvim",
	"gelguy/wilder.nvim",
	"romgrk/barbar.nvim",
	"pwntester/octo.nvim",
	"b3nj5m1n/kommentary",
	"APZelos/blamer.nvim",
	"nvim-lua/popup.nvim",
	"kevinhwang91/rnvimr",
	"NoahTheDuke/vim-just",
	"folke/which-key.nvim",
	"psliwka/vim-smoothie",
	"lambdalisue/suda.vim",
	"kdheepak/lazygit.nvim",
	"Pocco81/AutoSave.nvim",
	"neovim/nvim-lspconfig",
	"folke/lsp-colors.nvim",
	"nvim-lua/plenary.nvim",
	"Xuyuanp/scrollbar.nvim",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"lewis6991/gitsigns.nvim",
	"junegunn/vim-easy-align",
	"rhysd/git-messenger.vim",
	"lewis6991/impatient.nvim",
	"folke/todo-comments.nvim",
	"yamatsum/nvim-cursorline",
	"nvim-lualine/lualine.nvim",
	"lewis6991/spellsitter.nvim",
	"norcalli/nvim-colorizer.lua",
	"IndianBoy42/tree-sitter-just",
	"JuliaEditorSupport/julia-vim",
	"tamago324/nlsp-settings.nvim",
	"iamcco/markdown-preview.nvim",
	"kyazdani42/nvim-web-devicons",
	"nvim-telescope/telescope.nvim",
	"KeitaNakamura/tex-conceal.vim",
	"williamboman/nvim-lsp-installer",
	"nvim-treesitter/nvim-treesitter",
	"jose-elias-alvarez/null-ls.nvim",
	"antoinemadec/FixCursorHold.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
}

-- All the colorschemes I use.

local colors = {
	"Rigellute/rigel",
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"sainnhe/gruvbox-material",
}

-- Plugin setup.

return packer.startup(function(use)
	-- Packer can manage itself.
	use("wbthomason/packer.nvim")

	-- HACK: Install COQ. This requires additional
	-- options, hence it is done separately. Also,
	-- installing COQ artifacts and its thirdparty
	-- plugins.

	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.thirdparty", branch = "3p" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })

	-- All the other plugins.
	for _, plugin in ipairs(plugins) do
		use({ plugin })
	end

	-- And, at last, all the color schemes.
	for _, color in ipairs(colors) do
		use({ color })
	end

	-- If we are installing Packer for the first time,
	-- automatically install and configure everything.
	if INSTALL_PATH then
		require("packer").sync()
	end
end)
