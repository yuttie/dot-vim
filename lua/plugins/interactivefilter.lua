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
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
          buffers = {
            mappings = {
              i = {
                ['<C-d>'] = 'delete_buffer',
              },
            },
          },
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        }
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
