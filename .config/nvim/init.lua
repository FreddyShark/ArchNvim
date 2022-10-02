vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.linebreak = true
vim.opt.colorcolumn = '89'
vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.encoding = 'utf-8'


-- global keymap
vim.g.mapleader = ','

vim.keymap.set('i', '<C-j>', '<nop>', {})
vim.keymap.set('i', '<C-k>', '<nop>', {})
vim.keymap.set('n', '<C-j>', '<C-W><C-J>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W><C-K>', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W><C-H>', { noremap = true })
vim.keymap.set('i', '<C-Space>', '<End>', { noremap = true })
vim.keymap.set('n', '<leader>r', ':edit!<cr>', { noremap = true })

vim.keymap.set('n', '<leader>,', ':exe "vertical resize +5<cr>"', { noremap = true })
vim.keymap.set('n', '<leader>.', ':exe "vertical resize -5<cr>"', { noremap = true })

-- insert a single character with s[character]"
vim.keymap.set('n', 's', ':exec "normal i".nr2char(getchar())."\\e"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'S', ':exec "normal a".nr2char(getchar())."\\e"<CR>', { noremap = true, silent = true })


-- extensions. see plugin/<extension> for keymaps.
require('plugins/plugins')
require('plugins/autocmp')
require('plugins/lsp')
require('plugins/fuzzy')


-- leave last to force attention if something fails.
vim.cmd('colorscheme molokai-dark')
