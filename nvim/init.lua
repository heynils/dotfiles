-- Options
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
vim.highlight.priorities.semantic_tokens = 95

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

vim.api.nvim_del_keymap('n', 'grr')
vim.api.nvim_del_keymap('n', 'gri')
vim.api.nvim_del_keymap('n', 'grn')
vim.api.nvim_del_keymap('n', 'gra')

vim.api.nvim_del_keymap('n','<C-W>d')
vim.api.nvim_del_keymap('n','<C-W><C-D>')

-- Disable F1 opening help
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
-- Ctrl + backspace to delete word
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true, silent = true })

-- Change in tag
vim.api.nvim_set_keymap('n', 'cit', 'ci>', { noremap = true, silent = true })
-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- System clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

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
vim.keymap.set("n", "<C-W>", "<CMD>tabclose<CR>", { desc = "Close current tab" })

vim.keymap.set("n", "<C-TAB>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<C-S-TAB>", "gT", { desc = "Prev tab" })

vim.keymap.set("n", "<C-1>", "1gt", { desc = "Tab 1" })
vim.keymap.set("n", "<C-2>", "2gt", { desc = "Tab 2" })
vim.keymap.set("n", "<C-3>", "3gt", { desc = "Tab 3" })
vim.keymap.set("n", "<C-4>", "4gt", { desc = "Tab 4" })
vim.keymap.set("n", "<C-5>", "5gt", { desc = "Tab 5" })
vim.keymap.set("n", "<C-6>", "6gt", { desc = "Tab 6" })

-- Clear highlights
vim.keymap.set("n", "<leader><ESC>", "<CMD>nohl<CR>", { desc = "Clear search highlights" })

-- Insert functions
vim.keymap.set("n", "<leader>ii", "<CMD>r!uuidgen<CR>", { desc = "Insert UUID" })

-- Open terminal in horizontal split view
vim.keymap.set("n", "<leader>1", ":lua OpenBottomTerminal()<CR>")
local term_buf = nil  -- Store terminal buffer globally
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
        vim.cmd("split | resize 12")
        vim.api.nvim_win_set_buf(0, term_buf)
        vim.cmd("startinsert")
        return
    end

    -- Open a new terminal if no existing one is found
    vim.cmd("split | resize 12 | terminal")
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

-- Open NvimTree and old files on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      -- require("nvim-tree.api").tree.open()
      require("telescope.builtin").oldfiles()
    end
  end,
})


-- wqa to close terminals
vim.api.nvim_create_user_command('WQA', function()
  vim.cmd('silent! bdelete | qall!')
end, {})

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup("plugins")
require("dapui").setup()
require("lualine").setup()
