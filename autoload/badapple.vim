" badapple
" Version: 0.0.1
" Author: skanehira
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

" read file to create frames
function! s:read_file() abort
    let file = globpath(&rtp, 'resources/badapple.txt', v:false, v:true)[0]
    let frames = []
    let frame = []

    for line in readfile(file)
        if line !~# "SPLIT"
            call add(frame, line)
        else
            call add(frames, frame)
            let frame = []
        endif
    endfor

    return frames
endfunction

" play bad apple
function! badapple#play() abort
    let frames = s:read_file()
    " popup window
    if has("patch-8.1.1561")
        let winid = popup_create("", {
                    \ 'minheight': '29',
                    \ 'minwidth': '100',
                    \  })

        for frame in frames
            call popup_settext(winid, frame)
            redraw
            sleep 30ms
            let key = getchar(0)
            if key ==# 113
                break
            endif
        endfor
        call popup_close(winid)
    else
        new | setlocal buftype=nofile bufhidden=wipe
        for frame in frames
            call setline(1, frame)
            redraw
            sleep 70ms
            let key = getchar(0)
            if key ==# 113
                break
            endif
        endfor
        bw!
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
