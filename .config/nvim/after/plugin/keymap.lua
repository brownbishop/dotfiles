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

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>fg", function()
    require('telescope.builtin').live_grep()
end)
nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>fh", function()
    require('telescope.builtin').help_tags()
end)
