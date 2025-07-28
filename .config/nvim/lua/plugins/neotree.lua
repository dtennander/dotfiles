return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      auto_open = false,
      update_focused_file = {
        enable = true,
      },
      filesystem = {
        group_empty_dirs = true,
        scan_mode = "deep",
        hijack_netrw_behavior = "open_current",
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
    },
  },
}
