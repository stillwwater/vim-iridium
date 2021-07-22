" -------------------------------------------------
" Name:    iridium.vim
" Author:  github.com/stillwwater
" Version: 1.0
" License: The MIT License (MIT)
" --------------------------------------------------

hi clear

let g:colors_name = "iridium"

" options: warm (default), cold
if !exists("g:iridium_variant")
  let g:iridium_variant = "warm"
endif

if !exists("g:iridium_bright_comments")
  let g:iridium_bright_comments = 0
endif

if !exists("g:iridium_solid_vsplit")
  let g:iridium_solid_vsplit = 1
endif

if !exists("g:iridium_classic")
  let g:iridium_classic = 0
endif

if !exists("g:iridium_minimal_cursorline")
  let g:iridium_minimal_cursorline = 0
endif

let s:pure_white    = ["#FFFFFF", "255"]
let s:pure_black    = ["#000000",   "0"]

let s:red           = ["#ED4566",   "1"]
let s:green         = ["#23873F",   "2"]
let s:blue          = ["#95B8E6",   "3"]
let s:yellow        = ["#FF8700",   "4"]
let s:purple        = ["#6E5CE0",   "5"]
let s:cyan          = ["#4FB8CC",   "6"]

let s:pink          = ["#FA5F8F",   "9"]
let s:bright_green  = ["#98BC37",  "10"]
let s:bright_yellow = ["#FED06E",  "11"]
let s:bright_blue   = ["#20BBFC",  "12"]
let s:bright_purple = ["#B3AAEE",  "13"]
let s:bright_cyan   = ["#41D6F2",  "14"]

if g:iridium_variant == "warm"
  let s:black       = ["#1C1B19",  "0"]
  let s:gray1       = ["#262626",  "16"]
  let s:gray2       = ["#303030",  "59"]
  let s:gray3       = ["#3A3A3A",   "8"]
  let s:gray4       = ["#444444",  "59"]
  let s:gray5       = ["#4E4E4E",  "59"]
  let s:gray6       = ["#585858",  "59"]
  let s:gray7       = ["#918175",   "7"]
  let s:gray8       = ["#BAA68F", "243"]
  let s:white       = ["#FCE8C3",  "15"]
elseif g:iridium_variant == "cold"
  let s:black       = ["#122125",  "0"]
  let s:gray1       = ["#162428",  "16"]
  let s:gray2       = ["#172B30",  "59"]
  let s:gray3       = ["#19333B",   "8"]
  let s:gray4       = ["#1D3840",  "59"]
  let s:gray5       = ["#24424A",  "59"]
  let s:gray6       = ["#2C5059",  "59"]
  let s:gray7       = ["#5B7273",   "7"]
  let s:gray8       = ["#5C7F8C", "243"]
  let s:white       = ["#F1ECDE",  "15"]
endif


let s:none          = ["NONE",   "NONE"]

let s:accent   = s:bright_blue
let s:preproc  = s:bright_purple
let s:keyword  = s:bright_purple
let s:type     = s:purple
let s:function = s:blue
let s:special  = s:bright_yellow

if g:iridium_classic == 1
  let s:constant = s:cyan
  let s:string   = s:cyan
else
  let s:constant = s:pink
  let s:string   = s:bright_green
endif

if g:iridium_bright_comments == 1
  let s:comment = s:green
else
  let s:comment = s:gray7
endif

let s:bold      = "bold"
let s:italic    = "italic"
let s:underline = "underline"
let s:undercurl = "undercurl"
let s:inverse   = "inverse"

function! s:h(group, fg, bg, ...)
  execute "highlight" a:group
    \ "guifg=" . a:fg[0]
    \ "guibg=" . a:bg[0]
    \ "ctermfg=" . a:fg[1]
    \ "ctermbg=" . a:bg[1]
    \ "gui=" . (a:0 >= 1 ? a:1 : "NONE")
    \ "cterm=" . (a:0 >= 1 ? a:1 : "NONE")
endfunction

call s:h("Cursor", s:black, s:pink)

call s:h("Normal", s:white, s:black)
hi! link Identifier     Normal
hi! link Delimiter      Normal
hi! link Operator       Normal

