-- Set leader key to space
vim.g.mapleader = " "

-- easy file explorer access
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- "d" deletes and doesn't save to buffer. Use "x" to cut.
vim.keymap.set("n", "d", "\"_d")
