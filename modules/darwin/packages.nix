{
  flake.modules.darwin.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.betterdisplay
        # pkgs.ice-bar
        # pkgs.stats
        # Mole macos cleanup tool (https://github.com/tw93/Mole) -> no nix-pkgs
      ];
    };
}
