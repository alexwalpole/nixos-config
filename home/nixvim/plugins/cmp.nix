# Contains config for cmp and luasnip cus they're related
{ lib, ... }:
{
  programs.nixvim = {
    opts = {
      completeopt = "menu,menuone,noselect";
    };

    plugins = {
      cmp = {
        enable = true;
        luaConfig.pre = ''
          vim.opt.shortmess:append "c"
        '';
        # manually listing cmp-path etc below instead of implicitly including
        # them based on the sources below
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
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
          formatting = {
            fields = [
              "abbr"
              "icon"
              "kind"
              "menu"
            ];
            format = lib.mkForce ''
              require("lspkind").cmp_format({
                 maxwidth = {
                   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                   -- can also be a function to dynamically calculate max width such as
                   -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                   menu = 50, -- leading text (labelDetails)
                   abbr = 50, -- actual suggestion item
                 },
                 -- for some reason i am getting duplicated symbols, so if i set the mode to 'text', then i get a symbol and text..
                 mode = 'text',
                 ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                 show_labelDetails = false, -- show labelDetails in menu. Disabled by default

                 -- The function below will be called before any actual modifications from lspkind
                 -- so that you can provide more controls on popup customization. (See [30](https://github.com/onsails/lspkind-nvim/pull/30))
                 before = function (entry, vim_item)
                   -- ...
                   return vim_item
                 end
               })
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
      friendly-snippets.enable = true;

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
