---------------------------
------- telescope ---------
---------------------------


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fx', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})

-- filebrowser extension keymap
vim.keymap.set('n', '<leader>fd', require("telescope").extensions.file_browser.file_browser, {noremap = true})

local fb_actions = require("telescope").extensions.file_browser.actions
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['<C-[>'] = 'close',
				['<C-h>'] = 'which_key',
				['<C-c>'] = nil,
				['<C-j>'] = 'move_selection_next',
				['<C-k>'] = 'move_selection_previous',
				['<C-r>'] = 'delete_buffer'
			}

		}
	},
	extensions = {
		file_browser = {
			mappings = {
				i = {
					['<C-y>'] = fb_actions.copy,
					['<C-p>'] = fb_actions.move,
					['<C-e>'] = fb_actions.create,
					['<C-d>'] = fb_actions.remove,
					['<C-c>'] = fb_actions.change_cwd,
					['<C-.>'] = fb_actions.toggle_hidden
				}
			}
		}
	}
}

require('telescope').load_extension('file_browser')


