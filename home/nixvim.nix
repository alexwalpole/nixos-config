{ config, pkgs, lib, ... }:
let
nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
# If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
# ref = "nixos-25.05";
    });
homeDir = config.home.homeDirectory;
in
{
  imports = [
# For Home Manager
    nixvim.homeModules.nixvim
    ./nixvim/harpoon.nix
    ./nixvim/lsp.nix
    ./nixvim/fugitive.nix
    ./nixvim/telescope.nix
    ./nixvim/undotree.nix
    ./nixvim/gitblame.nix
    ./nixvim/tiny-inline-diagnostic.nix
# For NixOS
# nixvim.nixosModules.nixvim
# For nix-darwin
# nixvim.nixDarwinModules.nixvim
  ];

  programs.nixvim.enable = true;


  programs.nixvim = {
    colorschemes.tokyonight.enable = true ;
    extraConfigLua = ''
      vim.cmd("highlight! link SignColumn Normal")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
      '';
    opts = {
      number = true;
      relativenumber = true;

# Tab settings
# vim.o.tabstop = 2
      tabstop = 2;
# vim.o.softtabstop = 2
      softtabstop = 2;
# vim.o.shiftwidth = 2
      shiftwidth = 2;
# vim.o.expandtab = true
      expandtab = true;

# vim.opt.smartindent = true
      smartindent = true;

# vim.opt.wrap = false
      wrap = false;

# Backup/Undo settings
# vim.opt.swapfile = false
      swapfile = false;
# vim.opt.backup = false
      backup = false;
# vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
# Note: NixVim handles $HOME expansion naturally here.
      undodir   = "${homeDir}/.vim/undodir";
# vim.opt.undofile = true
      undofile = true;

# Search settings
# vim.opt.hlsearch = false
      hlsearch = false;
# vim.opt.incsearch = true
      incsearch = true;

# vim.opt.termguicolors = true
      termguicolors = true;

# UI/Layout settings
# vim.opt.scrolloff = 8
      scrolloff = 8;
# vim.opt.signcolumn = "yes"
      signcolumn = "yes";

# File/Update settings
# vim.opt.isfname:append("@-@")
# Use the append option for list-like options in NixVim
      isfname.append = [ "@-@" ];

# vim.opt.updatetime = 50
      updatetime = 50;

# vim.opt.colorcolumn = "80"
      colorcolumn = "80";
    };

# These correspond to vim.g settings (global variables)
    globals = {
# vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
      netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro";

      mapleader = " ";

    };


    keymaps = [
# General Mappings
    { # vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
      mode = "n";
      key = "<leader>pv";
      # action = ":Ex<CR>";
      # TODO use mkRaw instead
      action.__raw = "vim.cmd.Ex";
# options.desc = "Open Netrw Explorer";
    }

# Text Movement & Joining
    { # vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move visual block down";
    }
    { # vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move visual block up";
    }
    { # vim.keymap.set("n", "J", "mzJ`z") - keep cursor in place when joining lines
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options.desc = "Join lines, keep cursor position";
    }

# Navigation (Half-page jumps keep cursor in middle)
    { # vim.keymap.set("n", "<C-d>", "<C-d>zz")
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Scroll half-page down (center)";
    }
    { # vim.keymap.set("n", "<C-u>", "<C-u>zz")
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Scroll half-page up (center)";
    }

# Search (Center search terms)
    { # vim.keymap.set("n", "n", "nzzzv")
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Next search match (center)";
    }
    { # vim.keymap.set("n", "N", "Nzzzv")
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Previous search match (center)";
    }

# Clipboard & Deletion (The 'greatest remap ever')
    { # vim.keymap.set("x", "<leader>p", "\"_dP") - paste without clobbering clipboard
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options.desc = "Paste without replacing system clipboard";
    }

# Yank to System Clipboard
    { # vim.keymap.set("n", "<leader>y", "\"+y")
      mode = "n";
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Yank to system clipboard";
    }
    { # vim.keymap.set("v", "<leader>y", "\"+y")
      mode = "v";
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Yank selection to system clipboard";
    }
    { # vim.keymap.set("n", "<leader>Y", "\"+Y")
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
      options.desc = "Yank line to system clipboard";
    }

# Delete without copying to clipboard
    { # vim.keymap.set("n", "<leader>d", "\"_d")
      mode = "n";
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete (black hole register)";
    }
    { # vim.keymap.set("v", "<leader>d", "\"_d")
      mode = "v";
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete selection (black hole register)";
    }

# Disable 'Q' (Ex Mode)
    { # vim.keymap.set("n", "Q", "<nop>")
      mode = "n";
      key = "Q";
      action = "<nop>";
      options.desc = "Do nothing (Disable Ex Mode)";
    }

# External Tool & LSP
    { # vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
      mode = "n";
      key = "<C-f>";
      action = "<cmd>silent !tmux neww tmux-sessionizer<CR>";
      options.desc = "Start Tmux sessionizer";
    }
    { # vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
# NixVim automatically generates keymaps for LSP, but if you need a custom one:
      mode = "n";
      key = "<leader>f";
      action = "<cmd>lua vim.lsp.buf.format()<CR>";
      options.desc = "Format document (LSP)";
    }

# Replace word under cursor
    { # vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
      mode = "n";
      key = "<leader>s";
      action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
      options.desc = "Substitute word under cursor";
    }
    {
      mode = "i";
      key = "(<CR>";
      action = "(<CR>)<C-c>O";
    }
    ];

    plugins = {
      # lualine.enable = true;
      treesitter = {
        enable = true;

        settings = {

          auto_install = true;
          sync_install = false;
          highlight = {
            enable = true;
            additonal_vim_regex_highlighting=false;
            ensure_installed = [ 
              "javascript" 
              "typescript" 
              "c" "lua" "vim" "vimdoc" "query" "markdown" "markdown_inline" "toml" "tsx" "json" "html" "css" "bash"
              "nix"
            ];

          };
        };
      };
      treesitter-context = {
        enable = true;
        settings = {
          enable = true; 
# Enable this plugin (Can be enabled/disabled later via commands)

          multiwindow = false; 
# Enable multiwindow support.
          max_lines = 5; 
# How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0; 
# Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true;
          multiline_threshold = 20; 
# Maximum number of lines to show for a single context
          trim_scope = "outer"; 
# Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          mode = "cursor";  
# Line used to calculate context. Choices: 'cursor', 'topline'

# Separator between context and content. Should be a single character string; like '-'.

# When separator is set; the context will only show up when there are at least 2 lines above cursorline.
          separator = null;
          zindex = 20; 
# The Z-index of the context window
          on_attach = "nil"; 
# (fun(buf: integer): boolean) return false to disable attaching
        };

      };



      mini-snippets.enable = true;
      mini-completion.enable = true;
      mini-statusline.enable = true;
      vim-surround.enable = true;
      # copilot-vim.enable = true;

    };



  };
}
