return {
    -- Gentoo
    "gentoo/gentoo-syntax", -- ftdetect, ftplugin, indent, plugin, syntax

    -- i3
    "PotatoesMaster/i3-vim-syntax", -- syntax, ftplugin

    -- jq
    "vito-c/jq.vim", -- ftdetect, ftplugin, syntax

    -- Text
    {
        "rhysd/vim-grammarous",
        cmd = {
            "GrammarousCheck",
        },
        keys = {
            "<Plug>(grammarous-move-to-next-error)",
            "<Plug>(grammarous-move-to-previous-error)",
        },
    },

    -- tmux
    "tmux-plugins/vim-tmux",

    -- Web/HTML
    {
        "mattn/emmet-vim",
        ft = { "html", "xml", "php" },
    },

    -- Markdown
    {
        "godlygeek/tabular",
        cmd = {
            "AddTabularPattern",
            "AddTabularPipeline",
            "Tabularize",
            "GTabularize",
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "pandoc.markdown", "rmd" },
        build = 'sh -c "cd app & yarn install"',
    },

    -- AsciiDoc
    {
        "mjakl/vim-asciidoc",
        ft = "asciidoc",
    },
}
