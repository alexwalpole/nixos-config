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
      {
        # I thought this was the default but apparently i have to set it myself
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options.desc = "Go to definition";
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          fish_lsp.enable = true;
          tsgo.enable = true;
          rust_analyzer.enable = true;

          eslint = {
            enable = true;
            extraOptions = {
              on_attach.__raw = ''
                function(client, bufnr)
                  eslint_base_on_attach(client, bufnr)
                  vim.api.nvim_create_autocmd('BufWritePre', {
                      buffer = bufnr,
                      command = 'LspEslintFixAll',
                      })
                end
              '';
            };
          };
          lua_ls.enable = true;
        };
        preConfig = ''
          local eslint_base_on_attach = vim.lsp.config.eslint.on_attach
        '';
      };
    };

  };
}
