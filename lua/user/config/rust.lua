
local function RunRustFmt(command, tmpname)
  print("Running rustfmt")
end

local function rustfmt#format()
  call RunRustFmt(rustfmt_cmd, '')
end

-- command! -bar -buffer RustF
