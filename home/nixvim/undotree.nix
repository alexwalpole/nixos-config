
{
  programs.nixvim = {
    keymaps = [
    {

      mode = "n";
      key = "<leader>u";
      #TODO: figure out how to use mkRaw instead
      action.__raw =  "vim.cmd.UndotreeToggle";
    }
    ];

    plugins.undotree.enable = true;
  };
}
