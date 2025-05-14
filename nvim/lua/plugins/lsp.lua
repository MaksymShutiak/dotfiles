return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.expand('$HOME/.nvm/versions/node/v23.3.0/lib/node_modules/@vue/typescript-plugin'),
              languages = {
                'vue'
              },
            },
          },
        },
        filetypes = {
          'typescript',
          'javascript',
          'javascriptreact',
          'typescriptreact',
          'vue',
        }
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('eslint')
      vim.lsp.enable('volar')
      vim.lsp.enable('emmet_language_server')

      vim.diagnostic.config({
        virtual_lines = true,
      }) 
    end
  }
}
