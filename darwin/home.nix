{
  pkgs,
  lib,
  ...
}:
let
  mac-app-util-src = builtins.fetchTarball "https://github.com/hraban/mac-app-util/archive/master.tar.gz";
  mac-app-util = import mac-app-util-src { };
in
{

  imports = [
    ../home.nix
    mac-app-util.homeManagerModules.default
  ];
  # ghostty isn't available in nixpkgs for darwin yet :/
  programs.ghostty.package = pkgs.ghostty-bin;
  # programs = {
  #   ghostty.installBatSyntax = false;
  #   bat = {
  #     config.map-syntax = [ "${config.xdg.configHome}/ghostty/config:Ghostty Config" ];
  #
  #     syntaxes.ghostty = {
  #       src = "/";
  #       file = "Applications/Ghostty.app/Contents/Resources/bat/syntaxes/ghostty.sublime-syntax";
  #     };
  #   };
  # };
  home.username = lib.mkForce "alexwalpole";
  home.homeDirectory = lib.mkForce "/Users/alexwalpole";

  # programs.aerospace.enable = true;
}
