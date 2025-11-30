{
  programs.nixvim = {
    keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action.__raw = "vim.cmd.Git";
    }
    ];

    plugins.fugitive.enable = true;
  };
}
