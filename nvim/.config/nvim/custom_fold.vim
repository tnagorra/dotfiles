function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 8
    return line . ' ... ' . foldedlinecount . ' lines' . repeat(' ',fillcharcount)
endfunction " }}}

augroup fold_color
    autocmd!
    autocmd ColorScheme * highlight Folded guibg=NONE gui=italic
    autocmd ColorScheme * highlight Comment gui=italic
augroup END

