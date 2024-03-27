return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        auto_open = false,
        update_focused_file = {
          enable = true,
        },
        filesystem = {
          filtered_items = {
            visible = true,
          },
        },
        window = {
          mappings = {
            ["o"] = "open",
            ["-"] = "navigate_up",
          },
        },
      })
    end,
  },
}
