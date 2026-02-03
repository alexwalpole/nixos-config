{ config, ... }:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      # This depends on the bat theme being set up...
      # actually i think if i don't define it it just uses the default from the bat config
      # syntax-theme = if config.bat.theme == "gruvbox-material" then "gruvbox-dark" else config.bat.theme;
    };
  };
}
