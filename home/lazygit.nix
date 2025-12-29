{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        pagers = [
          { pager = "delta --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\""; }
        ];
        mainBranches = [
          "master"
          "main"
        ];
      };
      startuppopupversion = 1;
    };
  };
}
