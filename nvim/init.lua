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
vim.o.scrolloff = 10
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

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

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

vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true, silent = true })

vim.api.nvim_del_keymap('n', 'grr')
vim.api.nvim_del_keymap('n', 'gri')
vim.api.nvim_del_keymap('n', 'grn')
vim.api.nvim_del_keymap('n', 'gra')

vim.api.nvim_del_keymap('n', '<C-W>d')
vim.api.nvim_del_keymap('n', '<C-W><C-D>')

-- Disable F1 opening help
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")

-- Remap jj to Esc
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

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
vim.keymap.set("n", "<leader>w", "<CMD>close<CR>", { desc = "Close current window" })

-- Close floating (help) buffer
vim.keymap.set("n", "<ESC>", "<CMD>fclose<CR>", { desc = "Close floating buffer" })

-- Next buffer
vim.keymap.set("n", "<leader>n", "<CMD>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>N", "<CMD>bprevious<CR>", { desc = "Go to previous buffer" })

vim.api.nvim_set_keymap('n', '<M-Right>', '<C-i>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Left>', '<C-o>', { noremap = true, silent = true })

-- Tab operations
vim.keymap.set("n", "<C-T>", "<CMD>$tabnew<CR>", { desc = "New tab" })

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
vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Open terminal in horizontal split view
vim.keymap.set("n", "<leader>1", ":lua OpenBottomTerminal()<CR>")
local term_buf = nil -- Store terminal buffer globally
function OpenBottomTerminal()
    -- Check if the stored buffer is still valid
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        -- Check if the terminal buffer is already in a window
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == term_buf then
                -- Switch to that window and enter insert mode
                vim.api.nvim_set_current_win(win)
                vim.cmd("startinsert")
                return
            end
        end
        -- If the terminal exists but is not in a window, open it in a new split
        vim.cmd("split | resize 24")
        vim.api.nvim_win_set_buf(0, term_buf)
        vim.cmd("startinsert")
        return
    end

    -- Open a new terminal if no existing one is found
    vim.cmd("split | resize 24 | terminal")
    term_buf = vim.api.nvim_get_current_buf() -- Store the buffer ID
    vim.cmd("startinsert")
end

-- Commands
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Open telescope old files on startup 
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         if vim.fn.argc() == 0 then
--             require("telescope.builtin").oldfiles()
--         end
--     end,
-- })

-- WQA to close terminals
vim.api.nvim_create_user_command('WQA', function()
    vim.cmd('wa | silent! bdelete | qall!')
end, {})

vim.opt.rtp:prepend(lazy_path)
require("lazy").setup("plugins")

-- harpoon setup
local harpoon = require("harpoon")
harpoon:setup()
-- Cycle through file list
local function harpoon_next()
    local list = harpoon:list()
    list._index = list._index + 1
    if list._index > #list.items then
        list._index = 1
    end
    list:select(list._index)
end

local function harpoon_prev()
    local list = harpoon:list()
    list._index = list._index - 1
    if list._index < 1 then
        list._index = #list.items
    end
    list:select(list._index)
end

vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>x", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-S-TAB>", function() harpoon_prev() end)
vim.keymap.set("n", "<C-TAB>", function() harpoon_next() end)
vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

require("dapui").setup()
require("lualine").setup()
