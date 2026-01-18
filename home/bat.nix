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
            rev = "5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd";
            sha256 = "sha256-4zfkv3egdWJ/GCWUehV0MAIXxsrGT82Wd1Qqj1SCGOk=";
          };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
        kanagawa = {
          src = pkgs.fetchFromGitHub {
            owner = "rebelot";
            repo = "kanagawa.nvim";
            rev = "aef7f5cec0a40dbe7f3304214850c472e2264b10";
            sha256 = "sha256-nHcQWTX4x4ala6+fvh4EWRVcZMNk5jZiZAwWhw03ExE=";
          };
          file = "extras/tmTheme/kanagawa.tmTheme";
        };
        rose-pine = {
          src = pkgs.fetchFromGitHub {
            owner = "rose-pine";
            repo = "tm-theme";
            rev = "417d201beb5f0964faded5448147c252ff12c4ae";
            sha256 = "sha256-aNDOqY81FLFQ6bvsTiYgPyS5lJrqZnFMpvpTCSNyY0Y=";
          };
          file = "dist/rose-pine.tmTheme";
        };
        catppuccin = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
            sha256 = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
        nightfox = {
          src = pkgs.fetchFromGitHub {
            owner = "EdenEast";
            repo = "nightfox.nvim";
            rev = "ba47d4b4c5ec308718641ba7402c143836f35aa9";
            sha256 = "sha256-HoZEwncrUnypWxyB+XR0UQDv+tNu1/NbvimxYGb7qu8";
          };
          file = "extra/nightfox/nightfox.tmTheme";
        };
      };
      config = {
        theme = config.bat.theme;
      };
    };
  };
}
