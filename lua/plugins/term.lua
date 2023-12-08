local M = {}

M.terminals = {}

---@return fun()
function M.make_terminal(
  ---@type string
  key,
  ---@type fun(): Terminal
  builder
)
  return function()
    if M.terminals[key] == nil then
      M.terminals[key] = builder()
    end

    M.terminals[key]:toggle()
  end
end

M.root = M.make_terminal("root", function()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
    dir = require("lazyvim.util").root(),
  })
end)

M.cwd = M.make_terminal("cwd", function()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
    dir = vim.fn.getcwd(0),
  })
end)

M.root_git = M.make_terminal("root_git", function()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
    cmd = "lazygit",
    dir = require("lazyvim.util").root(),
    hidden = true,
    direction = "float",
    float_opts = {
      border = "double",
    },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    on_close = function(_)
      vim.cmd("startinsert!")
    end,
  })
end)

M.cwd_git = M.make_terminal("cwd_git", function()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
    cmd = "lazygit",
    dir = vim.fn.getcwd(0),
    hidden = true,
    direction = "float",
    float_opts = {
      border = "double",
    },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    on_close = function(_)
      vim.cmd("startinsert!")
    end,
  })
end)

M.plugin = {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-/>", "<Cmd>ToggleTerm<CR>", desc = "Terminal" },
      { "<leader>ft", M.root, desc = "Terminal (root dir)" },
      { "<leader>fT", M.cwd, desc = "Terminal (cwd)" },
      { "<leader>gg", M.root_git, desc = "Lazygit (root dir)" },
      { "<leader>gG", M.cwd_git, desc = "Lazygit (cwd)" },
    },
    opts = {
      open_mapping = nil,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
  },
}

return M.plugin
