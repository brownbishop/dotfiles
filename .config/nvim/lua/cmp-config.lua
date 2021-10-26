local cmp = require('cmp')

cmp.setup {
   completion = {
       completeopt = 'menu,menuone,noselect'
   },

   snippet = {
        expand = function(args)
            -- You must install `vim-vsnip` if you use the following as-is.
            vim.fn['vsnip#anonymous'](args.body)
        end
    },

    -- You must set mapping if you want.
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
           if cmp.visible() then
             cmp.select_next_item()
           else
             fallback()
           end
         end,
         ["<S-Tab>"] = function(fallback)
           if cmp.visible() then
             cmp.select_prev_item()
           else
             fallback()
           end
         end,
    },

-- You should specify your *installed* sources.
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' },
    }
}

