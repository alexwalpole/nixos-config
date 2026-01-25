{
  lib,
  ...
}:
{
  imports = [
    ./plugins/harpoon.nix
    ./plugins/lsp.nix
    ./plugins/fugitive.nix
    ./plugins/telescope.nix
    ./plugins/undotree.nix
    ./plugins/gitblame.nix
    ./plugins/tiny-inline-diagnostic.nix
    ./plugins/treesitter.nix
    ./plugins/treesitter-context.nix
    ./plugins/llama.nix
    ./plugins/cmp.nix
    ./plugins/lualine.nix
    ./plugins/dap.nix
  ];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      # vim-closer.enable = true;
      vim-surround.enable = true;
      copilot-vim.enable = true;
      debugprint.enable = true;
      # TODO: vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')

      vim-dadbod-ui.enable = true;
    };
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "copilot.vim"
      ];
  };
}
