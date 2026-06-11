{
  flake.modules.homeManager.zsh =
    { pkgs, ... }:
    {
      programs.zsh = {
        enable = true;

        oh-my-zsh = {
          enable = true;
          theme = "fishy";
        };

        shellAliases = {
          ll = "ls -lah";
          la = "ls -A";

          ".." = "cd ..";
          "..." = "cd ../..";
        };
      };

      programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };
}
