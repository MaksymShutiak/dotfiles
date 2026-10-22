
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

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = 'saghen/blink.cmp',
    config = function()
      local autocmd = vim.api.nvim_create_autocmd
      local capabilities = require('blink.cmp').get_lsp_capabilities();
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('jsonls')
      -- vim.lsp.enable('ts_ls')
      vim.lsp.enable('eslint')
      if vim.fn.executable('lua-language-server') == 1 then
        vim.lsp.enable('lua_ls')
      end
      vim.lsp.enable('emmet_language_server')
      vim.lsp.config('vtsls', vtsls_config)
      -- Use the same root as vtsls (lockfile/.git) so workspace packages
      -- (e.g. packages/* symlinked into node_modules) don't spawn a second vue_ls
      vim.lsp.config('vue_ls', {
        root_markers = { 'package.json' },
      })
      vim.lsp.enable({'vtsls', 'vue_ls'})

      vim.diagnostic.config({
        virtual_text = true,
      })


      autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
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

        end,
      })

      -- vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-y>" : "\<Tab>"]], { expr = true, noremap = true })
    end
  }
}
