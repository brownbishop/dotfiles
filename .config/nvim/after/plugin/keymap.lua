local opts = { remap = false }
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "Y", "yg$", opts)
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>p", "\"+p", opts)
vim.keymap.set("v", "<leader>p", "\"+p", opts)
vim.keymap.set("n", "<leader>Y", "\"+Y")

