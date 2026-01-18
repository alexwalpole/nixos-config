{ pkgs, lib, config, ... }:
{
  imports = [
    ../home.nix
  ];
  # ghostty isn't available in nixpkgs for darwin yet :/
  programs.ghostty.package = pkgs.emptyDirectory;
  programs = {
    ghostty.installBatSyntax = false;
    bat = {
      config.map-syntax = [ "${config.xdg.configHome}/ghostty/config:Ghostty Config" ];

      syntaxes.ghostty = {
        src = "/";
        file = "Applications/Ghostty.app/Contents/Resources/bat/syntaxes/ghostty.sublime-syntax";
      };
    };
  };
  home.username = lib.mkForce "alexwalpole";
  home.homeDirectory = lib.mkForce "/Users/alexwalpole";

  # programs.aerospace.enable = true;
}
