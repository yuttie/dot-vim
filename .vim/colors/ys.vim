" Vim color file
" Maintainer: Yuta Taniguchi <yuta.taniguchi.y.t@gmail.com>
" Last Change: 2011-12-11

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "ys"


hi Normal			ctermfg=253		ctermbg=234						guifg=#e0e0e0	guibg=#202020						" from lucius.vim
hi Cursor			ctermfg=none	ctermbg=241		cterm=none		guifg=NONE		guibg=#656565	gui=none			" from wombat256.vim
hi CursorIM			ctermfg=bg		ctermbg=116						guifg=bg		guibg=#96cdcd						" from lucius.vim
hi CursorLine		ctermfg=NONE	ctermbg=236		cterm=none		guifg=NONE		guibg=#404448	gui=none			" from lucius.vim
hi CursorColumn		ctermfg=NONE	ctermbg=236		cterm=none		guifg=NONE		guibg=#404448	gui=none			" from lucius.vim
hi Visual			ctermfg=NONE	ctermbg=238		cterm=none		guifg=NONE		guibg=#444444	gui=none
hi VisualNOS		ctermfg=fg						cterm=underline	guifg=fg						gui=underline		" from lucius.vim

hi Folded			ctermfg=103		ctermbg=238		cterm=none		guifg=#a0a8b0	guibg=#384048	gui=none			" from wombat256.vim
hi FoldColumn		ctermfg=103		ctermbg=238		cterm=none		guifg=#a0a8b0	guibg=#384048	gui=none			" from wombat256.vim
hi Folded			ctermfg=117		ctermbg=235		cterm=none		guifg=#d0e0f0	guibg=#202020	gui=none			" from lucius.vim
hi FoldColumn		ctermfg=117		ctermbg=238		cterm=none		guifg=#c0c0d0	guibg=#363946	gui=none			" from lucius.vim
hi Title			ctermfg=7		ctermbg=none	cterm=bold		guifg=#f6f3e8	guibg=NONE		gui=bold			" from wombat256.vim
hi StatusLine		ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=none			" from wombat256.vim
hi VertSplit		ctermfg=238		ctermbg=238		cterm=none		guifg=#444444	guibg=#444444	gui=none			" from wombat256.vim
hi StatusLineNC		ctermfg=243		ctermbg=238		cterm=none		guifg=#857b6f	guibg=#444444	gui=none			" from wombat256.vim
hi LineNr			ctermfg=243		ctermbg=0		cterm=none		guifg=#857b6f	guibg=#000000	gui=none			" from wombat256.vim
hi SpecialKey		ctermfg=244		ctermbg=236		cterm=none		guifg=#808080	guibg=#343434	gui=none			" from wombat256.vim
hi NonText			ctermfg=244		ctermbg=236		cterm=none		guifg=#808080	guibg=#303030	gui=none			" from wombat256.vim
hi MatchParen		ctermfg=7		ctermbg=243		cterm=bold		guifg=#f6f3e8	guibg=#857b6f	gui=bold			" from wombat256.vim
hi Pmenu			ctermfg=7		ctermbg=238						guifg=#f6f3e8	guibg=#444444						" from wombat256.vim
hi PmenuSel			ctermfg=0		ctermbg=192						guifg=#000000	guibg=#cae682						" from wombat256.vim

hi Comment			ctermfg=240						cterm=none		guifg=#606060					gui=none			" from lucius.vim
hi Constant			ctermfg=191						cterm=none		guifg=#c1db65					gui=none
hi String			ctermfg=191						cterm=none		guifg=#c1db65					gui=none
hi Number			ctermfg=191						cterm=none		guifg=#c1db65					gui=none
hi Identifier		ctermfg=192						cterm=none		guifg=#cae682					gui=none			" from wombat256.vim
hi Function			ctermfg=192						cterm=none		guifg=#cae682					gui=none			" from wombat256.vim
hi Statement		ctermfg=111						cterm=none		guifg=#8ac6f2					gui=none			" from wombat256.vim
hi Keyword			ctermfg=111						cterm=none		guifg=#8ac6f2					gui=none			" from wombat256.vim
hi PreProc			ctermfg=207						cterm=none		guifg=#e46de5					gui=none
hi Type				ctermfg=167						cterm=none		guifg=#e5786d					gui=none
hi Special			ctermfg=173						cterm=none		guifg=#db9465					gui=none
hi Underlined		ctermfg=fg						cterm=underline	guifg=fg						gui=underline		" from lucius.vim
hi Ignore			ctermfg=bg										guifg=bg											" from lucius.vim
hi Error			ctermfg=167		ctermbg=236		cterm=none		guifg=#e37170	guibg=#432323	gui=none			" from lucius.vim
hi Todo				ctermfg=245						cterm=none		guifg=#8f8f8f					gui=italic			" from wombat256.vim

