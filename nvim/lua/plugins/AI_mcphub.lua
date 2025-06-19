return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "pnpm install -g mcp-hub@latest",
  config = function()
    require("mcphub").setup()
  end,
}
