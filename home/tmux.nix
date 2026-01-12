{ config, ... }:
let


  extraConfig = ''
    set -g base-index 1
    set -g mouse on

    set-option -g status-position top
    set -g set-titles on
    set -g set-titles-string "#S:#I.#P #W"
    set -g status-style bg=default,fg=default
    set -g window-status-current-style fg=blue,bg=default,bold
    set -g status-left-length 50
    set -g status-left "[#S]"
    set -g status-left-style "bg=blue,fg=black"
    set -g status-right '#(git -C #{pane_current_path} rev-parse --abbrev-ref HEAD)'
    set -g status-justify centre

    set-option -g escape-time 10
  '';
in
{
  config = {
    programs.tmux = {
      tmuxp.enable = true;
      enable = true;
      shell = "${config.home.profileDirectory}/bin/fish";
      terminal = "tmux-256color";
      extraConfig = extraConfig;
    };
  };
}
