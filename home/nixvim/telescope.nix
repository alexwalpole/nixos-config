

{
  programs.nixvim = {
  keymaps = [
    # vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
    {
      mode = "n";
      key = "<leader>pf";
      # The raw action calls the require('telescope.builtin').find_files() function
      action.__raw = "function() require('telescope.builtin').find_files() end";
      options.desc = "Telescope find files";
    }


    # vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'git files' })
    {
      mode = "n";
      key = "<C-p>";
      # The raw action calls the require('telescope.builtin').git_files() function
      action.__raw = "function() require('telescope.builtin').git_files() end";
      options.desc = "Telescope git files";
    }


    # vim.keymap.set('n', '<leader>ps', function()
    # 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
    # end)
    {
      mode = "n";
      key = "<leader>ps";
      # This needs the full Lua function since it uses vim.fn.input
      action.__raw = ''
        function() 
          require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) 
        end
      '';
      options.desc = "Telescope Grep string";
    }


    # vim.keymap.set('n', '<leader>fr', builtin.lsp_references)
    {
      mode = "n";
      key = "<leader>fr";
      # The raw action calls the require('telescope.builtin').lsp_references() function
      action.__raw = "function() require('telescope.builtin').lsp_references() end";
      options.desc = "Telescope LSP references";
    }
  ];

  plugins.telescope.enable = true;
};
}
