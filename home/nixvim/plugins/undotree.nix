{
  programs.nixvim = {
    keymaps = [
      {

        mode = "n";
        key = "<leader>u";
        #TODO: figure out how to use mkRaw instead
        action.__raw = ''function()
		vim.cmd.UndotreeToggle()
		vim.cmd.UndotreeFocus()
	end'';
      }
    ];

    plugins.undotree.enable = true;
  };
}
