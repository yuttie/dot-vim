return {
  {
    'kana/vim-operator-replace',
    dependencies = {
      'kana/vim-operator-user',
    },
  },
  {
    'rhysd/vim-textobj-anyblock',
    dependencies = {
      'kana/vim-textobj-user',
    },
    keys = {
      '<Plug>(textobj-anyblock-a)',
    },
  },
  {
    'simnalamburt/vim-mundo',
    cmd = {
      'MundoToggle',
    },
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    config = function()
      -- Commenting
      require('Comment').setup({
          ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
          ---@type table
          mappings = {
              ---Operator-pending mapping
              ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
              ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
              basic = false,
              ---Extra mapping
              ---Includes `gco`, `gcO`, `gcA`
              extra = false,
              ---Extended mapping
              ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
              extended = false,
          },

          ---@param ctx Ctx
          pre_hook = function(ctx)
              -- Only calculate commentstring for tsx filetypes
              if vim.bo.filetype == 'typescriptreact' then
                  local U = require('Comment.utils')

                  -- Detemine whether to use linewise or blockwise commentstring
                  local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

                  -- Determine the location where to calculate commentstring from
                  local location = nil
                  if ctx.ctype == U.ctype.block then
                      location = require('ts_context_commentstring.utils').get_cursor_location()
                  elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                      location = require('ts_context_commentstring.utils').get_visual_start_location()
                  end

                  return require('ts_context_commentstring.internal').calculate_commentstring({
                      key = type,
                      location = location,
                  })
              end
          end,
      })
    end,
  },
  'chrisbra/NrrwRgn',
  {
    'hoschi/yode-nvim',
    cmd = {
      'YodeCreateSeditorReplace',
    },
    config = function()
      require('yode-nvim').setup({})
    end,
  },
  {
    'folke/zen-mode.nvim',
    cmd = {
      'ZenMode',
    },
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          -- height and width can be:
          -- * an absolute number of cells when > 1
          -- * a percentage of the width / height of the editor when <= 1
          -- * a function that returns the width or the height
          width = 120, -- width of the Zen window
          height = 1, -- height of the Zen window
          -- by default, no options are changed for the Zen window
          -- uncomment any of the options below, or add other vim.wo options you want to apply
          options = {
            -- signcolumn = "no", -- disable signcolumn
            -- number = false, -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          },
        },
        plugins = {
          -- disable some global vim options (vim.o...)
          -- comment the lines to not apply the options
          options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
          },
          twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false }, -- disables the tmux statusline
          -- this will change the font size on kitty when in zen mode
          -- to make this work, you need to set the following kitty options:
          -- - allow_remote_control socket-only
          -- - listen_on unix:/tmp/kitty
          kitty = {
            enabled = false,
            font = "+4", -- font size increment
          },
        },
        -- callback where you can add custom code when the Zen window opens
        on_open = function(win)
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
        end,
      }
    end,
  },
  {
    'rhysd/vim-operator-surround',
    dependencies = {
      'kana/vim-operator-user',
    },
    keys = {
      '<Plug>(operator-surround-append)',
      '<Plug>(operator-surround-delete)',
      '<Plug>(operator-surround-replace)',
    },
  },
  {
    'terryma/vim-expand-region',
    keys = {
      '<Plug>(expand_region_expand)',
      '<Plug>(expand_region_shrink)',
    },
  },
}
