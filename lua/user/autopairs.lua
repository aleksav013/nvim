local nvim_autopairs_status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not nvim_autopairs_status then
	print("autopairs.lua: loading nvim-autopairs failed")
	return
end

local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	print("autopairs.lua: loading cmp_autopairs failed")
	return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("autopairs.lua: loading cmp failed")
	return
end


-- nvim-cmp
nvim_autopairs.setup {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
