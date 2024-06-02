return {
  'akinsho/bufferline.nvim',
  opts = {
    options = {
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },

    }
  }
}
