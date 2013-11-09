"     __  __            _            _
"    |  \/  | ___  _ __(_) __ _ _ __| |_ _   _
"    | |\/| |/ _ \| '__| |/ _` | '__| __| | | |
"    | |  | | (_) | |  | | (_| | |  | |_| |_| |
"    |_|  |_|\___/|_|  |_|\__,_|_|   \__|\__, |
"                                        |___/
"
"   I've given you a glimpse, Sherlock. Just a tinsy glimspe of what I've got
"   going on out there in the big bad world. I'm a specialist you see, like you.
"
"   This is basically Made of Code + Bad Wolf + Base16.

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "moriarty"

" }}}
" Palette {{{
let s:mc = {}

" Our basic color.
let s:mc.plain = ['f8f8f8', 15]

" MJ at two different points in his life.
let s:mc.white = ['ffffff', 15]
let s:mc.black = ['000000', 16]

" The gravel colors from Bad Wolf.
let s:mc.brightgravel   = ['d9cec3', 252]
let s:mc.lightgravel    = ['998f84', 245]
let s:mc.gravel         = ['857f78', 243]
let s:mc.mediumgravel   = ['666462', 241]
let s:mc.deepgravel     = ['45413b', 238]
let s:mc.deepergravel   = ['35322d', 236]
let s:mc.darkgravel     = ['242321', 235]
let s:mc.blackgravel    = ['1c1b1a', 233]
let s:mc.blackestgravel = ['141413', 232]

" The blues from Made of Code and Badwolf.
let s:mc.bluebox = ['233466', 39]
let s:mc.tardis  = ['0a9dff', 39]

" Made of Code's not quite red.
let s:mc.notquitered = ['ff3854', 196]

" Base 16's notepad-like yellow.
let s:mc.notepad = ['f4bf75', 03]

" A beautiful tan from Tomorrow Night.
let s:mc.dirtyblonde = ['f4cf86', 222]

" Base 16's 15th color.
let s:mc.base0E = ['aa759f', 05]

" This one's from Mustang, not Florida!
let s:mc.orange = ['b95e30', 214]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:mc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:mc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:mc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'plain', 'blackgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('CursorLine',   '',       'darkgravel', 'none')
call s:HL('CursorLineNr', 'tardis', 'darkgravel', 'none')
call s:HL('CursorColumn', '',       'darkgravel')
call s:HL('ColorColumn',  '',        'darkgravel')

call s:HL('TabLine',     'plain', 'blackestgravel', 'none')
call s:HL('TabLineFill', 'plain', 'blackestgravel', 'none')
call s:HL('TabLineSel',  'black', 'tardis',         'none')

call s:HL('MatchParen', 'notquitered', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'black', 'notepad', 'bold')
call s:HL('IncSearch', 'black', 'notepad', 'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'black', 'tardis',     'bold')
call s:HL('StatusLineNC', 'white', 'deepgravel', 'bold')

call s:HL('Directory', 'tardis', '', 'bold')

call s:HL('Title', 'plain')

call s:HL('ErrorMsg',   'notquitered', 'bg', 'bold')
call s:HL('MoreMsg',    'notepad',      '',  'bold')
call s:HL('ModeMsg',    'dirtyblonde',  '',  'bold')
call s:HL('Question',   'dirtyblonde',  '',  'bold')
call s:HL('WarningMsg', 'base0E',       '',  'bold')

call s:HL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumgravel', 'blackgravel')
call s:HL('SignColumn', '',             'blackgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackgravel')

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'tardis', 'bold')
call s:HL('vCursor', 'black', 'tardis', 'bold')
call s:HL('iCursor', 'black', 'tardis', 'none')

" }}}

" }}}
