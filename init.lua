local opt = vim.opt;
local keymap = vim.keymap;

print("Welcome Willow!")

require("config.lazy")

opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
});

keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show error under cursor" })
keymap.set('n', '<leader>kb', function() require('mini.files').open() end, { desc = 'Open mini.files' })

-- vim.keymap.set('n', 'nt',)
