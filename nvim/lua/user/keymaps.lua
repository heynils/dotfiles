vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Remap space as leader key
map("", "<Space>", "<Nop>")

-- Yank to end of line
map("n", "Y", "y$")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move text up and down
map("n", "<A-j>", "<CMD>m .+1<CR>==")
map("n", "<A-k>", "<CMD>m .-2<CR>==")

-- Keep cursor in the middle of screen
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear highlights
map("n", "<leader>ch", "<CMD>nohl<CR>")

-- Go to next/previous buffer
map("n", "H", "<CMD>bp<CR>")
map("n", "L", "<CMD>bn<CR>")

-- Close current buffer
map("n", "<leader>q", "<CMD>bp<BAR>bd#<CR>")

-- Telescope
map("n", "<leader>f", "<CMD>Telescope find_files hidden=true<CR>")
map("n", "<leader>g", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>b", "<CMD>Telescope buffers<CR>")
map("n", "<leader>s", "<CMD>Telescope treesitter<CR>")
map("n", "<leader>d", "<CMD>Telescope diagnostics<CR>")

-- NvimTree
map("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")
map("n", "<leader>T", "<CMD>NvimTreeFindFile<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Faster way to enter insert mode
map("v", "i", "<ESC>i")
map("v", "a", "<ESC>a")

-- Sane way of exiting terminal mode
map("t", "<ESC>", "<C-\\><C-n>")
