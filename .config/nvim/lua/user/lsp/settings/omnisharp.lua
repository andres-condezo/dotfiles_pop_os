local pid = vim.fn.getpid()
local omnisharp_bin = "~/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
-- local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

return {
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
  omnisharp = {
    -- useModernNet = true,
    monoPath = "/usr/bin/mono"
  }
}
