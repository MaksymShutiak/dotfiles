
local vue_language_server_path = vim.fn.expand('$HOME/.nvm/versions/node/v24.3.0/lib/node_modules/@vue/language-server')
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      preferences = {
        importModuleSpecifier = "non-relative",
        importModuleSpecifierEnding = "minimal",
      },
    },
    vue = {
      preferences = {
        importModuleSpecifier = "non-relative",
        importModuleSpecifierEnding = "minimal",
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifier = "non-relative",
        importModuleSpecifierEnding = "minimal",
      },
    },
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        }, 
        
      },
    },
  },
  
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

local vue_ls_config = {
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
      if #clients == 0 then
        vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }
          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
    end
  end,
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = 'saghen/blink.cmp',
    config = function()
      local autocmd = vim.api.nvim_create_autocmd
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities();
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- vim.lsp.config('ts_ls', {
      --   capabilities = capabilities,
      --   init_options = {
      --     plugins = {
      --       {
      --         name = '@vue/typescript-plugin',
      --         location = vim.fn.expand('$HOME/.nvm/versions/node/v24.3.0/lib/node_modules/@vue/typescript-plugin'),
      --         languages = {
      --           'vue'
      --         },
      --       },
      --     },
      --     preferences = {
      --       includeCompletionsForModuleExports = true,
      --       includeCompletionsForImportStatements = true,
      --       importModuleSpecifierPreference = "non-relative",
      --     },
      --   },
      --   filetypes = {
      --     'typescript',
      --     'javascript',
      --     'javascriptreact',
      --     'typescriptreact',
      --     'vue',
      --     'json',
      --   }
      -- })

      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('jsonls')
      -- vim.lsp.enable('ts_ls')
      vim.lsp.enable('eslint')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('emmet_language_server')
      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.config('vue_ls', vue_ls_config)
      vim.lsp.enable({'vtsls', 'vue_ls'})

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

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
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
