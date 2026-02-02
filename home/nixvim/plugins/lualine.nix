{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        settings.sections = {
          lualine_b = [
            "diff"
            "diagnostics"
          ];
          lualine_c = [
            {
              __unkeyed-1 = "filename";
              path = 1;
            }
          ];
        };
      };
    };
  };
}
