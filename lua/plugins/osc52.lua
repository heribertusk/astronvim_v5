return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      tmux_passthrough = true,
      silent = true,
      max_length = 0,
    })
    
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        require("osc52").copy_register('"')
      end,
      desc = "OSC52 yank handler"
    })
  end,
}