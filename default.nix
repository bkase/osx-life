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
        "youcompleteme"
        "vim-airline"
        "vim-airline-themes"
        "surround"
        "Solarized"
        "The_NERD_Commenter"
        "fzf-vim"
        "fzfHack"
        "unite-vim"
        "neomru"
        #"rust-vim"

        "vim-elixir"

        "vim-flow"
        "vim-javascript"
        "vim-jsx"
        "emmet-vim"
        #"psc-ide-vim"
        #"purescript-vim"
        "vim-jinja"

        "gitgutter"
        "fugitive"
        "vim-markdown"

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
  archeyProg = if stdenv.isDarwin then fastarcheyosx else screenfetch;
in
stdenv.mkDerivation rec {
  name = "life";
  version = "0.1.0";

  buildInputs = [
    myVim
    arcanist

    ruby
    elixir

    git
    archeyProg
    ag
    zsh
    scmpuff
    zshGitPrompt
    zshSyntaxHighlighting
    nix-zsh-completions
    fasd

    mosh
    wget
  ];
}
