return function()
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig/configs')
  local cmp_nvim_lsp = require('cmp_nvim_lsp')

  -- Configure golangci-lint-langserver
  if not configs.golangcilsp then
    configs.golangcilsp = {
      default_config = {
        cmd = {'golangci-lint-langserver'},
        root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
        init_options = {
          command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" };
        };
      }
    }
  end

  -- Setup the LSP with proper capabilities
  local capabilities = cmp_nvim_lsp.default_capabilities()
  -- Add position encoding for Neovim v0.11+
  -- Use the new approach for setting position encoding
  if vim.fn.has("nvim-0.11") == 1 then
    capabilities.textDocument = capabilities.textDocument or {}
    capabilities.textDocument.positionEncoding = "utf-16"
  end

  lspconfig.golangci_lint_ls.setup {
    filetypes = {'go','gomod'},
    capabilities = capabilities,
  }
end 