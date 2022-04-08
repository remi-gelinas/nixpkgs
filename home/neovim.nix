{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  programs = {
    neovim = {
      enable = true;
      package = pkgs.neovim-nightly;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        tree-sitter
        nodePackages.typescript-language-server
        rnix-lsp
      ];

      plugins = with pkgs.vimPlugins; [
        impatient-nvim
        nvim-treesitter
        aniseed
        conjure
        leap-nvim
        neo-tree-nvim
        plenary-nvim
        feline-nvim
        toggleterm-nvim
        nvim-web-devicons
        nui-nvim
        lush-nvim
        nord-nvim
        barbar-nvim
      ];

      extraConfig = ''
        lua require('impatient')
        let g:aniseed#env = { 'module': 'config.init', 'compile': v:true }
      '';
    };
  };
}
