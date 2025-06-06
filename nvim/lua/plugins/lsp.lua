return {
  {
    "neovim/nvim-lspconfig",
    dependencies = 'saghen/blink.cmp',
    config = function()
      local autocmd = vim.api.nvim_create_autocmd
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities();
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
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
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierPreference = "non-relative",
          },
        },
        filetypes = {
          'typescript',
          'javascript',
          'javascriptreact',
          'typescriptreact',
          'vue',
          'json',
        }
      })

      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })
      vim.lsp.config('vue_ls', {
        capabilities = capabilities,
      })
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('jsonls')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('eslint')
      vim.lsp.enable('vue_ls')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('emmet_language_server')

      vim.diagnostic.config({
        virtual_text = true,
      })


      autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method('textDocument/completion') then
            -- local chars = {};
            -- for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end

          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format()
          end, opts)

          vim.keymap.set("i", "<c-space>", function()
            vim.lsp.completion.get()
          end)
        end,
      })

      -- vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-y>" : "\<Tab>"]], { expr = true, noremap = true })
    end
  }
}
