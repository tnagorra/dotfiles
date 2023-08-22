local lspconfig = require('lspconfig')
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set
local lsp = vim.lsp
local inspect = vim.inspect
local bo = vim.bo
local diagnostic = vim.diagnostic

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.graphql.setup {}
lspconfig.bashls.setup {}
-- lspconfig.cssmodules_ls.setup {}
-- lspconfig.remark_ls.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.sqlls.setup {}
lspconfig.stylelint_lsp.setup {
    filetypes = {
        'css', 'less', 'scss', 'sugarss', 'wxss',
    },
}
lspconfig.yamlls.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '[d', diagnostic.goto_prev)
map('n', ']d', diagnostic.goto_next)
map('n', '<leader>ld', diagnostic.open_float)
map('n', '<leader>ll', diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
autocmd('LspAttach', {
    group = augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        map('n', 'gD', lsp.buf.declaration, opts)
        map('n', 'gd', lsp.buf.definition, opts)
        map('n', 'gt', lsp.buf.type_definition, opts)
        map('n', 'gi', lsp.buf.implementation, opts)
        map('n', 'gr', lsp.buf.references, opts)

        map('n', 'K', lsp.buf.hover, opts)
        map('n', '<C-k>', lsp.buf.signature_help, opts)

        map('n', '<space>wa', lsp.buf.add_workspace_folder, opts)
        map('n', '<space>wr', lsp.buf.remove_workspace_folder, opts)
        map('n', '<space>wl', function()
            print(inspect(lsp.buf.list_workspace_folders()))
        end, opts)

        map('n', '<leader>lr', lsp.buf.rename, opts)
        map({ 'n', 'v' }, '<leader>lc', lsp.buf.code_action, opts)
        map('n', '<leader>lf', function()
            lsp.buf.format { async = true }
        end, opts)
    end,
})
