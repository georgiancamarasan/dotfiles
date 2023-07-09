local neodev_ok, neodev = pcall(require, "neodev")
if neodev_ok then
	neodev.setup()
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>sq", vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	nmap("<leader>km", require("telescope.builtin").keymaps, "[K]ey [M]aps")
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local omnisharp_on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = {
		full = vim.empty_dict(),
		legend = {
			tokenModifiers = { "static_symbol" },
			tokenTypes = {
				"comment",
				"excluded_code",
				"identifier",
				"keyword",
				"keyword_control",
				"number",
				"operator",
				"operator_overloaded",
				"preprocessor_keyword",
				"string",
				"whitespace",
				"text",
				"static_symbol",
				"preprocessor_text",
				"punctuation",
				"string_verbatim",
				"string_escape_character",
				"class_name",
				"delegate_name",
				"enum_name",
				"interface_name",
				"module_name",
				"struct_name",
				"type_parameter_name",
				"field_name",
				"enum_member_name",
				"constant_name",
				"local_name",
				"parameter_name",
				"method_name",
				"extension_method_name",
				"property_name",
				"event_name",
				"namespace_name",
				"label_name",
				"xml_doc_comment_attribute_name",
				"xml_doc_comment_attribute_quotes",
				"xml_doc_comment_attribute_value",
				"xml_doc_comment_cdata_section",
				"xml_doc_comment_comment",
				"xml_doc_comment_delimiter",
				"xml_doc_comment_entity_reference",
				"xml_doc_comment_name",
				"xml_doc_comment_processing_instruction",
				"xml_doc_comment_text",
				"xml_literal_attribute_name",
				"xml_literal_attribute_quotes",
				"xml_literal_attribute_value",
				"xml_literal_cdata_section",
				"xml_literal_comment",
				"xml_literal_delimiter",
				"xml_literal_embedded_expression",
				"xml_literal_entity_reference",
				"xml_literal_name",
				"xml_literal_processing_instruction",
				"xml_literal_text",
				"regex_comment",
				"regex_character_class",
				"regex_anchor",
				"regex_quantifier",
				"regex_grouping",
				"regex_alternation",
				"regex_text",
				"regex_self_escaped_character",
				"regex_other_escape",
			},
		},
		range = true,
	}
	on_attach(client, bufnr)
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	angularls = {},
	ansiblels = {},
	bashls = {},
	omnisharp = {
		cmd = {
			"dotnet",
			vim.fn.stdpath("data") .. "/lsp_servers/omnisharp/omnisharp/OmniSharp.dll",
			enable_editorconfig_support = true,
			enable_roslyn_analyzers = true,
			organize_imports_on_format = true,
			enable_import_completion = true,
		},
	},
	--[[ csharp_ls = {}, ]]
	cssls = {},
	cssmodules_ls = {},
	dockerls = {},
	eslint = {},
	graphql = {},
	html = {},
	jsonls = {},
	lua_ls = {},
	marksman = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "off",
				},
			},
		},
	},
	rust_analyzer = {},
	sqlls = {},
	taplo = {},
	terraformls = {},
	tsserver = {},
	yamlls = {},
}

--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
	["omnisharp"] = function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = omnisharp_on_attach,
			settings = servers[server_name],
		})
	end,
})

-- Turn on lsp status information
require("fidget").setup()

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        nvim_lua = "[Lua]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        buffer = "[Buffer]",
        luasnip = "[LuaSnip]",
        spell = "[Spell]"
      })
    }),
  },
  view = {
    entries = {
      name = "custom",
      selection_order = "near_cursor",
    }
  },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "spell" },
	},
})
