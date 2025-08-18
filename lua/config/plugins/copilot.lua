return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false }, -- Disable inline suggestions
				panel = { enabled = false },  -- Disable Copilot panel
			})
		end,
	},
	{
		"fang2hou/blink-copilot",
		dependencies = { "zbirenbaum/copilot.lua" }, -- or "github/copilot.vim"
		opts = {
			max_completions = 3, -- Max number of Copilot completions
			max_attempts = 4, -- Max attempts to fetch completions
			kind_name = "Copilot", -- Completion type
			kind_icon = " ", -- Icon for Copilot completions
			kind_hl = false, -- Disable highlight group
			debounce = 200, -- Debounce time in ms
			auto_refresh = { backward = true, forward = true }, -- Refresh on cursor movement
		},
	}
}
