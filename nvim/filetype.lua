if not vim.filetype then
   return
end

-- this is quite experimental and DISABLES all filetype.vim detection if I understand correctly
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Custom filetype detection logic with the new Lua filetype plugin
vim.filetype.add {
   extension = {
      dsp = 'faust',
      fst = 'faust',
      vue = 'vue',
      md = 'markdown',
      sh = 'sh',
      zsh = 'sh',
      bash = 'sh',
      fish = 'sh',
      rs = 'rust',
      toml = 'toml',
      json = 'json',
      yaml = 'yaml',
      yml = 'yaml',
      txt = 'text',
      conf = 'conf',
      log = 'log',
      csv = 'csv',
      svg = 'svg',
      png = 'image',
      jpg = 'image',
      jpeg = 'image',
      tf = 'terraform',
      tsx = 'typescriptreact',
      ts = 'typescript',
   },
   filename = {
      ['.eslintrc'] = 'json',
      ['.prettierrc'] = 'json',
      ['.babelrc'] = 'json',
      ['.stylelintrc'] = 'json',
   },
   pattern = {
      ['.env.*'] = 'sh', -- detect .env.foo as sh
      ['.*%.[sS]'] = 'gas', -- set asm files to gas
   },
}

-- fallback to the default filetype detection
vim.filetype.add {
   pattern = {
      ['.*'] = {
         function(path, bufnr)
            local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
            if vim.regex([[^#!.*\\<mine\\>]]):match_str(content) ~= nil then
               return 'mine'
            elseif vim.regex([[\\<drawing\\>]]):match_str(content) ~= nil then
               return 'drawing'
            end
         end,
         { priority = -math.huge },
      },
   },
}
