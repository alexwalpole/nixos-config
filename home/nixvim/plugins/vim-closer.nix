{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "vim-closer";
        src = pkgs.fetchFromGitHub {
          owner = "rstacruz";
          repo = "vim-closer";
          rev = "6007d9db0a35e983af246b667282606612076b07";
          sha256 = "sha256-u7RLg6i1EG4miZzRGnT5yBQf4RuYRekHWqYKmpEi74Q";
        };
      })
    ];
    plugins.vim-closer.enable = true;
  };
}
