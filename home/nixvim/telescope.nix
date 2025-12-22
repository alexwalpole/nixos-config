

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
  ];

  plugins.telescope.enable = true;

  plugins.telescope = {
    extensions = {
      ui_select = {
        enable = true;
      };
    };
    # luaConfig.post = ''
    #   local builtin = require('telescope.builtin')
    #   builtin.lsp_references( { fname_width = 60 } )
    #   builtin.git_files( { fname_width = 60 } )
    #   builtin.find_files( { fname_width = 60 } )
    # '';
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
