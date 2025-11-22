return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "andymass/vim-matchup",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- One of "all", "maintained" (parsers with maintainers), or a list of languages
                ensure_installed = "all",

                -- Install languages synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- List of parsers to ignore installing
                ignore_install = {},

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- list of language that will be disabled
                    disable = {},

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "gr+",
                        node_decremental = "gr-",
                    },
                },

                indent = {
                    enable = true,
                    disable = {},
                },

                refactor = {
                    highlight_definitions = { enable = true },
                    highlight_current_scope = { enable = false },
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = "gR",
                        },
                    },
                    navigation = {
                        enable = true,
                        keymaps = {
                            goto_definition_lsp_fallback = "gnd",
                            list_definitions = "gnD",
                            list_definitions_toc = "gO",
                            goto_next_usage = "<a-*>",
                            goto_previous_usage = "<a-#>",
                        },
                    },
                },

                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["g>"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["g<"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    lsp_interop = {
                        enable = true,
                        border = "none",
                        peek_definition_code = {
                            ["<leader>df"] = "@function.outer",
                            ["<leader>dF"] = "@class.outer",
                        },
                    },
                },

                matchup = {
                    enable = true, -- mandatory, false will disable the whole extension
                    disable = {}, -- optional, list of language that will be disabled
                    -- [options]
                },

                autotag = {
                    enable = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/playground",
        cmd = {
            "TSPlaygroundToggle",
            "TSHighlightCapturesUnderCursor",
            "TSNodeUnderCursor",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        config = function()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 15,
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'

                -- [!] The options below are exposed but shouldn't require your attention,
                --     you can safely ignore them.

                zindex = 20, -- The Z-index of the context window
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
            })
        end,
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "andymass/vim-matchup",
        config = function()
            vim.g.matchup_delim_nomids = 1
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "mfussenegger/nvim-treehopper",
        keys = {
            { "m", ":<C-U>lua require('tsht').nodes()<CR>", mode = "o", silent = true },
            { "m", ":lua require('tsht').nodes()<CR>", mode = "v", silent = true },
        },
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require("ts_context_commentstring").setup({})
        end,
    },
}
