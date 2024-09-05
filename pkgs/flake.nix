{
  description = "My System Configuration";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-env";
        paths = with pkgs; [
          # shell
          zsh # shell
          tmux # tmux -- terminal multiplexer
          starship # starship -- shell prompt
          zsh-syntax-highlighting # zsh-syntax-highlighting -- syntax highlighting for zsh
          zsh-autosuggestions # zsh-autosuggestions -- suggestions for zsh
          zsh-autopair # zsh-autopair -- brackets, quotes, etc.
          zsh-vi-mode # zsh-vi-mode -- better vi mode
          thefuck # thefuck -- corrects command mistakes

          # rice
          pipes # pipes.sh -- animated pipes terminal screensaver
          cmatrix # cmatrix -- matrix effect

          # languages
          libgcc # gcc -- C/C++ compiler
          llvm_18 # llvm -- compiler framework
          lua # lua -- lua interpreter
          nodejs_22 # nodejs -- javascript
          rustup # rustup -- rust language

          # editing
          neovim # neovim -- editor

          # git
          lazygit # lazygit -- git client
          delta # delta -- diff tool
          gh # gh -- github cli
          git-lfs # git-lfs -- git large file storage

          # finders
          fzf # fzf -- fuzzy finder
          fd # fd -- find files
          ripgrep # ripgrep -- grep replacement

          # files && folders
          yazi # yazi -- file manager
          zoxide # zoxide -- cd replacement
          stow # stow -- symlink manager
          bat # bat -- cat with syntax highlighting
          eza # eza -- ls replacement

          # misc
          sl # sl -- steam locomotive
          yq # yq -- yaml, json, xml processor
          btop # btop++ -- command line task manager
          man # man -- docs

          # web
          firefox # firefox -- web browser
        ];
      };
    };
}

