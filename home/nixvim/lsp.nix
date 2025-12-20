
{
  programs.nixvim = {
    keymaps = [
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = ''
        function()
            local cmdId
            cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
              callback = function()
              local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
              vim.api.nvim_feedkeys(key, "c", false)
              vim.api.nvim_feedkeys("0", "n", false)
              -- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
              cmdId = nil
              return true
              end,
              })
            vim.lsp.buf.rename()
            -- if LPS couldn't trigger rename on the symbol, clear the autocmd
            vim.defer_fn(function()
              -- the cmdId is not nil only if the LSP failed to rename
              if cmdId then
              vim.api.nvim_del_autocmd(cmdId)
              end
              end, 500)
            end
            '';
      options.desc = "Rename symbol";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action.__raw = ''function() vim.lsp.buf.code_action({ context = { only = { "source" } } } ) end'';
      options.desc = "Code action source";
    }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
          };
          ts_ls.enable = true;
          eslint.enable = true;
          lua_ls.enable = true;
        };
      };
    };



  };
}
