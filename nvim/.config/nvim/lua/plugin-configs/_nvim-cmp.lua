local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<C-n>'] = function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
                cmp.complete()
            end
        end,
        ['<C-p>'] = function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
                cmp.complete()
            end
        end,
        ['<CR>']  = cmp.mapping.confirm({ select = true }), -- Accept selected OR first item
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),

    completion = {
        completeopt = 'menu,menuone,noinsert,popup,noselect',
        autocomplete = false,
    },
})
