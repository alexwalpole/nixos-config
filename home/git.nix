{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Alex Walpole";
    userEmail = "alexcwalpole@gmail.com";
    ignores = [ ".DS_Store" ];

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        # This depends on the bat theme being set up...
        # syntax-theme = config.bat.theme;
      };
    };
  };
}
