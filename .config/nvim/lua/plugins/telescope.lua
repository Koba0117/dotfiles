return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          ["borderchars"] = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>b", builtin.buffers, {})
      vim.keymap.set("n", "<leader>h", builtin.help_tags, {})

      vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, {})
      vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
      vim.keymap.set("n", "gy", builtin.lsp_type_definitions, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
