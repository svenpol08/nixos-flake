{ inputs, pkgs, pkgs-unstable, ... }:

{
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                viAlias = false;
                vimAlias = true;
                preventJunkFiles = true;
                presence.neocord.enable = true;
                git.enable = true;
                lsp = {
                    enable = true;
                    lspconfig.enable = true;
                    lspkind.enable = true;
                };
                autocomplete = {
                    blink-cmp.enable = true;
                    blink-cmp.friendly-snippets.enable = true;
                };
                options = {
                    wrap = false;
                    tabstop = 4;
                };
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "macchiato";
                };
                languages = {
                    nix = {
                        enable = true;
                        lsp.enable = true;
                        extraDiagnostics.enable = true;
                    };
                    typst = { 
                        enable = true;
                        lsp.enable = true;
                        extensions.typst-preview-nvim.enable = true;
                    };
                };
                utility = {
                    oil-nvim = {
                        enable = true;
                        gitStatus.enable = true;
                        setupOpts = { view_options.show_hidden = true; };
                    };
                };
                keymaps = [
                    { key = "<leader>o"; mode = "n"; action = ":update<CR> :source<CR>";}
                    { key = "<leader>w"; mode = "n"; action = ":write<CR>";}
                    { key = "<leader>q"; mode = "n"; action = ":quit<CR>";}
                    { key = "<leader>y"; mode = "n"; action = "\"+y<CR>";}
                    { key = "<leader>d"; mode = "n"; action = "\"+d<CR>";}
                    { key = "<leader>e"; mode = "n"; action = ":Oil<CR>";}
                ];
            };
        };
    };
}
