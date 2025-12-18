local servers = {
  "html",
  "cssls",
  "clangd",
  -- "basedpyright",
  "ty",
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
  "tinymist",
  "nil_ls",
  "nixfmt",
}

vim.lsp.config("pyright", {
  settings = {
    basedpyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
        typeCheckingMode = "basic",
      },
    },
  },
})

vim.lsp.config("tinymist", {
  settings = {
    exportPdf = "onType",
    outputPath = "$root/target/$dir/$name",
  },
})

-- vim.lsp.config("ty", {
--   settings = {
--     ty = {
--
--     }
--   }
-- })
vim.lsp.enable(servers)
