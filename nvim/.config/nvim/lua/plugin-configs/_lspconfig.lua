local lspconfig = require('lspconfig')
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set
local lsp = vim.lsp
local inspect = vim.inspect
local bo = vim.bo
local diagnostic = vim.diagnostic
local fn = vim.fn
local util = require('lspconfig/util')
local env = vim.env


local function get_python_path(workspace)
    -- Use activated virtualenv.
    if env.VIRTUAL_ENV then
        return util.path.join(env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv via poetry in workspace directory.
    local match = fn.glob(util.path.join(workspace, 'poetry.lock'))
    if match ~= '' then
        local venv = fn.trim(fn.system('poetry env info -p'))
        return util.path.join(venv, 'bin', 'python')
    end

    -- Fallback to system Python.
    return exepath('python3') or exepath('python') or 'python'
end

lspconfig.pyright.setup {
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end
}
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            configurationSources = {"flake8"},
            plugins = {
                flake8 = {
                    enabled = true,
                }
            }
        }
    }
}
lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
lspconfig.ts_ls.setup {
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  init_options = {
      plugins = {
          {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
          },
      },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
lspconfig.graphql.setup {}
lspconfig.bashls.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.cssmodules_ls.setup {
    init_options = {
        camelCase = true
    }
}
lspconfig.jsonls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.sqlls.setup {}
lspconfig.stylelint_lsp.setup {
    filetypes = {
        'css', 'less', 'scss', 'sugarss', 'wxss',
    },
}

lspconfig.yamlls.setup {}
lspconfig.volar.setup {}

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
