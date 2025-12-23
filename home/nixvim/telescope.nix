

{
  programs.nixvim = {
  keymaps = [
    {
      mode = "n";
      key = "<leader>pf";
      action.__raw = "function() require('telescope.builtin').find_files() end";
      options.desc = "Telescope find files";
    }
    {
      mode = "n";
      key = "<C-p>";
      action.__raw = "function() require('telescope.builtin').git_files() end";
      options.desc = "Telescope git files";
    }
    {
      mode = "n";
      key = "<leader>ps";
      action.__raw = ''
        function() 
          require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) 
        end
      '';
      options.desc = "Telescope Grep string";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action.__raw = "function() require('telescope.builtin').lsp_references() end";
      options.desc = "Telescope LSP references";
    }
    {
      mode = "n";
      key = "<leader>rg";
      action.__raw = "function() require('telescope').extensions.live_grep_args.live_grep_args() end";
    }
  ];

  plugins.telescope.enable = true;

  plugins.telescope = {
    extensions = {
      ui-select.enable = true;
      live-grep-args.enable = true;
      frecency.enable = true;
    };
    settings.pickers = {
      find_files = {
        fname_width = 60;
      };
      git_files = {
        fname_width = 60;
      };
      lsp_references = {
        fname_width = 60;
      };
    };
  };
 };
}
