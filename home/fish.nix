{ pkgs, ...}:
{
  programs.fish = {

    enable = true;
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
  };
}
