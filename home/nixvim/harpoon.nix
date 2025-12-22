{
  programs.nixvim = {
    keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require('harpoon'):list():add() end";

      options.desc = "Add to harpoon";

    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
    }
    {
      mode = "n";
      key = "<C-h>";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Harpoon Select File 1";
    }

    # vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    {
      mode = "n";
      key = "<C-t>";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Harpoon Select File 2";
    }

    # vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    {
      mode = "n";
      key = "<C-n>";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Harpoon Select File 3";
    }

    # vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
    {
      mode = "n";
      key = "<C-s>";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Harpoon Select File 4";
    }

    # vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    # Note: <C-S-P> is usually written as <C-P> or <C-p> in Neovim/Vim, but if your terminal supports this exact chord, use it.
    # A common alternative for Ctrl+Shift+P is using the angle brackets as written.
    {
      mode = "n";
      key = "<C-S-P>";
      action.__raw = "function() require('harpoon'):list():prev() end";
      options.desc = "Harpoon Previous File";
    }

    # vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    # A common alternative for Ctrl+Shift+N is using the angle brackets as written.
    {
      mode = "n";
      key = "<C-S-N>";
      action.__raw = "function() require('harpoon'):list():next() end";
      options.desc = "Harpoon Next File";
    }

    ];

    plugins = {

      harpoon = {
        enable = true;
        settings = {
          settings = {
            save_on_toggle = true;
            sync_on_ui_close = false;
          };
        };
      };
    };



  };
}
