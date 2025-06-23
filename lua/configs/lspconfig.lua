require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "jsonls",
  "lua_ls",
  "dockerls",
  "docker_compose_language_service",
  "gopls",
  "svelte",
  "ts_ls",
  "ruff",
  "ltex",
  "rust_analyzer",
}
vim.lsp.enable(servers)

require("lspconfig").pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}
