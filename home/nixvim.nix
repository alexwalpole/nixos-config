{
  config,
  pkgs,
  lib,
  ...
}:
let
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim
      ref = "nixos-25.11";
    }
  );
  homeDir = config.home.homeDirectory;
  # thing = lib.nixvim.plugins.mkNeovimPlugin {
  #   name = "vim-closer";
  #   maintaners = with lib.maintainers; [ rstacruz ];
  #   url = "https://github.com/rstacruz/vim-closer";
  # };
in
{
  imports = [
    # For Home Manager
    nixvim.homeModules.nixvim
    ./nixvim/plugins.nix
    ./nixvim/keymaps.nix
    # For NixOS
    # nixvim.nixosModules.nixvim
    # ./nixvim/vim-closer.nix
    # For nix-darwin
    # nixvim.nixDarwinModules.nixvim
  ];

  options.nixvim = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum [
        "tokyonight"
        "catppuccin"
        "nightfox"
        "rose-pine"
        "kanagawa"
        "dracula"
        "oxocarbon"
        "melange"
      ];
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
      colorschemes.dracula.enable = lib.mkIf (config.nixvim.theme == "dracula") true;
      colorschemes.oxocarbon.enable = lib.mkIf (config.nixvim.theme == "oxocarbon") true;
      colorschemes.melange.enable = lib.mkIf (config.nixvim.theme == "melange") true;

      extraConfigLua = ''
        vim.cmd("highlight! link SignColumn Normal")

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

    };
  };
}
