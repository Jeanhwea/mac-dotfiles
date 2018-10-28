" Vim compiler file

if exists("current_compiler")
  finish
endif
let current_compiler = "mvn"

if exists(":CompilerSet") != 2              " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn

CompilerSet errorformat=%A[ERROR]\ %f:[%l\\,%c]\ %m,%Z%.%#,%-G%.%#

