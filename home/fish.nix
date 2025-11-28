{ pkgs, ...}:
{
  programs.fish = {

    enable = true;


    functions = {
      fish_right_prompt = ''
           set -l node_version (node --version)
           set -l statuscolor (set_color -o $fish_color_keyword)
           set -l node_version "$statuscolor$node_version"
           echo -n -s $node_version 
        '';
    };
      
      



    shellAbbrs = {
      gcm  = "git commit -m";
      gcob = "git checkout -b";
      gco  = "git checkout";
      gst = "git status";
      gstsh = "git stash";

      # Django specific
      mp = "./manage.py";
      mps = "./manage.py shell";

      # uv
      ur = "uv run";

      # unix
      ls = "ls -Foga";
      
      # nvim
      vim = "nvim .";
      vi = "nvim .";

      # nixos
      nrbs = "sudo nixos-rebuild switch";
      ncg = "nix-collect-garbage";
      # TODO: make ./home.nix better
      nhs = "home-manager switch -f ./home.nix -b backup";

      lg = "lazygit";

    };
    shellInit = ''
set -l foreground cdcecf
set -l selection 2b3b51
set -l comment 738091
set -l red c94f6d
set -l orange f4a261
set -l yellow dbc074
set -l green 81b29a
set -l purple 9d79d6
set -l cyan 63cdcf
set -l pink d67ad2

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

set fish_greeting wassssupp
set -gx EDITOR nvim
    '';

  };
}
