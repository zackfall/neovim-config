local telescope_status, telescope = pcall(require, 'telescope')
if not telescope_status then
  return
end

local actions = require('telescope.actions')
telescope.load_extension('media_files')
local icons = require('zackfall.icons')

telescope.setup {
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules/", "target/", "docs/", ".settings/", "media/", "spell/" },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    file_browser = {
      -- theme = "ivy",
      -- require("telescope.themes").get_dropdown {
      --   previewer = false,
      --   -- even more opts
      -- },
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        previewer = false,
        -- even more opts
      },
    },
  },
}

telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
telescope.load_extension('projects')
