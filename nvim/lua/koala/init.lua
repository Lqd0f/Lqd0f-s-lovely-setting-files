local M = {}

local pllt = {
	bagr = '#06240C',
	fogr = '#7EA884',
	nome = '#ACACAC',
	deep = '#1E8A72',
	wood = '#9C6036',
	crea = '#E4EAC0',
	melo = '#CCEAC0',
	olev = '#606C30',
	leaf = '#72C64E',
	emel = '#4EFC84',
	chlo = '#C0D278',
	line = '#12361E',
	bnna = '#FCFC06',
	clou = '#727272',
}

function M.colorscheme()
	vim.cmd 'highlight clear'
	vim.cmd 'syntax reset'

	vim.o.background = 'dark'
	vim.g.colors_name = 'koala'

	local set = vim.api.nvim_set_hl
	
	set(0, 'Normal', {fg = pllt.fogr, bg = pllt.bagr})
	set(0, 'CursorLine', {bg = pllt.line})
	set(0, 'LineNr', {fg = pllt.emel})
	set(0, 'StatusLine', {fg = pllt.emel, bg = pllt.olev})
	set(0, 'Visual', {fg = pllt.clou, bg = pllt.chlo})
	set(0, 'Comment', {fg = pllt.nome})
	set(0, 'userFunction', {fg = pllt.leaf})
--	set(0, 'Type', {fg = pllt.deep})
	set(0, 'Statement', {fg = pllt.wood})
	set(0, 'Operator', {fg = pllt.wood})
	set(0, 'String', {fg = pllt.crea})
	set(0, 'Number', {fg = pllt.chlo})
	set(0, 'PreProc', {fg = pllt.wood})
	set(0, 'Macro', {fg = pllt.olev})
	set(0, 'Constant', {fg = pllt.olev})
	set(0, 'Special', {fg = pllt.chlo})
	set(0, 'Identifier', {fg = pllt.leaf})
	set(0, 'Error', {fg = pllt.bagr, bg = pllt.bnna})
	set(0, '@function', {fg = pllt.wood})
	set(0, '@function.builtin', {fg = pllt.wood})
	set(0, '@variable', {fg = pllt.emel})
	set(0, '@type', {fg = pllt.deep})
end

return M
