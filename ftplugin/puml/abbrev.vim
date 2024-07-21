iabbrev <buffer> xue @startuml<CR>@enduml<ESC>O
iabbrev <buffer> xme @startmindmap<CR>@endmindmap<ESC>O
iabbrev <buffer> rect rectangle
iabbrev <buffer> stor storage

cabbrev <buffer> sm w \| silent make
cabbrev <buffer> tm w \| execute('term ' .. &makeprg)
cabbrev <buffer> gx w \| silent make \| silent !sxiv %:.:r.png &
