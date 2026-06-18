-- Config adapted from Kien Nguyen-Tuan's neovim config:
-- https://github.com/ntk148v/neovim-config
return { -- Telescope
  -- Find, Filter, Preview, Pick. All lua, all the time.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    } },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
      {
        "<leader>fG",
        function()
          require("telescope.builtin").live_grep({
            glob_pattern = { "!**/spec/**", "!**/test/**", "!**/seeds/**", "!**/docs/**" }
          })
        end,
        desc = "Telescope live grep (exclude tests/docs)"
      },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
      { "<leader>fs", function() require("telescope.builtin").grep_string() end, desc = "Telescope grep string" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
    end
  } }
