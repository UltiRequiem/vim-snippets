if exists("b:done_vimsnippets")
   finish
endif
let b:done_vimsnippets = 1

if !exists("g:snips_author")
    let g:snips_author = "yourname"
endif

if !exists("g:snips_email")
    let g:snips_email = "yourname@email.com"
endif

if !exists("g:snips_github")
    let g:snips_github = "https://github.com/yourname"
endif

if &cp || version >= 704
    finish
endif

if !has("python") && !has("python3")
   finish
end

try
   call UltiSnips#bootstrap#Bootstrap()
catch /E117/
   finish
endtry


if !exists("g:_uspy")
   finish
end

let s:SourcedFile=expand("<sfile>")
exec g:_uspy "import vim, os, sys"
exec g:_uspy "sourced_file = vim.eval('s:SourcedFile')"
exec g:_uspy "while not os.path.exists(os.path.join(sourced_file, 'pythonx')):
   \ sourced_file = os.path.dirname(sourced_file)"
exec g:_uspy "module_path = os.path.join(sourced_file, 'pythonx')"
exec g:_uspy "sys.path.append(module_path)"
