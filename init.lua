local vimrc = vim.fn.stdpath("config") .. "/oldconf.vim"
vim.cmd.source(vimrc)

local map = vim.keymap.set

-- keymap for source init.lua
map('n', '<leader>sv', ":source $MYVIMRC<cr>", {silent = true})

-----------------------------------------------------------------------------
-- nvim-tree configs 
-----------------------------------------------------------------------------
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 60,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false
      }
    }
  }
})
map('n', '<C-y>', ":NvimTreeToggle<cr>", {silent = true})
map('n', '<leader>tt', ":NvimTreeFindFile<cr>", {silent = true})

-----------------------------------------------------------------------------
-- telescope configs 
-----------------------------------------------------------------------------
local telescope = require('telescope.builtin')
map('n', '<M-p>', ":Telescope find_files<cr>", {silent = true})
map('n', '<leader>fg', ":Telescope live_grep<cr>", {silent = true})
map('n', '<leader>fb', ":Telescope buffers<cr>", {silent = true})
map('n', '<leader>fh', ":Telescope help_tags<cr>", {silent = true})

-----------------------------------------------------------------------------
-- github copilot settings
-----------------------------------------------------------------------------
require("copilot").setup({
  panel = {
    auto_refresh = true,
  },
  suggestion = {
    auto_trigger = true,
  },
})
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  show_help = "yes",
  prompts = {
    Review = "Review the following code and provide concise suggestions.",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
  build = function()
    vim.notify("Please update the remote plugins by running".. 
      " ':UpdateRemotePlugins', then restart Neovim.")
  end,
  window = {
    layout = 'float',
    relative = 'cursor',
    width = 1,
    height = 0.4,
    row = 1
  },
  event = "VeryLazy",
}
map('n', '<leader>cce', "<cmd>CopilotChatExplain<cr>", {silent = true})
map('n', '<leader>cct', "<cmd>CopilotChatTests<cr>", {silent = true})
map('n', '<leader>ccx', ":CopilotChatFix<cr>", {silent = true})
map('n', '<leader>ccb', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, {silent = true})
