if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"

" Tell :make to run dotnet build
setlocal makeprg=dotnet\ build\ --nologo

" Configure errorformat to parse dotnet build output
setlocal errorformat=%f(%l\\,%c):\ %t%*[^:]:\ %m