hi IncSearch		ctermfg=87						cterm=reverse	guifg=#66ffff					gui=reverse			" from lucius.vim
hi Search							ctermbg=214		cterm=none						guibg=#ffaa33	gui=none			" from lucius.vim
hi PMenuSbar						ctermbg=59		cterm=none						guibg=#505860	gui=none			" from lucius.vim
hi PMenuThumb						ctermbg=102		cterm=none						guibg=#808890	gui=none			" from lucius.vim
hi TabLine			ctermfg=244		ctermbg=236		cterm=none		guifg=#b6bf98	guibg=#363946	gui=none			" from lucius.vim
hi TabLineFill		ctermfg=187		ctermbg=236		cterm=none		guifg=#cfcfaf	guibg=#363946	gui=none			" from lucius.vim
hi TabLineSel		ctermfg=254		ctermbg=236		cterm=bold		guifg=#efefef	guibg=#414658	gui=bold			" from lucius.vim

hi SpellBad							ctermbg=196		cterm=undercurl									gui=undercurl		" from lucius.vim
hi SpellCap							ctermbg=226		cterm=undercurl									gui=undercurl		" from lucius.vim
hi SpellRare						ctermbg=214		cterm=undercurl									gui=undercurl		" from lucius.vim
hi SpellLocal						ctermbg=214		cterm=undercurl									gui=undercurl		" from lucius.vim

hi DiffAdd			ctermfg=fg		ctermbg=22		cterm=none		guifg=#80a090	guibg=#313c36	gui=none			" from lucius.vim
hi DiffChange		ctermfg=fg		ctermbg=52		cterm=none		guifg=NONE		guibg=#4a343a	gui=none			" from lucius.vim
hi DiffDelete		ctermfg=fg		ctermbg=58		cterm=none		guifg=#6c6661	guibg=#3c3631	gui=none			" from lucius.vim
hi DiffText			ctermfg=203		ctermbg=52		cterm=bold		guifg=#f05060	guibg=#4a343a	gui=bold			" from lucius.vim

hi Directory		ctermfg=151						cterm=none		guifg=#c0e0b0					gui=none			" from lucius.vim
hi ErrorMsg			ctermfg=196		ctermbg=NONE	cterm=none		guifg=#ee0000	guibg=NONE		gui=none			" from lucius.vim
hi SignColumn		ctermfg=145		ctermbg=233		cterm=none		guifg=#9fafaf	guibg=#181818	gui=none			" from lucius.vim
hi MoreMsg			ctermfg=29						cterm=none		guifg=#2e8b57					gui=none			" from lucius.vim
hi ModeMsg			ctermfg=117		ctermbg=NONE	cterm=none		guifg=#76d5f8	guibg=NONE		gui=none			" from lucius.vim
hi Question			ctermfg=fg						cterm=none		guifg=fg						gui=none			" from lucius.vim
hi WarningMsg		ctermfg=167						cterm=none		guifg=#e5786d					gui=none			" from lucius.vim
hi WildMenu			ctermfg=16		ctermbg=186		cterm=bold		guifg=#cae682	guibg=#363946	gui=bold,underline	" from lucius.vim
hi ColorColumn		ctermfg=NONE	ctermbg=95		cterm=none		guifg=NONE		guibg=#403630	gui=none			" from lucius.vim


" vim:set ts=4 sw=4 noet:
