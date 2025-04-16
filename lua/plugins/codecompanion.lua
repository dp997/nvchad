return {
  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    lazy = false,
    config = function()
      local default_model = "groq.meta-llama/llama-4-maverick-17b-128e-instruct"
      local available_models = {
        "groq.meta-llama/llama-4-maverick-17b-128e-instruct",
        "groq.meta-llama/llama-4-scout-17b-16e-instruct",
        "groq.qwen-qwq-32b",
        "google.models/gemini-2.5-pro-preview-03-25",
        "openai.gpt-4o-mini",
      }
      local current_model = default_model

      local function select_model()
        vim.ui.select(available_models, {
          prompt = "Select  Model:",
        }, function(choice)
          if choice then
            current_model = choice
            vim.notify("Selected model: " .. current_model)
          end
        end)
      end

      require("codecompanion").setup {
        strategies = {
          chat = {
            adapter = "openwebui",
          },
          inline = {
            adapter = "openwebui",
            keymaps = {
              accept_change = { modes = { n = "ga" }, description = "Accept change" },
              reject_change = { modes = { n = "gr" }, description = "Reject change" },
            },
          },
        },
        adapters = {
          openwebui = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://chat.dsrv.pl",
                api_key = "cmd: pass show openwebui_key",
                chat_url = "/api/chat/completions",
                models_endpoint = "/api/models",
              },
              schema = {
                model = {
                  default = current_model,
                },
              },
            })
          end,
        },
      }

      vim.keymap.set({ "n", "v" }, "<leader>ck", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
      vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>cs", select_model, { desc = "Select Gemini Model" })
      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd [[cab cc CodeCompanion]]
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