call s:h("Constant", s:constant, s:none)
hi! link Character      Constant
hi! link Number         Constant
hi! link Boolean        Constant
hi! link Float          Constant

call s:h("String", s:string, s:none)

call s:h("Type", s:type, s:none)
hi! link StorageClass   Type
hi! link Structure      Type
hi! link Typedef        Type

call s:h("Keyword", s:keyword, s:none)
hi! link Conditional    Keyword
hi! link Repeat         Keyword
hi! link Label          Keyword
hi! link Statement      Keyword
hi! link Exception      Keyword

call s:h("Function", s:function, s:none)

call s:h("PreProc", s:preproc, s:none)
hi! link Include        PreProc
hi! link Define         PreProc
hi! link Macro          PreProc
hi! link PreCondit      PreProc

call s:h("Special", s:special, s:none)
hi! link SpecialChar    Special
hi! link Tag            Special
hi! link SpecialComment Special
hi! link Debug          Special

call s:h("Comment", s:comment, s:none)

if g:iridium_solid_vsplit == 1
  call s:h("VertSplit", s:gray3, s:gray3)
else
  call s:h("VertSplit", s:gray7, s:none)
endif

if g:iridium_minimal_cursorline == 1
  call s:h("CursorLineNR", s:pink,         s:black)
  call s:h("CursorLine",   s:none,         s:black)
else
  call s:h("CursorLineNR", s:pink,         s:gray2)
  call s:h("CursorLine",   s:none,         s:gray2)
endif

call s:h("Underlined",   s:white,        s:none, s:underline)
call s:h("Ignore",       s:black,        s:none)
call s:h("Error",        s:white,        s:red)
call s:h("Todo",         s:white,        s:pink)
call s:h("IncSearch",    s:black,        s:bright_yellow)
call s:h("Search",       s:black,        s:pink)
call s:h("NonText",      s:gray3,        s:none)
call s:h("Visual",       s:none,         s:none, s:inverse)
call s:h("MatchParen",   s:pink,         s:none, s:bold)
call s:h("StatusLine",   s:white,        s:gray3)
call s:h("StatusLineNC", s:gray8,        s:gray3)
call s:h("Directory",    s:bright_blue,  s:none)
call s:h("CursorColumn", s:none,         s:gray2)
call s:h("LineNR",       s:gray4,        s:none)
call s:h("SignColumn",   s:white,        s:none)
call s:h("Folded",       s:accent,       s:gray2)
call s:h("FoldColumn",   s:accent,       s:gray2)
call s:h("Title",        s:pink,         s:none)
call s:h("WarningMsg",   s:bright_yellow,       s:none)
call s:h("ErrorMsg",     s:red,          s:none)
call s:h("MoreMsg",      s:blue,         s:none)
call s:h("ModeMsg",      s:white,        s:none, s:bold)
call s:h("Question",     s:blue,         s:none)
call s:h("DiffAdd",      s:bright_green, s:none)
call s:h("DiffChange",   s:cyan,         s:none)
call s:h("DiffDelete",   s:red,          s:none)
call s:h("DiffText",     s:white,        s:none)
call s:h("WildMenu",     s:gray1,        s:white)
call s:h("TabLine",      s:white,        s:gray3)
call s:h("TabLineFill",  s:white,        s:gray3)
call s:h("TabLineSel",   s:gray1,        s:accent)
call s:h("Pmenu",        s:white,        s:gray3)
call s:h("PmenuSel",     s:gray2,        s:accent)
call s:h("PmenuSBar",    s:white,        s:gray2)
call s:h("PmenuThumb",   s:white,        s:gray4)
call s:h("SpellBad",     s:red,          s:none, s:underline)
call s:h("SpellCap",     s:blue,         s:none, s:underline)
call s:h("SpellRare",    s:bright_yellow,       s:none, s:underline)
call s:h("SpellLocal",   s:bright_green, s:none, s:underline)

