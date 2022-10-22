local Remap = require('keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("Y", "yg$")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

local telescope_pickers = require('telescope.builtin')
nnoremap("<leader>ff", telescope_pickers.find_files)
nnoremap("<leader>fg", telescope_pickers.live_grep)
nnoremap("<leader>fb", telescope_pickers.buffers)
nnoremap("<leader>fh", telescope_pickers.help_tags)
nnoremap("<leader>fd", telescope_pickers.diagnostics)
nnoremap("<leader>fs", telescope_pickers.lsp_document_symbols)
nnoremap("<leader>ft", telescope_pickers.treesitter)
nnoremap("<leader>fp", telescope_pickers.planets)

