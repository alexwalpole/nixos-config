{ pkgs, config, ... }:
let
  themeArgToGhosttyTheme = {
    tokyonight = "TokyoNight";
    catpuccin-mocha = "Catppuccin Mocha";
    catppuccin = "Catppuccin Mocha";
    nightfox = "nightfox";
    rose-pine = "Rose Pine";
    kanagawa = "Kanagawa Wave";
    dracula = "Dracula";
  };

in
{
  options.ghostty = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum (builtins.attrNames themeArgToGhosttyTheme);
      default = "tokyonight";
      description = "Theme for Ghostty terminal.";
    };
  };
  config = {
    programs.ghostty = {

      enable = true;

      enableFishIntegration = true;
      settings = {
        theme = themeArgToGhosttyTheme.${config.ghostty.theme};
        shell-integration = "fish";
        shell-integration-features = true;
        window-height = 40;
        window-width = 140;
        font-size = 18;
        command = "${config.home.profileDirectory}/bin/fish --login --interactive";
      };
    };
  };
}
