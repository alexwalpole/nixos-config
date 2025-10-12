{ pkgs, ...}
# let tmux-super-fingers = 
{ programs.tmux = {

  enable = true;
  shell = "${pkgs.fish}/bin/fix";
  terminal = "tmux-256color";
  # plugins = with pkgs;
  extraConfig = ''

  '';

  };
};
