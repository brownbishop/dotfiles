local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
   completion = {
       completeopt = 'menu,menuone,noselect',
       keyword_length = 1
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
        ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
--        ["<Tab>"] = cmp.mapping(function(fallback)
--            if cmp.visible() then
--                cmp.select_next_item()
--            elseif vim.fn["vsnip#available"](1) == 1 then
--                feedkey("<Plug>(vsnip-expand-or-jump)", "")
--            elseif has_words_before() then
--                cmp.complete()
--            else
--                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--            end
--        end, { "i", "s" }),
--
--        ["<S-Tab>"] = cmp.mapping(function()
--            if cmp.visible() then
--                cmp.select_prev_item()
--            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--                feedkey("<Plug>(vsnip-jump-prev)", "")
--            end
--        end, { "i", "s" }),
    },

-- You should specify your *installed* sources.
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' },
    }
}

