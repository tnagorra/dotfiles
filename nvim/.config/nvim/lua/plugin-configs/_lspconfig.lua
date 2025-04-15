local lspconfig = require('lspconfig')
local mason_registry = require('mason-registry')

lspconfig.ruff.setup({
    init_options = {
        settings = {
            lint = {
                preview = true
            },
        }
    }
})
lspconfig.basedpyright.setup {
    settings = {
        basedpyright = {
            -- Disable pyright import organizer to use ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to use ruff's analysis
                ignore = { '*' },

                -- For typings
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
lspconfig.ts_ls.setup {
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'vue', 'javascriptreact', 'typescriptreact' },
}
lspconfig.cssmodules_ls.setup {
    init_options = {
        camelCase = true
    }
}
lspconfig.bashls.setup {}
-- lspconfig.denols.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.eslint.setup {}
lspconfig.gh_actions_ls.setup {}
lspconfig.graphql.setup {}
lspconfig.helm_ls.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.sqlls.setup {}
lspconfig.stylelint_lsp.setup {}
lspconfig.volar.setup {}
lspconfig.yamlls.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP: Create local key mappings',
    group = vim.api.nvim_create_augroup('UserLspMappings', {}),
    callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        -- Set mappings
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- # default behavior
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>lc', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lf', function() -- # default is gq
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = 'LSP: Disable hover capability from ruff',
    group = vim.api.nvim_create_augroup('UserLspRuffConfig', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil and client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP: Enable auto completion',
    group = vim.api.nvim_create_augroup('UserLspAutoCompletion', {}),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

-- Add single border around floating window
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return orig_open_floating_preview(contents, syntax, opts, ...)
end
