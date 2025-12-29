{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "llama";
        src = pkgs.fetchFromGitHub {
          owner = "ggml-org";
          repo = "llama.vim";
          rev = "master";
          hash = "sha256-/ENW9qWBdXaD/aXc+FhWsEe0bvWEmNl5Uv9szXCDjRs=";
        };
      })
    ];
  };
}
