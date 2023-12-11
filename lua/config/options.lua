-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local os = require("os")

local opt = vim.opt

opt.pumblend = 0

if vim.fn.has("win32") then
  opt.shell = "powershell"
  opt.shellcmdflag = "-command"
  opt.shellquote = '\\"'
  opt.shellxquote = ""
end

if vim.fn.has("win32") then
  local userprofile_path = os.getenv("USERPROFILE")
  local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

  vim.api.nvim_create_autocmd(
    { "VimEnter" },
    { pattern = "*", command = "cd " .. userprofile_path, group = vim_enter_group }
  )
end
