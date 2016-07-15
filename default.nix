with import <nixpkgs> { };

let
  # TODO: cleanup paths to custom packages
  zshSyntaxHighlighting = callPackage ./nixos-config/etc/custom-packages/zsh-syntax-highlighting.nix {};
  zshGitPrompt = callPackage ./nixos-config/etc/custom-packages/zsh-git-prompt/default.nix {};
  scmpuff = callPackage ./nixos-config/etc/custom-packages/scmpuff.nix {};
  fastarcheyosx = callPackage ./nixos-config/etc/custom-packages/fastarcheyosx.nix {};

  vimrc = callPackage ./nixos-config/etc/vimrc.nix {};
  vimrcConfig = {
    vam.knownPlugins = pkgs.vimPlugins;
    vam.pluginDictionaries = [
      { names = [
        "vim-addon-nix"
        "ctrlp"
        "youcompleteme"
        "vim-airline"
        "vim-airline-themes"
        "surround"
        "Solarized"
        "The_NERD_Commenter"
        #"rust-vim"

        #"psc-ide-vim"
        #"purescript-vim"
        "syntastic"

        "neomake"
        "vimproc"
        #"haskell-vim"
        #"haskellConcealPlus"
        #"ghcmod"
        #"necoGhc"
        #"hoogle"
        #"hlint-refactor"
      ];}
    ];
    customRC = vimrc.config;
  };

  myVim = pkgs.vim_configurable.customize { name = "vim"; inherit vimrcConfig; };
in
stdenv.mkDerivation rec {
  name = "life";
  version = "0.1.0";

  buildInputs = [
    myVim
    arcanist

    git
    fastarcheyosx
    zsh
    scmpuff
    zshGitPrompt
    zshSyntaxHighlighting
    nix-zsh-completions

    mosh
    wget
  ];
}
