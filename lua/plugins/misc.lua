return {
    {
        "tyru/open-browser.vim",
        keys = {
            "<Plug>(openbrowser-smart-search)",
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = {
                animate = {
                    duration = { step = 12, total = 200 },
                    easing = "outCubic",
                },
            },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
}
