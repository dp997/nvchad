-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "pyright",
  -- "golangci_lint_ls",
  "jsonls",
  "lua_ls",
  "dockerls",
  "docker_compose_language_service",
  "gopls",
  "svelte",
  "ts_ls",
  "nixd",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- if not configs.golangcilsp then
--   configs.golangcilsp = {
--     default_config = {
--       cmd = { "golangci-lint-langserver" },
--       root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
--       init_options = {
--         command = { "golangci-lint", "run", "--enable-all", "--out-format", "json" },
--       },
--     },
--   }
-- end
-- lspconfig.golangcilsp.setup {
--   filetypes = { "go" },
-- }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = nvlsp.filetypes,
  }
end

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}

lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "json", "jsonc", "jsonl" },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
