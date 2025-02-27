return {
  {
    	"neovim/nvim-lspconfig",
      dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        {
          "williamboman/mason-lspconfig.nvim",
          dependencies = {
            {"folke/neoconf.nvim", opts = {}},
            {"williamboman/mason.nvim", opts = {}},
          },
          config = function()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
              ensure_installed = { "ts_ls", "lua_ls", "eslint", "cssls", "volar", "emmet_language_server", "emmet_ls" },
            })
            require("mason-lspconfig").setup_handlers({
              function(server_name)
                local server_config = {}
                -- if server_name == "volar" then
                --   server_config.init_options = {
                --     vue = {
                --       hybridMode = false,
                --     },
                --   }
                --   server_config.settings = {
                --     typescript = {
                --       inlayHints = {
                --         enumMemberValues = {
                --           enabled = true,
                --         },
                --         functionLikeReturnTypes = {
                --           enabled = true,
                --         },
                --         propertyDeclarationTypes = {
                --           enabled = true,
                --         },
                --         parameterTypes = {
                --           enabled = true,
                --           suppressWhenArgumentMatchesName = true,
                --         },
                --         variableTypes = {
                --           enabled = true,
                --         },
                --       },
                --     },
                --   }
                -- end
                if server_name == "ts_ls" then
                  server_config.init_options = {
                    plugins = {
                      {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.expand('$HOME/.nvm/versions/node/v23.3.0/lib/node_modules/@vue/typescript-plugin'),
                        languages = { 'vue' },
                      },
                    },
                  }
                  -- server_config.settings = {
                  --   typescript = {
                  --     tsserver = {
                  --       useSyntaxServer = false,
                  --     },
                  --     inlayHints = {
                  --       includeInlayParameterNameHints = 'all',
                  --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  --       includeInlayFunctionParameterTypeHints = true,
                  --       includeInlayVariableTypeHints = true,
                  --       includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                  --       includeInlayPropertyDeclarationTypeHints = true,
                  --       includeInlayFunctionLikeReturnTypeHints = true,
                  --       includeInlayEnumMemberValueHints = true,
                  --     },
                  --   },
                  -- }

                  server_config.filetypes = {
                    'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue',
                  }
                end
                lspconfig[server_name].setup(server_config)
              end,
            })

            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
              group = vim.api.nvim_create_augroup("UserLspConfig", {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
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
                  vim.lsp.buf.format({ async = true })
                end, opts)
              end,
            })
          end,
        }
      }
    },
  }
