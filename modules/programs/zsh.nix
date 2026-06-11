{
  flake.modules.homeManager.zsh =
    { ... }:
    {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
      };
    };
}
