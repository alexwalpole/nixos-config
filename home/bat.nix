{ pkgs, config, ... }:
{
  options.bat = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum [ "tokyonight" "catppuccin" "nightfox" "rose-pine" "kanagawa"];
      default = "tokyonight";
      description = "Theme for Nixvim.";
    };
  };
  config = {
    programs.bat = {
      enable = true;

      themes = {
        tokyonight = {
          src = pkgs.fetchFromGitHub {
            owner = "folke";
            repo = "tokyonight.nvim";
            rev = "main"; 
            sha256 = "sha256-4zfkv3egdWJ/GCWUehV0MAIXxsrGT82Wd1Qqj1SCGOk=";
          };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };

      config = {
        theme = config.bat.theme;
      };
    };
  };
}
