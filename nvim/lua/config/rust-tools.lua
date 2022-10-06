local status_ok, ih = pcall(require, "inlay-hints")
if not status_ok then
  return
  print("inlay-hints not found")
end

local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
  return
  print("rust-tools not found")
end

rt.setup {
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = function(_, bufnr)
      -- Inlay hints
      ih.on_attach(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
