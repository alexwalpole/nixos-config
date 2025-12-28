{ pkgs, config, ... }:
{
  options.bat = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum [
        "tokyonight"
        "catppuccin"
        "nightfox"
        "rose-pine"
        "kanagawa"
      ];
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
        kanagawa = {
          src = pkgs.fetchFromGitHub {
            owner = "rebelot";
            repo = "kanagawa.nvim";
            rev = "master";
            sha256 = "sha256-nHcQWTX4x4ala6+fvh4EWRVcZMNk5jZiZAwWhw03ExE=";
          };
          file = "extras/tmTheme/kanagawa.tmTheme";
        };
        rose-pine = {
          src = pkgs.fetchFromGitHub {
            owner = "rose-pine";
            repo = "tm-theme";
            rev = "master";
            # sha256 = "sha256-nHcQWTX4x4ala6+fvh4EWRVcZMNk5jZiZAwWhw03ExE=";
            sha256 = "sha256-aNDOqY81FLFQ6bvsTiYgPyS5lJrqZnFMpvpTCSNyY0Y=";
          };
          file = "dist/rose-pine.tmTheme";
        };
      };

      config = {
        theme = config.bat.theme;
      };
    };
  };
}
