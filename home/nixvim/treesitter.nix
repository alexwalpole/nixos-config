{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = true;
      sync_install = false;
      highlight = {
        enable = true;
        additonal_vim_regex_highlighting = false;
        ensure_installed = [
          "javascript"
          "typescript"
          "c"
          "lua"
          "vim"
          "vimdoc"
          "query"
          "markdown"
          "markdown_inline"
          "toml"
          "tsx"
          "json"
          "html"
          "css"
          "bash"
          "nix"
        ];
      };
    };
  };
}
