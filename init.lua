vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("codecompanion").setup {
  display = {
    action_palette = {
      provider = "telescope",
      opts = {
        show_default_actions = true,
        show_default_prompt_library = true,
      },
    },
  },
  adapters = {
    groq = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = "cmd: pass show groq_key",
        },
        name = "Groq",
        url = "https://api.groq.com/openai/v1/chat/completions",
        schema = {
          model = {
            default = "llama-3.3-70b-versatile",
            choices = {
              "llama-3.3-70b-versatile",
              "llama-3.2-90b-text-preview",
              "llama-3.2-11b-text-preview",
              "mixtral-8x7b-32768",
              "llama-3.1-70b-versatile",
            },
          },
        },
        max_tokens = {
          default = 4096,
        },
        temperature = {
          default = 1,
        },
        handlers = {
          form_messages = function(self, messages)
            for i, msg in ipairs(messages) do
              -- Remove 'id' and 'opts' properties from all messages
              msg.id = nil
              msg.opts = nil

              -- Ensure 'name' is a string if present, otherwise remove it
              if msg.name then
                msg.name = tostring(msg.name)
              else
                msg.name = nil
              end

              -- Ensure only supported properties are present
              local supported_props = { role = true, content = true, name = true }
              for prop in pairs(msg) do
                if not supported_props[prop] then
                  msg[prop] = nil
                end
              end
            end
            return { messages = messages }
          end,
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "groq",
    },
    inline = { adapter = "groq" },
    agent = { adapter = "groq" },
  },
}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- conform disable auto format
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- oil
require("oil").setup()
-- ssh remote
require("telescope").load_extension "remote-sshfs"

-- require('remote-sshfs').setup{
--   connections = {
--     ssh_configs = {
--       vim.fn.expand "$HOME" .. "/.ssh/config"
--     }
--   }
-- }
