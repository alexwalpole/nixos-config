{ pkgs, ...}:
{
  config = {
    programs.fish = {

      enable = true;


      functions = {
        fish_right_prompt = ''
          set -l node_version (node --version)
          set -l statuscolor (set_color -o $fish_color_end)
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
        # use term colors for fish
        set fish_color_normal normal
        set fish_color_command --bold
        set fish_color_param cyan
        set fish_color_redirection brblue
        set fish_color_comment red
        set fish_color_error brred
        set fish_color_escape bryellow --bold
        set fish_color_operator bryellow
        set fish_color_end brmagenta
        set fish_color_quote yellow
        set fish_color_autosuggestion 555 brblack
        set fish_color_user brgreen

        set fish_greeting wassssupp
        set -gx EDITOR nvim
        direnv hook fish | source
        '';

    };
  };
}
