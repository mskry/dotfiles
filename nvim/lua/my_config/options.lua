--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.cmd('colorscheme nightfox')

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Treesitter folding 
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
