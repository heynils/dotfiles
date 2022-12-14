-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Packer can manage itself

    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

    -- Fuzzy finder
    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- LSP
    use "neovim/nvim-lspconfig"

    -- Completion plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- Buffer completions
    use "hrsh7th/cmp-path" -- Path completions
    use "hrsh7th/cmp-nvim-lsp" -- LSP completions
    use "hrsh7th/cmp-nvim-lua" -- NVIM LSP completions

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- A bunch of snippets to use
    use "saadparwaiz1/cmp_luasnip" -- Snippet cmp integration

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

    -- File tree
    use "kyazdani42/nvim-tree.lua"

    -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-autopairs"

    -- Easily comment stuff
    use "numToStr/Comment.nvim"

    -- Indentation guidelines
    use "lukas-reineke/indent-blankline.nvim"

    -- Colored hex codes
    use "norcalli/nvim-colorizer.lua"

    -- Color scheme
    -- use "https://codeberg.org/oahlen/iceberg.nvim"
    use "rebelot/kanagawa.nvim"

    use "airblade/vim-gitgutter"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
