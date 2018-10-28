"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2017-05-28                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn keyword pythonCustomWord self cls
syn match pythonDatetimeFormatting "%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[aAwdbBmyYHIpMSfzZjUWcxX%]" contained containedin=pythonString,pythonRawString
syn match pythonConstant "\<[A-Z][A-Z0-9_]*\>" display

hi def link pythonCustomWord helpNote
hi def link pythonDatetimeFormatting pythonStrFormatting
hi def link pythonConstant Underlined
hi link pythonNumber Underlined
hi link pythonBinNumber Underlined
hi link pythonBoolean Underlined
hi link pythonBytes Underlined
hi link pythonBytesContent Underlined
hi link pythonFloat Underlined
hi link pythonHexNumber Underlined
hi link pythonOctNumber Underlined
hi link pythonQuotes Underlined
hi link pythonRawBytes Underlined
hi link pythonTripleQuotes Underlined
" hi link pythonRawString Underlined
" hi link pythonString Underlined
