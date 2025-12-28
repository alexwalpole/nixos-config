
{ pkgs, ... }:
{
  programs.bat = {
    enable = true;

    
    themes = {
      tokyonight_night = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "main"; # Or a specific commit hash for stability
          sha256 = "sha256-4zfkv3egdWJ/GCWUehV0MAIXxsrGT82Wd1Qqj1SCGOk=";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };

    config = {
      theme = "tokyonight_night";
    };
  };
}
