if vim.fn.has("macunix") then
  return {}
end

return {
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/122
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "mkdir build && zig cc -O3 -Wall -Werror -fpic -std=gnu99 -shared src/fzf.c -o build/libfzf.dll",
  },
}
