{
  flake.modules.homeManager.neovim =
    { pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;
        withPython3 = false;
        withRuby = false;
        # plugins = [];
      };

      # Deploy LazyVim starter config to nvim
      # TODO: Create my own config + theme.
      # TODO: Pin rev to a commit SHA — "main" breaks on flake update when the branch moves.
      #   Run: nix-prefetch-url --unpack https://github.com/LazyVim/starter/archive/<commit>.tar.gz
      #   then update rev and sha256 here.
      xdg.configFile."nvim" = {
        source = pkgs.fetchFromGitHub {
          owner = "LazyVim";
          repo = "starter";
          rev = "main";
          sha256 = "sha256-QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
        };
        recursive = true;
      };
    };
}
