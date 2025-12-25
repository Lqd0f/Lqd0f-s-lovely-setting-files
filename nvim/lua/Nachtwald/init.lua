local M = {}

local pllt = {
	mont = '#F0F6FC',
	wolk = '#9CD0D6',
	shtn = '#727272',
	hmel = '#2A5A7E',
	blat = '#06180C',
	lcht = '#548A60',

	line = '#182A1E',
	visu = '#546072',
}

function M.colorscheme()
	vim.cmd 'highlight clear'
	vim.cmd 'syntax reset'

	vim.o.background = 'dark'
	vim.g.colors_name = 'koala'

	local set = vim.api.nvim_set_hl
	
	set(0, 'Normal',               {fg = pllt.lcht, bg = pllt.blat})
	set(0, 'cursorLine',					 {bg = pllt.line})
	set(0, 'Comment',							 {fg = pllt.shtn, cterm = Italic})
	set(0, '@type',								 {fg = pllt.hmel})
	set(0, '@type.builtin',				 {fg = pllt.hmel})
	set(0, '@property',						 {fg = pllt.mont})
	set(0, '@function',						 {fg = pllt.wolk})
	set(0, '@function.macro',      {fg = pllt.hmel})
	set(0, '@operator',            {fg = pllt.lcht})
	set(0, 'Statement',            {fg = pllt.lcht})
	set(0, '@string',              {fg = pllt.hmel})
	set(0, '@string.escape',       {fg = pllt.hmel})
	set(0, '@string.special',      {fg = pllt.hmel})
	set(0, '@character.special',   {fg = pllt.hmel})
	set(0, '@variable',						 {fg = pllt.wolk})
	set(0, 'number',							 {fg = pllt.hmel})
	set(0, '@constant',						 {fg = pllt.lcht})
	set(0, '@constant.builtin',		 {fg = pllt.lcht})
	set(0, 'Visual',							 {fg = pllt.wolk, bg = pllt.visu})
	set(0, 'StatusLine',					 {fg = pllt.blat, bg = pllt.lcht})
	set(0, 'LineNr',							 {fg = pllt.mont})
	set(0, '@punctuation',				 {fg = pllt.mont})

end

return M
