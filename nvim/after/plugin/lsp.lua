local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilitiesForEmmet = vim.lsp.protocol.make_client_capabilities()
capabilitiesForEmmet.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

require'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      validate = false,
    }
  }
}

require'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}

require'lspconfig'.emmet_ls.setup({
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

require'lspconfig'.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.volar.setup {
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
      tsdk = vim.fn.expand('$HOME/.nvm/versions/node/v19.4.0/lib/node_modules/typescript/lib')
    },
  },
}

require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.lua_ls.setup {}
