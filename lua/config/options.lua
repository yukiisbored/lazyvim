-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.pumblend = 0

if vim.fn.has("win32") then
  opt.shell = "powershell"
  opt.shellcmdflag = "-command"
  opt.shellquote = '\\"'
  opt.shellxquote = ""
end
