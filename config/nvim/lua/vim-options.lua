-- tabs = 2 spaces
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- leader is comma
vim.g.mapleader = ","
vim.g.background = "light"

vim.opt.swapfile = false

-- navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- turn off search highlight
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')

-- fast saving
vim.keymap.set('n', '<leader>w', ':w!<CR>')

vim.wo.number = true
vim.wo.relativenumber = true

