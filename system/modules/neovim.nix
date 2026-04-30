{
  programs.neovim.defaultEditor = true;
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;
      preventJunkFiles = true;
      presence.neocord.enable = true;
      git.enable = true;
      binds.whichKey.enable = true;
      statusline.lualine.enable = true;
      treesitter = {
        enable = true;
        context.enable = true;
        indent.enable = false;
        textobjects.enable = true;
      };
      lsp = {
        enable = true;
        lspconfig.enable = true;
        lspkind.enable = true;
      };
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };
      opts = {
        wrap = false;
        tabstop = 2;
        softtabstop = 2;
      };
      languages = {
        enableDAP = true;
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;
        assembly.enable = true;
        nix.enable = true;
        python.enable = true;
        typst = {
          enable = true;
          extensions.typst-preview-nvim.enable = true;
        };
        clang.enable = true;
        css.enable = true;
        html.enable = true;
      };
      utility = {
        oil-nvim = {
          enable = true;
          gitStatus.enable = true;
          setupOpts = {
            skip_confirm_for_simple_edits = true;
            view_options.show_hidden = true;
          };
        };
      };
      keymaps = [
        {
          key = "<leader>o";
          mode = "n";
          action = ":update<CR> :source<CR>";
        }
        {
          key = "<leader>w";
          mode = "n";
          action = ":write<CR>";
        }
        {
          key = "<leader>q";
          mode = "n";
          action = ":quit<CR>";
        }
        {
          key = "<leader>y";
          mode = "n";
          action = "\"+y<CR>";
        }
        {
          key = "<leader>d";
          mode = "n";
          action = "\"+d<CR>";
        }
        {
          key = "<leader>e";
          mode = "n";
          action = ":Oil<CR>";
        }
        {
          key = "<leader>f";
          mode = "n";
          action = ":term<CR>";
        }
      ];
    };
  };
}
