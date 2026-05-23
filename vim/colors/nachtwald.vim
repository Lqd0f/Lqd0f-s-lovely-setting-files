highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="nachtwald"
set background=dark

let s:pllt = {
	 \'mont':"#F0F6FC",
	 \'wolk':"#9CD0D6",
	 \'shtn':"#727272",
	 \'hmel':"#2A5A7E",
	 \'blat':"#06180C",
	 \'lcht':"#548A60",
	 \'line':"#182A1E",
	 \'visu':"#546072",
\}

function! s:hili(gpNm, foGr, baGr, attr)
	let l:cmd = "hi " . a:gpNm
	if a:foGr != "" | let l:cmd .= " guifg=" . a:foGr | endif
	if a:baGr != "" | let l:cmd .= " guibg=" . a:baGr | endif
	if a:attr != "" | let l:cmd .= " cterm=" . a:attr | endif
	execute l:cmd
endfunction

call s:hili("Normal",       s:pllt.lcht, s:pllt.blat, "none")
call s:hili("CursorLine",   "", s:pllt.line,          "none")
call s:hili("Comment",      s:pllt.shtn, "",          "none")
call s:hili("Statement",    s:pllt.lcht, "",          "none")
call s:hili("LspStatement",    s:pllt.lcht, "",          "none")
call s:hili("Number",       s:pllt.hmel, "",          "none")
call s:hili("Visual",       s:pllt.wolk, s:pllt.visu, "none")
call s:hili("StatusLine",   s:pllt.blat, s:pllt.lcht, "none")
call s:hili("LineNr",       s:pllt.mont, "",          "none")
call s:hili("CursorLineNr", s:pllt.mont, "",          "none")
call s:hili("Type",         s:pllt.hmel, "",          "none")
call s:hili("LspType",         s:pllt.hmel, "",          "none")
call s:hili("Identifier",   s:pllt.wolk, "",          "none")
call s:hili("Function",     s:pllt.wolk, "",          "none")
call s:hili("LspFunction",     s:pllt.wolk, "",          "none")
call s:hili("String",       s:pllt.hmel, "",          "none")
call s:hili("Variable",     s:pllt.wolk, "",          "none")
call s:hili("LspVariable",     s:pllt.wolk, "",          "none")
call s:hili("Constant",     s:pllt.lcht, "",          "none")
call s:hili("LspConstant",     s:pllt.lcht, "",          "none")
call s:hili("Special",      s:pllt.mont, "",          "none")
call s:hili("PreProc",      s:pllt.hmel, "",          "none")
call s:hili("Property",     s:pllt.hmel, "",          "none")
call s:hili("LspProperty",     s:pllt.hmel, "",          "none")
call s:hili("MatchParen",   s:pllt.blat, s:pllt.shtn, "none")
call s:hili("Operator",     s:pllt.mont, "",          "none")
call s:hili("LspBracket",   s:pllt.mont, "",          "none")

delfunction s:hili
