return {
  "saghen/blink.cmp",
  enabled = true,
  event = "VeryLazy",
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      -- https://github.com/Saghen/blink.cmp/blob/main/doc/configuration/keymap.md
      -- preset = "default",
      -- By setting the preset to none, conflicts with <C-k> digraphs can be prevented.
      preset = "none",

      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-y>"] = { "select_and_accept", "fallback" },

      -- disable a keymap from the preset
      ["<C-k>"] = {},
      ["<C-S-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
  },
}
