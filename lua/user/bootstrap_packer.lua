local download_packer = function()
  local install_dir = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")
  vim.fn.mkdir(install_dir, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", install_dir .. "packer.nvim")
  )
  print(out)
  print("Downloading packer.nvim ...")
  print("You will need to restart now")
end

return function()
  if not pcall(require, "packer") then
    download_packer()
    return true
  end
  return false
end

