{
  pkgs,
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
  ];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      # vim-closer.enable = true;
      vim-surround.enable = true;
      copilot-vim.enable = true;
      # TODO: vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')

      dap.enable = true;
      dap.adapters.servers = {
        "pwa-node" = {
          host = "localhost";
          port = "\${port}";
          executable = {
            command = "node";
            args = [
              "${pkgs.vscode-js-debug}/lib/node_modules/js-debug/dist/src/dapDebugServer.js"
              "\${port}"
            ];
          };
        };
      };
      vim-dadbod-ui.enable = true;
    };
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "copilot.vim"
      ];
  };
}
