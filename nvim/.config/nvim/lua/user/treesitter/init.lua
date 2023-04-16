require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c_sharp",
		"css",
		"diff",
		"dockerfile",
		"fish",
		"gitcommit",
		"gitignore",
		"graphql",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"rust",
		"scss",
		"sql",
		"terraform",
		"toml",
		"tsx",
		"typescript",
		"vue",
		"yaml",
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css", "yaml" } },
})
