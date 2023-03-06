return {
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "tokyonight" },
          help = { colorscheme = "tokyonight" },
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup {
        on_highlights = function(hl, c)
          -- make Telescope's prompt and border match the background
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
        on_colors = function(colors)
          -- match VSCode's comments colorscheme
          colors.comment = "#414e62"
        end,
        style = "storm",
        terminal_colors = true,
        styles = {
          comments = { italic = true },
        }
      }
      -- load plugin
      vim.cmd [[colorscheme tokyonight]]
    end,
  }
}
