local telescope = require('telescope')
telescope.setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter =  require('telescope.sorters').get_fzf_sorter,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
telescope.load_extension('fzf')

local telescope_pickers = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", telescope_pickers.find_files)
vim.keymap.set("n", "<leader>fg", telescope_pickers.live_grep)
vim.keymap.set("n", "<leader>fb", telescope_pickers.buffers)
vim.keymap.set("n", "<leader>fh", telescope_pickers.help_tags)
vim.keymap.set("n", "<leader>fd", telescope_pickers.diagnostics)
vim.keymap.set("n", "<leader>fs", telescope_pickers.lsp_document_symbols)
vim.keymap.set("n", "<leader>ft", telescope_pickers.treesitter)
vim.keymap.set("n", "<leader>fp", telescope_pickers.planets)

