vim.g.copilot_enabled = true

vim.g.copilot_filetypes = {
  ["*"] = false, -- lua quirk: key needs [] because of the *
  python = true,
  lua = true,
  javascript = true,
  vue = true,
  faust = false,
  supercollider = false,
  glsl = true,
}
