return function()
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig/configs')

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

  -- Setup the LSP
  lspconfig.golangci_lint_ls.setup {
    filetypes = {'go','gomod'},
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
end 