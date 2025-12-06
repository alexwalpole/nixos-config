{ config, pkgs, lib, ... }:
let
nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
# If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
# ref = "nixos-25.05";
    });
homeDir = config.home.homeDirectory;
in
{
  imports = [
    # For Home Manager
    nixvim.homeModules.nixvim
    ./nixvim/harpoon.nix
    ./nixvim/lsp.nix
    ./nixvim/fugitive.nix
    ./nixvim/telescope.nix
    ./nixvim/undotree.nix
    ./nixvim/gitblame.nix
    ./nixvim/tiny-inline-diagnostic.nix
    ./nixvim/treesitter.nix
    ./nixvim/treesitter-context.nix
    # For NixOS
    # nixvim.nixosModules.nixvim
    # For nix-darwin
    # nixvim.nixDarwinModules.nixvim
  ];

  options.nixvim = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum [ "tokyonight" "catppuccin" "nightfox" "rose-pine" "kanagawa"];
      default = "tokyonight";
      description = "Theme for Nixvim.";
    };
  };
  config = {
    programs.nixvim.enable = true;


    programs.nixvim = {
      colorschemes.tokyonight.enable = lib.mkIf (config.nixvim.theme == "tokyonight") true;
      colorschemes.catppuccin.enable = lib.mkIf (config.nixvim.theme == "catppuccin") true;
      colorschemes.nightfox.enable = lib.mkIf (config.nixvim.theme == "nightfox") true;
      colorschemes.rose-pine.enable = lib.mkIf (config.nixvim.theme == "rose-pine") true;
      colorschemes.kanagawa.enable = lib.mkIf (config.nixvim.theme == "kanagawa") true;
      
      
      extraConfigLua = ''
        vim.cmd("highlight! link SignColumn Normal")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
        '';
      opts = {
        number = true;
        relativenumber = true;

        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = true;

        smartindent = true;

        wrap = false;

# Backup/Undo settings
        swapfile = false;
        backup = false;
        undodir = "${homeDir}/.vim/undodir";
        undofile = true;

        hlsearch = false;
        incsearch = true;

        termguicolors = true;

        scrolloff = 8;
        signcolumn = "yes";

        isfname.append = [ "@-@" ];

        updatetime = 50;

        colorcolumn = "80";
      };

      globals = {
        netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro";
        mapleader = " ";
      };


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
      {
        mode = "i";
        key = "(<CR>";
        action = "(<CR>)<C-c>O";
      }
      ];

      plugins = {
        lualine.enable = true;
# mini-indentscope.enable = true;
        mini-snippets.enable = true;
        mini-completion.enable = true;
# mini-statusline.enable = true;
        vim-surround.enable = true;
# copilot-vim.enable = true;

      };



    }; 
  };
}
