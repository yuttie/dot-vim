return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-bibtex.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = {
      'Telescope',
    },
    config = function()
      require('telescope').setup{
        pickers = {
          buffers = {
            mappings = {
              i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-d>"] = "delete_buffer",
              },
            },
          },
        },
      }
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('bibtex')
    end,
  },
}
