local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = { "^./.git/", ".git", ".idea", },
  }
}

