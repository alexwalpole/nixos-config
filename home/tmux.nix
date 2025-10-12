{ pkgs, ...}:
# let tmux-super-fingers = 
{
  programs.tmux = {

    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    # plugins = with pkgs;
    extraConfig = "set -g base-index 1";
  };
}
