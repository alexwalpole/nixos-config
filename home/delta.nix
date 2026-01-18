{ config, ... }:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      # This depends on the bat theme being set up...
      syntax-theme = config.bat.theme;
    };
  };
}
