return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'saghen/blink.cmp',
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				}
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").lua_ls.setup({
				capabilites = capabilites
			})
			require("lspconfig").ts_ls.setup({
				capabilites = capabilites
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

					-- if client:supports_method('textDocument/completion') then
					--   vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
					-- end

					-- Auto-format ("lint") on save.
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".

					if client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})
		end
	}
}
