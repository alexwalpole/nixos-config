{ config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Alex Walpole";
        email = "alexcwalpole@gmail.com";
      };
      core.editor = "nvim";
    };
    ignores = [ ".DS_Store" ];
  };
}
