-- [[ Set leader key ]]
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Toggle spellcheck
vim.keymap.set('n', '<leader>ts', ':set invspell<CR>', { silent = true, desc = '[T]oggle [S]pellcheck' })

-- Edit configuration
vim.keymap.set('n', '<leader>ce', ':next $MYVIMRC<CR>', { silent = true, desc = '[C]onfiguration [E]dit' })

-- Go to current buffer directory
vim.keymap.set('n', '<leader>bd', ':cd %:h<CR>', { silent = true, desc = 'Go to [B]uffer [D]irectory' })

-- Set "Shift + Insert" for paste
if vim.fn.has('win64') or vim.fn.has('win32') or vim.fn.has('win32unix') then
  vim.keymap.set('n', '<S-Insert>', '"+p')
  vim.keymap.set({ 'i', 'c' }, '<S-Insert>', '<C-R>+')
end

-- Delete/Paste w/o buffer
vim.keymap.set({ 'n', 'v' }, '<Del>', '"_d')
vim.keymap.set('n', '<Del><Del>', '"_dd')
vim.keymap.set('v', '<leader>p', '"_dP')

-- Toggle read-only
vim.keymap.set('n', '<leader>ro', ':set ro!<CR>', { desc = 'Toggle [R]ead-[O]nly' })

-- Toggle relative number
vim.keymap.set('n', '<leader>n', ':set relativenumber!<CR>', { desc = 'Toggle Relative-[N]umber' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- vim: ts=2 sts=2 sw=2 et
