let g:airline#themes#airblader#palette = {}

" Normal mode
let s:N1 = [ '', '', 232, 3 ]
let s:N2 = [ '', '', 255, 233 ]
let s:N3 = [ '', '', 255, 235 ]
let g:airline#themes#airblader#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Insert mode
let s:I1 = [ '', '', 232, 11 ]
let s:I2 = [ '', '', 255, 233 ]
let s:I3 = [ '', '', 255, 235 ]
let g:airline#themes#airblader#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Replace mode
let s:R1 = [ '', '', 232, 11 ]
let s:R2 = [ '', '', 255, 233 ]
let s:R3 = [ '', '', 255, 235 ]
let g:airline#themes#airblader#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Visual mode
let s:V1 = [ '', '', 232,   1 ]
let s:V2 = [ '', '', 255, 233 ]
let s:V3 = [ '', '', 255, 235 ]
let g:airline#themes#airblader#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Accents
let g:airline#themes#airblader#palette.accents = {
    \ 'red': [ '', '', 1, '' ]
    \ }
