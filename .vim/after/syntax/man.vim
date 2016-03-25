syntax match BACKHIDE '.\b' conceal contained
syntax match BOLD '\(.\)\b\1' contains=BACKHIDE
syntax match Underlined '_\b.' contains=BACKHIDE
highlight link BOLD Constant

