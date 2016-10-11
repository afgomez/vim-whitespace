function! s:StripWhitespaces()
    " save last search and cursor position
    let previous_search = @/
    let previous_cursor_line = line('.')
    let previous_cursor_column = col('.')

    " strip trailing whitespace
    %s/\s\+$//e
    
    " Strip empty lines from the end of the file
    :silent! %s/\($\n\)\+\%$//

    " restore previous search history and cursor position
    let @/ = previous_search
    call cursor(previous_cursor_line, previous_cursor_column)
endfunction

" strip whitespace on buffer save
autocmd BufWritePre * :call s:StripWhitespaces()
