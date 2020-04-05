if exists("g:colorscheme_loaded")
    finish
else
    let g:colorscheme_loaded = 1
endif

function! s:setColorSchemeName()
    if exists("g:colorSchemes")
        let s:scheme = s:getColorSchemeName(g:colorSchemes)
        exe "colorscheme " . s:scheme
    endif
endfunction

function! s:getColorSchemeName(colors)
    let time = localtime()

    let total = 0
    for value in values(a:colors)
        let total += value
    endfor

    let m = time % total
    let total = 0
    for [key, value] in items(a:colors)
        echo key . ': ' . value
        let total += value
        if m < total
            return key
        endif
    endfor

    return 'darkblue'
endfunction

call s:setColorSchemeName()

