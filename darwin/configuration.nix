{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    home-manager
    terminal-notifier
    direnv
    pipes
    cmatrix
  ];

  system.primaryUser = "alexwalpole";

  home-manager.backupFileExtension = "backup";
  services.aerospace.enable = false;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
