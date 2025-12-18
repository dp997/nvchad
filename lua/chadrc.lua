-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local noctalia_path = vim.fn.stdpath "config" .. "/lua/themes/noctalia.lua"

local test_theme = function()
  if vim.uv.fs_stat(noctalia_path) then
    return "flexoki"
  else
    return "wombat"
  end
end

M.base46 = {
  theme = test_theme(),
}

M.nvdash = { load_on_startup = false }
M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

return M
