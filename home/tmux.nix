{ pkgs, config, ... }:
let

  tokyonight-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tokyo-night-tmux";
    rtpFilePath = "tokyo-night.tmux";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "janoamaral";
      repo = "tokyo-night-tmux";
      # rev = "v1.0.0";
      rev = "caf6cbb4c3a32d716dfedc02bc63ec8cf238f632";
      sha256 = "sha256-TOS9+eOEMInAgosB3D9KhahudW2i1ZEH+IXEc0RCpU0=";
    };
  };

  extraConfig = ''
    set -g base-index 1
    set -g mouse on

    set-option -g status-position top
    set -g set-titles on
    set -g set-titles-string "#S:#I.#P #W"
    set -g status-style bg=default,fg=default
    set -g window-status-current-style fg=blue,bg=default,bold
    set -g status-left-length 50
    set -g status-left-style "bg=blue,fg=black"

  '';
  # set -g status-left "#[bg=blue,fg=black] #S #[default]   "
  nightFoxThemeConfig = ''
    # Nightfox colors for Tmux
    # Style: nightfox
    # Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox.tmux
        set -g mode-style "fg=#131a24,bg=#aeafb0"
        set -g message-style "fg=#131a24,bg=#aeafb0"
        set -g message-command-style "fg=#131a24,bg=#aeafb0"
        set -g pane-border-style "fg=#aeafb0"
        set -g pane-active-border-style "fg=#719cd6"
        set -g status "on"
        set -g status-justify "left"
        set -g status-style "fg=#aeafb0,bg=#131a24"
        set -g status-left-length "100"
        set -g status-right-length "100"
        set -g status-left-style NONE
        set -g status-right-style NONE
        set -g status-left "#[fg=#131a24,bg=#719cd6,bold] #S #[fg=#719cd6,bg=#131a24,nobold,nounderscore,noitalics]"
        set -g status-right "#[fg=#131a24,bg=#131a24,nobold,nounderscore,noitalics]#[fg=#719cd6,bg=#131a24] #{prefix_highlight} #[fg=#aeafb0,bg=#131a24,nobold,nounderscore,noitalics]#[fg=#131a24,bg=#aeafb0] %Y-%m-%d  %I:%M %p #[fg=#719cd6,bg=#aeafb0,nobold,nounderscore,noitalics]#[fg=#131a24,bg=#719cd6,bold] #h "
        setw -g window-status-activity-style "underscore,fg=#71839b,bg=#131a24"
        setw -g window-status-separator ""
        setw -g window-status-style "NONE,fg=#71839b,bg=#131a24"
        setw -g window-status-format "#[fg=#131a24,bg=#131a24,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#131a24,bg=#131a24,nobold,nounderscore,noitalics]"
        setw -g window-status-current-format "#[fg=#131a24,bg=#aeafb0,nobold,nounderscore,noitalics]#[fg=#131a24,bg=#aeafb0,bold] #I  #W #F #[fg=#aeafb0,bg=#131a24,nobold,nounderscore,noitalics]"
  '';
  themeToConfig = {
    nightfox = nightFoxThemeConfig;
    catppuccin = "";
    tokyonight = ''
      set -g @tokyo-night-tmux_show_music 0
      set -g @tokyo-night-tmux_show_netspeed 0
    '';
    kanagawa = "";
  };
in
{
  options.tmux = {
    theme = pkgs.lib.mkOption {
      type = pkgs.lib.types.enum (builtins.attrNames themeToConfig);
      default = "nightfox";
      description = "Theme for tmux configuration.";
    };
  };
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
