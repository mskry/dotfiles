local status_ok, inlay_hints = pcall(require, "inlay-hints")
if not status_ok then
  return
  print("inlay-hints not found")
end

-- default config 
-- https://github.com/simrat39/inlay-hints.nvim/blob/main/lua/inlay-hints/config.lua
inlay_hints.setup {
  eol = {
    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" ➤ (%s)", hints)
      end,
    },
  },
}