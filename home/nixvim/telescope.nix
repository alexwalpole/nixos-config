

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
      # The raw action calls the require('telescope.builtin').git_files() function
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
};
}
