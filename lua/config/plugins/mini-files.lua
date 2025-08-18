return {
	{
		"echasnovski/mini.files",
		version = "*",
		lazy = true,
		config = function()
			require("mini.files").setup({ options = { use_as_default_explorer = false } })
		end,
	}
}
