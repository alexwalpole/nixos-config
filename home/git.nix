{ config, ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Alex Walpole";
      email = "alexcwalpole@gmail.com";
    };
    ignores = [ ".DS_Store" ];
  };
}
