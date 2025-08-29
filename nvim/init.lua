vim.loader.enable()
-- Options
vim.o.autochdir = true
vim.o.autoindent = true
vim.o.backup = false
vim.o.breakindent = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.mouse = "a"
vim.o.number = true
vim.o.pumblend = 10
vim.o.relativenumber = true
vim.o.scrolloff = 0
vim.o.shiftwidth = 4
vim.o.shortmess = "IF"
vim.o.showmatch = true
vim.o.showmode = true
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.o.winbar = "%F"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Prevent LSP from overwriting treesitter color settings
vim.hl.priorities.semantic_tokens = 95

-- Disable some builtin vim plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Write buffer/Save file with Ctrl + S
vim.keymap.set("n", "<C-s>", vim.cmd.w)

vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })

vim.api.nvim_del_keymap("n", "grr")
vim.api.nvim_del_keymap("n", "gri")
vim.api.nvim_del_keymap("n", "grn")
vim.api.nvim_del_keymap("n", "gra")

vim.api.nvim_del_keymap("n", "<C-W>d")
vim.api.nvim_del_keymap("n", "<C-W><C-D>")

-- Disable F1 opening help
vim.api.nvim_set_keymap("n", "<F1>", "<Nop>", { noremap = true, silent = true })
-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Better window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Navigation in insert mode
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-h>", "<Left>")

-- Keep cursor in the middle of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle of screen for search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Faster way to enter insert mode
vim.keymap.set("v", "i", "<ESC>i")
vim.keymap.set("v", "a", "<ESC>a")

-- Sane way of exiting terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Close current buffer
vim.keymap.set("n", "<leader>q", "<CMD>bp<BAR>bd#<CR>", { desc = "Close current buffer" })
-- Close current window
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = "Write buffer" })

-- Next buffer
vim.keymap.set("n", "<leader>n", "<CMD>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>N", "<CMD>bprevious<CR>", { desc = "Go to previous buffer" })

-- Clear highlights
vim.keymap.set("n", "<leader><ESC>", "<CMD>nohl<CR>", { desc = "Clear search highlights" })

-- Insert functions
vim.keymap.set("n", "<leader>ii", "<CMD>r!uuidgen<CR>", { desc = "Insert UUID" })

-- Fix copy and paste
vim.o.clipboard = "unnamedplus"
local function paste()
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = paste,
        ["*"] = paste,
    },
}
-- System clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
    { "n", "v", "x" },
    "<leader>Y",
    '"+yy',
    { noremap = true, silent = true, desc = "Yank line to clipboard" }
)

-- Commands
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- WQA to close terminals
vim.api.nvim_create_user_command("WQA", function()
    vim.cmd("wa | silent! bdelete | qall!")
end, {})

vim.opt.rtp:prepend(lazy_path)
require("lazy").setup("plugins")

vim.g.dotnet_show_project_file = false
vim.filetype.add({
    extension = {
        bicep = "bicep",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "ts",
        "tsx",
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "json",
        "css",
        "html",
        "yaml",
        "markdown",
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs", "razor" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})
-- Highlight groups for styling
vim.api.nvim_set_hl(0, "WinbarPath", { fg = "#b4befe", bold = true })
vim.api.nvim_set_hl(0, "CmpDocumentation", { bg = "#1e1e2e", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = "#1e1e2e", fg = "#585b70" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Function to generate full path winbar
function _G.MyWinbar()
    local path = "%F"
    local modified = vim.bo.modified and " ●" or ""

    return table.concat({
        "%#WinbarPath#",
        path,
        modified,
        "%#Normal#",
    })
end

-- Set winbar to use this function
vim.o.winbar = "%=%{%v:lua.MyWinbar()%}%="
