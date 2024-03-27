-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "J", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "K", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "<c-j>", vim.lsp.buf.hover, { desc = "Show hover" })

local git = require("gitsigns")
map("n", "<leader>hj", git.next_hunk, { desc = "Next Hunk" })
map("n", "<leader>hk", git.prev_hunk, { desc = "Previous Hunk" })

-- Neo tree on -
map("n", "-", ":Neotree position=current %:h<CR>", { desc = "Toggle NeoTree" })
