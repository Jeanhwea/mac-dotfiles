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

syn keyword pythonSelf self
syn match pythonDatetimeFormatting "%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[aAwdbBmyYHIpMSfzZjUWcxX%]" contained containedin=pythonString,pythonRawString
syn match pythonConstant "\<[A-Z][A-Z0-9_]*\>" display

highlight default link pythonSelf helpNote
highlight default link pythonDatetimeFormatting pythonStrFormatting
highlight default link pythonConstant Underlined
highlight link pythonNumber Underlined
highlight link pythonBinNumber Underlined
highlight link pythonBoolean Underlined
highlight link pythonBytes Underlined
highlight link pythonBytesContent Underlined
highlight link pythonFloat Underlined
highlight link pythonHexNumber Underlined
highlight link pythonOctNumber Underlined
highlight link pythonQuotes Underlined
highlight link pythonRawBytes Underlined
" highlight link pythonRawString Underlined
" highlight link pythonString Underlined
highlight link pythonTripleQuotes Underlined
