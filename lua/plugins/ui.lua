return {
    {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        opts = {},
        lazy = false,
        keys = {
            { mode = "n", "<space>ss", function() require("dropbar.api").pick() end, desc = "Pick symbols in winbar" },
        },
    },
    "norcalli/nvim-colorizer.lua",
    "ntpeters/vim-better-whitespace",
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
            vim.opt.list = true
            -- Enabling the following line break alignments and make neovim left garbage on screen
            -- vim.opt.listchars:append({ eol = '﬋' })  -- Alternatives: '⏎'
            vim.opt.listchars:remove("nbsp")
            vim.opt.listchars:remove("trail")

            require("ibl").setup({
                debounce = 200,
                indent = {
                    char = "┆",
                    smart_indent_cap = true,
                },
                scope = {
                    enabled = ture,
                    char = "│",
                    show_start = true,
                    show_end = true,
                    highlight = "Function",
                    include = {},
                    exclude = {},
                },
            })
        end,
    },
    {
        "yuttie/comfortable-motion.vim",
        keys = {
            { "<C-d>", ":call comfortable_motion#flick(50)<CR>", "n", silent = true },
            { "<C-u>", ":call comfortable_motion#flick(-50)<CR>", "n", silent = true },

            { "<C-f>", ":call comfortable_motion#flick(100)<CR>", "n", silent = true },
            { "<C-b>", ":call comfortable_motion#flick(-100)<CR>", "n", silent = true },
            { "<PageDown>", ":call comfortable_motion#flick(100)<CR>", "n", silent = true },
            { "<PageUp>", ":call comfortable_motion#flick(-100)<CR>", "n", silent = true },

            { "<ScrollWheelDown>", ":call comfortable_motion#flick(10)<CR>", "", silent = true },
            { "<ScrollWheelUp>", ":call comfortable_motion#flick(-10)<CR>", "", silent = true },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            delay = 300,
            spec = {
                {
                    { "<Space>?", group = "help" },
                    { "<Space>?:", "<cmd>Telescope commands<CR>", desc = "Commands" },
                    { "<Space>??", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
                    { "<Space>?I", "<cmd>Inspect!<CR>", desc = "Inspect!" },
                    { "<Space>?c", "<cmd>Telescope colorscheme<CR>", desc = "Colorschemes" },
                    { "<Space>?i", "<cmd>Inspect<CR>", desc = "Inspect" },
                    { "<Space>?k", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
                    {
                        "<Space>?<Space>",
                        function()
                            require("which-key").show({ global = false })
                        end,
                        desc = "Buffer Local Keymaps (which-key)",
                    },
                    { "<Space>G", group = "grammarous" },
                    { "<Space>GG", ":GrammarousCheck<CR>", desc = "Grammarous check" },
                    { "<Space>Gn", "<Plug>(grammarous-move-to-next-error)", desc = "Next error" },
                    { "<Space>Gp", "<Plug>(grammarous-move-to-previous-error)", desc = "Previous error" },
                    { "<Space>P", group = "plugin" },
                    {
                        "<Space>PP",
                        function()
                            require("lazy").sync()
                        end,
                        desc = "Update",
                    },
                    {
                        "<Space>Pc",
                        function()
                            require("lazy").clean()
                        end,
                        desc = "Clean",
                    },
                    {
                        "<Space>Pi",
                        function()
                            require("lazy").install()
                        end,
                        desc = "Install",
                    },
                    { "<Space>b", group = "buffer" },
                    { "<Space>bb", "<cmd>Telescope buffers<CR>", desc = "[Telescope] Buffers" },
                    {
                        "<Space>bd",
                        function()
                            Snacks.bufdelete.delete()
                        end,
                        desc = "Delete",
                    },
                    { "<Space>bn", ":bn<CR>", desc = "Next" },
                    { "<Space>bp", ":bp<CR>", desc = "Previous" },
                    { "<Space>c", group = "comment" },
                    {
                        "<Space>c",
                        require("Comment.api").call("toggle.linewise", "g@"),
                        desc = "Comment out/in line-wise",
                        expr = true,
                        replace_keycodes = false,
                    },
                    {
                        "<Space>cc",
                        require("Comment.api").call("toggle.linewise.current", "g@$"),
                        desc = "Comment out/in current line",
                        expr = true,
                        replace_keycodes = false,
                    },
                    { "<Space>d", group = "diagnostic" },
                    {
                        "<Space>dd",
                        "<cmd>lua vim.diagnostic.open_float()<CR>",
                        desc = "Show diagnostics in floating window",
                    },
                    { "<Space>dl", "<cmd>Telescope diagnostics<CR>", desc = "[Telescope] Show diagnostics" },
                    {
                        "<Space>dn",
                        "<cmd>lua vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.ERROR }, wrap = false })<CR>",
                        desc = "Next",
                    },
                    {
                        "<Space>dp",
                        "<cmd>lua vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.ERROR }, wrap = false })<CR>",
                        desc = "Previous",
                    },
                    { "<Space>f", group = "file" },
                    { "<Space>fF", "<cmd>Telescope find_files cwd=~/<CR>", desc = "[Telescope] Files" },
                    {
                        "<Space>fR",
                        function()
                            Snacks.rename.rename_file()
                        end,
                        desc = "Rename current file",
                    },
                    { "<Space>fS", ":wa<CR>", desc = "Save all" },
                    { "<Space>ff", "<cmd>Telescope find_files no_ignore=true<CR>", desc = "[Telescope] Files" },
                    { "<Space>fp", "1<C-g>", desc = "Print current file name with full path" },
                    { "<Space>fr", "<cmd>Telescope oldfiles<CR>", desc = "[Telescope] Recently opened files" },
                    { "<Space>fs", ":w<CR>", desc = "Save" },
                    { "<Space>ft", ":NvimTreeToggle<CR>", desc = "Toggle tree view" },
                    { "<Space>fv", group = "vim" },
                    { "<Space>fvR", ":source $MYVIMRC<CR>", desc = "Reload $MYVIMRC" },
                    { "<Space>fvi", ":tab vsplit $MYVIMRC | lcd %:h<CR>", desc = "Open $MYVIMRC" },
                    { "<Space>g", group = "git" },
                    { "<Space>g<C-g>", "g<C-g>", desc = "Count words" },
                    {
                        "<Space>g<C-n>",
                        "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
                        desc = "Next hunk",
                        expr = true,
                        replace_keycodes = false,
                    },
                    {
                        "<Space>g<C-p>",
                        "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
                        desc = "Previous hunk",
                        expr = true,
                        replace_keycodes = false,
                    },
                    { "<Space>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
                    { "<Space>gS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
                    { "<Space>gU", "<cmd>Gitsigns reset_buffer_index<CR>", desc = "Reset buffer (index)" },
                    { "<Space>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', desc = "Blame line" },
                    { "<Space>gc", ':Gina commit -v --opener="topleft vsplit"<CR>', desc = "Commit" },
                    { "<Space>gd", ":Gvdiffsplit<CR>", desc = "Diff" },
                    { "<Space>gf", "<cmd>Telescope git_files<CR>", desc = "[Telescope] Git files" },
                    { "<Space>gm", ":Magit<CR>", desc = "Magit" },
                    { "<Space>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
                    { "<Space>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
                    { "<Space>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
                    { "<Space>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo staged hunk" },
                    { "<Space>h", group = "highlight" },
                    { "<Space>h/", ':<C-U><C-R>=highlighter#Find("/")<CR>', desc = "HiFind" },
                    { "<Space>hH", ':<C-U>if highlighter#Command("+%") | noh | endif<CR>', desc = "HiSetSL" },
                    { "<Space>hc", ':<C-U>if highlighter#Command("clear") | noh | endif<CR>', desc = "HiClear" },
                    { "<Space>hd", ':<C-U>if highlighter#Command("-") | noh | endif<CR>', desc = "HiErase" },
                    { "<Space>hh", ':<C-U>if highlighter#Command("+") | noh | endif<CR>', desc = "HiSet" },
                    { "<Space>l", group = "lsp" },
                    { "<Space>la", vim.lsp.buf.code_action, desc = "Code action" },
                    { "<Space>lr", vim.lsp.buf.rename, desc = "Rename" },
                    { "<Space>m", group = "markdown" },
                    { "<Space>mp", ":MarkdownPreview<CR>", desc = "Preview" },
                    { "<Space>n", group = "notification & noice" },
                    {
                        "<Space>nh",
                        function()
                            require("noice").cmd("history")
                        end,
                        desc = "Show history",
                    },
                    {
                        "<Space>nl",
                        function()
                            require("noice").cmd("last")
                        end,
                        desc = "Show last",
                    },
                    {
                        "<Space>nd",
                        function()
                            require("noice").cmd("dismiss")
                        end,
                        desc = "Dismiss all",
                    },
                    {
                        "<Space>nd",
                        function()
                            require("noice").cmd("errors")
                        end,
                        desc = "Show errors",
                    },
                    { "<Space>q", group = "quit" },
                    { "<Space>qq", ":confirm qall<CR>", desc = "Quit Neovim" },
                    { "<Space>s", group = "search" },
                    { "<Space>s/", "<cmd>Telescope search_history<CR>", desc = "[Telescope] Search history" },
                    {
                        "<Space>sb",
                        "<cmd>Telescope current_buffer_fuzzy_find<CR>",
                        desc = "[Telescope] Current buffer lines",
                    },
                    { "<Space>sg", "<cmd>Telescope live_grep<CR>", desc = "[Telescope] Live grep" },
                    {
                        "<Space>st",
                        function()
                            require("telescope.builtin").lsp_document_symbols({
                                symbols = { "Class", "Enum", "Interface", "Struct" },
                            })
                        end,
                        desc = "[Telescope] LSP document type-like symbols",
                    },
                    {
                        "<Space>sT",
                        function()
                            require("telescope.builtin").lsp_workspace_symbols({
                                symbols = { "Class", "Enum", "Interface", "Struct" },
                            })
                        end,
                        desc = "[Telescope] LSP workspace type-like symbols",
                    },
                    {
                        "<Space>sf",
                        function()
                            require("telescope.builtin").lsp_document_symbols({
                                symbols = { "Function", "Method", "Constructor" },
                            })
                        end,
                        desc = "[Telescope] LSP document function-like symbols",
                    },
                    {
                        "<Space>sF",
                        function()
                            require("telescope.builtin").lsp_workspace_symbols({
                                symbols = { "Function", "Method", "Constructor" },
                            })
                        end,
                        desc = "[Telescope] LSP workspace function-like symbols",
                    },
                    { "<Space>t", group = "toggle" },
                    { "<Space>t<Space>", ":setl list! | setl list?<CR>", desc = "Visibility of whitespaces" },
                    { "<Space>tc", "<cmd>TSContext toggle<CR>", desc = "TreeSitter context" },
                    {
                        "<Space>td",
                        function()
                            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                        end,
                        desc = "Diagnostics",
                    },
                    { "<Space>tD", require("lsp_lines").toggle, desc = "lsp_lines" },
                    {
                        "<Space>th",
                        function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end,
                        desc = "Inlay hint (LSP)",
                    },
                    { "<Space>ti", ":IndentBlanklineToggle<CR>", desc = "Indent line" },
                    { "<Space>tn", ":setl number! | setl number?<CR>", desc = "Line number" },
                    { "<Space>tr", ":TSBufToggle rainbow<CR>", desc = "Rainbow" },
                    { "<Space>ts", ":setl spell! | setl spell?<CR>", desc = "Spell check" },
                    { "<Space>tt", ":setl expandtab! | setl expandtab?<CR>", desc = "Expand tab" },
                    { "<Space>tw", ":setl wrap! | setl wrap?<CR>", desc = "Line wrap" },
                    { "<Space>tz", ":ZenMode<CR>", desc = "Zen mode" },
                },
                {
                    {
                        "<C-g><C-n>",
                        "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
                        desc = "Next hunk",
                        expr = true,
                        replace_keycodes = false,
                    },
                    {
                        "<C-g><C-p>",
                        "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
                        desc = "Previous hunk",
                        expr = true,
                        replace_keycodes = false,
                    },
                    { "<C-g>R", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
                    { "<C-g>S", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
                    { "<C-g>U", "<cmd>Gitsigns reset_buffer_index<CR>", desc = "Reset buffer (index)" },
                    { "<C-g>b", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', desc = "Blame line" },
                    { "<C-g>c", ':Gina commit -v --opener="topleft vsplit"<CR>', desc = "Commit" },
                    { "<C-g>d", ":Gvdiffsplit<CR>", desc = "Diff" },
                    { "<C-g>f", "<cmd>Telescope git_files<CR>", desc = "[Telescope] Git files" },
                    { "<C-g>m", ":Magit<CR>", desc = "Magit" },
                    { "<C-g>p", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
                    { "<C-g>r", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
                    { "<C-g>s", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
                    { "<C-g>u", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo staged hunk" },
                },
                {
                    mode = { "x" },
                    {
                        "<Space>S",
                        "<cmd>split<CR><ESC><C-w>jgv:YodeCreateSeditorReplace<CR>",
                        desc = "Focus on selection (horizontal split, below)",
                    },
                    {
                        "<Space>V",
                        "<cmd>vsplit<CR><ESC><C-w>lgv:YodeCreateSeditorReplace<CR>",
                        desc = "Focus on selection (vertical split, right)",
                    },
                    {
                        "<Space>c",
                        '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
                        desc = "Comment out/in line-wise",
                    },
                    { "<Space>g", group = "git" },
                    { "<Space>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
                    { "<Space>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
                    { "<Space>h", group = "highlight" },
                    { "<Space>h/", ':<C-U><C-R>=highlighter#Find("/x")<CR>', desc = "HiFind" },
                    { "<Space>hH", ':<C-U>if highlighter#Command("+x%") | noh | endif<CR>', desc = "HiSetSL" },
                    { "<Space>hd", ':<C-U>if highlighter#Command("-x") | noh | endif<CR>', desc = "HiErase" },
                    { "<Space>hh", ':<C-U>if highlighter#Command("+x") | noh | endif<CR>', desc = "HiSet" },
                    {
                        "<Space>s",
                        "<cmd>split<CR>:YodeCreateSeditorReplace<CR>",
                        desc = "Focus on selection (horizontal split, above)",
                    },
                    {
                        "<Space>v",
                        "<cmd>vsplit<CR>:YodeCreateSeditorReplace<CR>",
                        desc = "Focus on selection (vertical split, left)",
                    },
                },
            },
        },
    },
    -- {
    --   'mrded/nvim-lsp-notify',
    --   dependencies = {
    --     'rcarriga/nvim-notify',
    --   },
    --   config = true,
    -- },
    -- {
    --   'rcarriga/nvim-notify',
    --   config = function()
    --     local notify = require('notify')
    --     vim.notify = notify
    --     notify.setup({
    --       render = 'default',
    --       stages = 'fade_in_slide_out',
    --       timeout = 3000,
    --       on_open = function(win)
    --         -- https://www.reddit.com/r/neovim/comments/1e3smnu/how_to_stop_nvimnoice_nvimnotify_really_from/
    --         -- https://github.com/gennaro-tedesco/dotfiles/blob/f109c209959b1fba470917e3b9b8599ea0b141f1/nvim/lua/plugins/notify.lua#L21-L23
    --         vim.api.nvim_win_set_config(win, { focusable = false })
    --       end,
    --     })
    --   end,
    -- },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            messages = {
                enabled = true, -- enables the Noice messages UI
                view = "mini", -- default view for messages
                view_error = "mini", -- view for errors
                view_warn = "mini", -- view for warnings
                view_history = "messages", -- view for :messages
                view_search = false, -- view for search count messages. Set to `false` to disable
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = true,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            views = {
                mini = {
                    timeout = 3000,
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            "folke/snacks.nvim",
            -- 'rcarriga/nvim-notify',
        },
    },
    {
        "sindrets/winshift.nvim",
        config = function()
            require("winshift").setup({})
        end,
        keys = {
            -- Start Win-Move mode:
            { "<C-W><C-M>", "<Cmd>WinShift<CR>", desc = "WinShift" },
            { "<C-W>m", "<Cmd>WinShift<CR>", desc = "WinShift" },
            -- Swap two windows:
            { "<C-W>X", "<Cmd>WinShift swap<CR>", desc = "WinShift swap" },
            -- If you don't want to use Win-Move mode you can create mappings for calling the
            -- move commands directly:
            { "<C-M-H>", "<Cmd>WinShift left<CR>", desc = "WinShift left" },
            { "<C-M-J>", "<Cmd>WinShift down<CR>", desc = "WinShift down" },
            { "<C-M-K>", "<Cmd>WinShift up<CR>", desc = "WinShift up" },
            { "<C-M-L>", "<Cmd>WinShift right<CR>", desc = "WinShift right" },
        },
    },
    -- {
    --   'kevinhwang91/nvim-hlslens',
    --   config = function()
    --     require('hlslens').setup()
    --
    --     local kopts = {noremap = true, silent = true}
    --
    --     vim.api.nvim_set_keymap('n', 'n',
    --       [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    --       kopts)
    --     vim.api.nvim_set_keymap('n', 'N',
    --       [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    --       kopts)
    --     vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --     vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --     vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --     vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --
    --     vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    --   end,
    -- },
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "lewis6991/gitsigns.nvim",
        },
        event = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        config = function()
            require("scrollbar").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/noice.nvim",
        },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                        },
                    },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {},
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
    "akinsho/bufferline.nvim",
    {
        "nvim-mini/mini.icons",
        version = false,
        opts = {},
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
}
