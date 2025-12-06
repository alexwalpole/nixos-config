{ pkgs, config, ...}:
{
  options.ghostty = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum [ "tokyonight" "Catppuccin Mocha" "nightfox" "Rose Pine" ];
      default = "tokyonight";
      description = "Theme for Ghostty terminal.";
    };
  };
  config = {
    programs.ghostty = {

      enable = true;
      package = pkgs.emptyDirectory;

      enableFishIntegration = true;
      settings = {
        theme = config.ghostty.theme;
        shell-integration = "fish";
        shell-integration-features = true;
        window-height = 40;
        window-width = 140;
        font-size = 24;
# shell

# # theme = Catppuccin Mocha
# # theme = Nightfox
# # theme = Rose Pine
# theme = TokyoNight Night
# # window-decoration = none
#
#
# shell-integration = fish
# shell-integration-features = true
# command = /opt/homebrew/bin/fish --login --interactive
# window-height = 40
# window-width = 140
#
#
# font-size = 24

      };
    };
  };
}
