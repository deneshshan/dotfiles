-- Based on: https://github.com/ntk148v/neovim-config

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
vim.keymap.set("n", "<leader>fG", function()
  builtin.live_grep({
    glob_pattern = { "!**/spec/**", "!**/test/**", "!**/seeds/**", "!**/docs/**" }
  })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})        -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {})  -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

--Diff
vim.keymap.set("n", "<leader>dt", ":diffthis<CR>", {})

-- Formatting
vim.keymap.set("n", "<leader>o", ":!tmp/scripts/format.sh<Space>%<CR>:e<CR>")

-- Copying/Pasting
vim.keymap.set('n', '<leader>yp', function()
  local path = vim.fn.expand('%:p')
  local line = vim.fn.line('.')
  vim.fn.setreg('+', path .. ':' .. line)
end)

-- Open current file in Obsidian
local function open_in_obsidian()
  local vault_root = vim.env.WIKI_DIR
  if not vault_root or vault_root == '' then
    vim.notify('WIKI_DIR is not set', vim.log.levels.ERROR)
    return
  end

  local file = vim.fn.expand('%:p')
  local prefix = vault_root .. '/'
  if file:sub(1, #prefix) ~= prefix then
    vim.notify('Not in vault: ' .. vault_root, vim.log.levels.ERROR)
    return
  end

  local vault_name = vim.fn.fnamemodify(vault_root, ':t')
  local rel = file:sub(#prefix + 1)
  local encoded = rel:gsub('[^A-Za-z0-9/._-]', function(c)
    return string.format('%%%02X', string.byte(c))
  end)
  local uri = string.format('obsidian://open?vault=%s&file=%s', vault_name, encoded)
  vim.fn.system({ 'open', uri })
end

vim.api.nvim_create_user_command('Obsidian', open_in_obsidian, {})
vim.keymap.set('n', '<leader>ob', open_in_obsidian, { desc = 'Open current file in Obsidian' })
