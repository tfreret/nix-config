{
  flake.modules.darwin.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.betterdisplay
        # ice
        # stats
      ];
    };
}
