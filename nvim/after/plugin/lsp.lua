local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilitiesForEmmet = vim.lsp.protocol.make_client_capabilities()
capabilitiesForEmmet.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require'lspconfig'
local keymap = vim.keymap
local inspect = vim.inspect
local buffer = vim.lsp.buf

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local buf_options = { noremap=true, silent=true, buffer=bufnr }
  keymap.set('n', 'gD', buffer.declaration, buf_options)
  keymap.set('n', 'gd', buffer.definition, buf_options)
  keymap.set('n', 'K', buffer.hover, buf_options)
  keymap.set('n', 'gi', buffer.implementation, buf_options)
  keymap.set('n', '<C-k>', buffer.signature_help, buf_options)
  keymap.set('n', '<space>wa', buffer.add_workspace_folder, buf_options)
  keymap.set('n', '<space>wr', buffer.remove_workspace_folder, buf_options)
  keymap.set('n', '<space>wl', function()
    print(inspect(buffer.list_workspace_folders()))
  end, buf_options)
  keymap.set('n', '<space>D', buffer.type_definition, buf_options)
  keymap.set('n', '<space>rn', buffer.rename, buf_options)
  keymap.set('n', '<space>ca', buffer.code_action, buf_options)
  keymap.set('n', 'gr', buffer.references, buf_options)
  keymap.set('n', '<space>f', buffer.format, buf_options)
end

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      validate = false,
    }
  }
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup{
  capabilities = capabilities,
}

lspconfig.emmet_ls.setup({
    capabilities = capabilitiesForEmmet,
    filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact"},
    init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
        },
      },
    }
})

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    settings = {
      css = {
        validate = false,
      },
    },
    typescript = {
      tsdk = vim.fn.expand('$HOME/.nvm/versions/node/v20.5.1/lib/node_modules/typescript/lib')
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {}
