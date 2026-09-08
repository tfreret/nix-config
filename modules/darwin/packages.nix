{
  flake.modules.darwin.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.ice-bar
      ];
    };
}