if has("terminal")
  call s:h("Terminal",         s:white, s:black)
  call s:h("StatusLineTerm",   s:white, s:gray3)
  call s:h("StatusLineTermNC", s:gray8, s:gray3)

  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0]  = s:pure_black[0]
  let g:terminal_ansi_colors[8]  = s:black[0]

  let g:terminal_ansi_colors[1]  = s:pink[0]
  let g:terminal_ansi_colors[9]  = s:pink[0]

  let g:terminal_ansi_colors[2]  = s:bright_green[0]
  let g:terminal_ansi_colors[10] = s:bright_green[0]

  let g:terminal_ansi_colors[3]  = s:bright_yellow[0]
  let g:terminal_ansi_colors[11] = s:bright_yellow[0]

  let g:terminal_ansi_colors[4]  = s:bright_blue[0]
  let g:terminal_ansi_colors[12] = s:bright_blue[0]

  let g:terminal_ansi_colors[5]  = s:bright_purple[0]
  let g:terminal_ansi_colors[13] = s:bright_purple[0]

  let g:terminal_ansi_colors[6]  = s:cyan[0]
  let g:terminal_ansi_colors[14] = s:cyan[0]

  let g:terminal_ansi_colors[7]  = s:white[0]
  let g:terminal_ansi_colors[15] = s:pure_white[0]
endif

if has("nvim")
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_color_0  = s:pure_black[0]
  let g:terminal_color_8  = s:black[0]

  let g:terminal_color_1  = s:pink[0]
  let g:terminal_color_9  = s:pink[0]

  let g:terminal_color_2  = s:bright_green[0]
  let g:terminal_color_10 = s:bright_green[0]

  let g:terminal_color_3  = s:bright_yellow[0]
  let g:terminal_color_11 = s:bright_yellow[0]

  let g:terminal_color_4  = s:bright_blue[0]
  let g:terminal_color_12 = s:bright_blue[0]

  let g:terminal_color_5  = s:bright_purple[0]
  let g:terminal_color_13 = s:bright_purple[0]

  let g:terminal_color_6  = s:cyan[0]
  let g:terminal_color_14 = s:cyan[0]

  let g:terminal_color_7  = s:white[0]
  let g:terminal_color_15 = s:pure_white[0]
endif

" markdown
call s:h("markdownH1",                s:purple,        s:none, s:underline)
call s:h("markdownH2",                s:bright_purple, s:none, s:bold)
call s:h("markdownH3",                s:bright_yellow, s:none, s:bold)
call s:h("markdownH4",                s:bright_yellow, s:none)
call s:h("markdownH5",                s:bright_yellow, s:none)
call s:h("markdownH6",                s:bright_yellow, s:none)

call s:h("markdownCode",              s:cyan,  s:none)
call s:h("markdownCodeBlock",         s:cyan,  s:none)
call s:h("markdownCodeDelimiter",     s:cyan,  s:none)

call s:h("markdownBlockQuote",        s:gray7, s:none)
call s:h("markdownListMarker",        s:gray7, s:none)
call s:h("markdownOrderedListMarker", s:gray7, s:none)
call s:h("markdownRule",              s:gray7, s:none)
call s:h("markdownHeadingRule",       s:gray7, s:none)

call s:h("markdownLinkText",          s:gray7, s:none)
call s:h("markdownUrl",               s:pink,  s:none, s:underline)

hi! link markdownH1Delimiter markdownH1
hi! link markdownH2Delimiter markdownH2
hi! link markdownH3Delimiter markdownH3
hi! link markdownH4Delimiter markdownH4
hi! link markdownH5Delimiter markdownH5
hi! link markdownH6Delimiter markdownH6


" coc-nvim
hi! link CocErrorSign   ErrorMsg
hi! link CocWarningSign WarningMsg
hi! link CocInfoSign    Question
hi! link CocHintSign    Comment

" ALE
hi! link ALEErrorSign   ErrorMsg
hi! link ALEWarningSign WarningMsg

" git-gutter, Signify
hi! link SignifySignAdd     DiffAdd
hi! link SignifySignDelete  DiffDelete
hi! link SignifySignChange  DiffChange
hi! link GitGutterAdd       DiffAdd
hi! link GitGutterDelete    DiffDelete
hi! link GitGutterChange    DiffChange

" vim: fdm=marker:sw=2:sts=2:et
