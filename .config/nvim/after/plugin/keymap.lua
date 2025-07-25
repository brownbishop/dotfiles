local opts = { remap = false }
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "Y", "yg$", opts)
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>p", "\"+p", opts)
vim.keymap.set("v", "<leader>p", "\"+p", opts)
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- vim.keymap.set({ 'i' }, '<C-j>', function()
--     if vim.snippet.active({ direction = 1 }) then
--         return '<Cmd>lua vim.snippet.jump(1)<CR>'
--     else
--         return '<C-j>'
--     end
-- end, { expr = true })
--
--
-- vim.keymap.set({ 'i', 's' }, '<C-j>', function()
--     if vim.snippet.active({ direction = 1 }) then
--         return '<Cmd>lua vim.snippet.jump(1)<CR>'
--     else
--         return '<C-j>'
--     end
-- end, { expr = true })
--
-- vim.keymap.set({ 'i', 's' }, '<C-k>', function()
--     if vim.snippet.active({ direction = -1 }) then
--         return '<Cmd>lua vim.snippet.jump(-1)<CR>'
--     else
--         return '<C-k>'
--     end
-- end, { expr = true })

