-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "flexoki",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = {
    "black",
    "clangd",
    "cmake-language-server",
    "css-lsp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "golangci-lint-langserver",
    "gopls",
    "html-lsp",
    "json-lsp",
    "json-to-struct",
    "lua-language-server",
    "pylint",
    "pyright",
    "ruff",
    "stylua",
    "terraform-ls",
    "svelte-language-server",
    "typescript-language-server",
  },
}

return M
