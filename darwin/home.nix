{ pkgs, lib, ... }:
{
  imports = [
    ../home.nix
  ];
  # ghostty isn't available in nixpkgs for darwin yet :/
  programs.ghostty.package = pkgs.emptyDirectory;

  home.username = lib.mkForce "alexwalpole";
  home.homeDirectory = lib.mkForce "/Users/alexwalpole";

  # programs.aerospace.enable = true;
}
