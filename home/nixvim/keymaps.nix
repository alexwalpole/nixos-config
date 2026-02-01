# Keymaps that aren't related to a specific plugin
let
  disabledArrows =
    builtins.foldl'
      (
        acc: dir:
        map
          (mode: {

            mode = mode;
            key = dir;
            action = "<Nop>";
            options.desc = "Disables arrow key";
          })
          [
            "n"
            "i"
            "v"
            "c"
          ]
        ++ acc
      )
      [ ]
      [
        "<Up>"
        "<Left>"
        "<Down>"
        "<Right>"
        "<S-Up>"
        "<S-Left>"
        "<S-Down>"
        "<S-Right>"
      ];
in
{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>pv";
        # TODO use mkRaw instead
        action.__raw = "vim.cmd.Ex";
        options.desc = "Open Netrw Explorer";
      }

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move visual block down";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Move visual block up";
      }
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options.desc = "Join lines, keep cursor position";
      }

      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Scroll half-page down (center)";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Scroll half-page up (center)";
      }

      # Search (Center search terms)
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options.desc = "Next search match (center)";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options.desc = "Previous search match (center)";
      }

      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
        options.desc = "Paste without replacing clipboard";
      }

      {
        mode = "n";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Yank to system clipboard";
      }
      {
        mode = "v";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Yank selection to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
        options.desc = "Yank line to system clipboard";
      }

      {
        mode = "n";
        key = "<leader>d";
        action = "\"_d";
        options.desc = "Delete (black hole register)";
      }
      {
        mode = "v";
        key = "<leader>d";
        action = "\"_d";
        options.desc = "Delete selection (black hole register)";
      }

      {
        mode = "n";
        key = "Q";
        action = "<nop>";
        options.desc = "Do nothing (Disable Ex Mode)";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format document (LSP)";
      }

      {
        mode = "n";
        key = "<leader>s";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        options.desc = "Substitute word under cursor";
      }
      # {
      #   mode = "i";
      #   key = "(<CR>";
      #   action = "(<CR>)<C-c>O";
      # }
      {
        mode = "n";
        key = "<leader>yf";
        action.__raw = ''
          function()
            local filepath = vim.fn.expand("%:.")
            vim.fn.setreg("+", filepath)
          end
        '';
        options.desc = "yank relative file path to system clipboard";
      }

    ]
    ++ disabledArrows;
  };
}
