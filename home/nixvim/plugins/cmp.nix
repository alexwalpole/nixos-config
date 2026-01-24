# Contains config for cmp and luasnip cus they're related
{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        # manually listing cmp-path etc below instead of implicitly including
        # them based on the sources below
        autoEnableSources = false;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }";
            "<C-p>" = "cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }";
            "<C-y>" = ''
              cmp.mapping(
                cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                },
                { "i", "c" }
              )
            '';
            # "<C-Space>" = "cmp.mapping.complete()";
            # "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            # "<C-e>" = "cmp.mapping.close()";
            # "<C-f>" = "cmp.mapping.scroll_docs(4)";
            # "<CR>" = "cmp.mapping.confirm({ select = true })";
            # "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            # "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
          snippet = {
            # LSP has specs for how to send snippets over the wire.
            # this is how we let the LSP send snippets to nvm cmp
            expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true;
      };
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;

      luasnip.enable = true;
      luasnip.settings = {
        update_events = [ 
          "TextChanged"
          "TextChangedI"
        ];
        history = false;
      };
      luasnip.luaConfig.post = ''
        local ls = require "luasnip"

        vim.keymap.set(
          {"i", "s"},
          "<c-k>",
          function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end,
          { silent = true }
        )
        vim.keymap.set(
          {"i", "s"},
          "<c-j>",
          function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end,
          { silent = true }
        )
      '';

      # Prettier icons for completions
      lspkind.enable = true;
    };
  };
}
