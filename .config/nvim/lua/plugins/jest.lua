return {
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "yarn test",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
