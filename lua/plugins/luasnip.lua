return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  config = {
    require("config/snips"),
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
