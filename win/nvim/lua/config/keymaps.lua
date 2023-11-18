--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/keymaps.lua
-- Description: Key mapping configs
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>

vim.keymap.set("n", "<Space>", ":", {})
vim.keymap.set("n", "<Tab>", "/", {})

-- Tabs/buffers
vim.keymap.set("n", "<right>", "<cmd>tabn<cr>", {})
vim.keymap.set("n", "<left>", "<cmd>tabp<cr>", {})
vim.keymap.set("n", "<up>", "<cmd>bp<cr>", {})
vim.keymap.set("n", "<down>", "<cmd>bn<cr>", {})
vim.keymap.set("n", "<C-t>", ":tabe %<CR>", {})
vim.keymap.set("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", {})

-- JSON
vim.keymap.set("n", "<leader>jt", ":%!python<Space>-m<Space>json.tool<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})        -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {})  -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file
