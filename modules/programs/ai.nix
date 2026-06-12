{
  flake.modules.homeManager.ai =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        opencode
        claude-code
      ];
    };
}
