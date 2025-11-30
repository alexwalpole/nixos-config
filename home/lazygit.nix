{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
          }
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
