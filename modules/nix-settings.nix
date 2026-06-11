{ inputs, ... }:
{
  flake.modules.generic.nixSettings =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      nix = {
        registry = lib.mapAttrs (_: flake: { inherit flake; }) (
          lib.filterAttrs (_: lib.isType "flake") inputs
        );
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "@admin"
            config.primaryUser
          ];
        };
        optimise.automatic = true;
        gc = lib.mkMerge [
          {
            automatic = true;
            options = "--delete-older-than 14d";
          }
          (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
            interval = {
              Weekday = 0;
              Hour = 3;
              Minute = 15;
            };
          })
          (lib.mkIf (!pkgs.stdenv.hostPlatform.isDarwin) {
            dates = "weekly";
          })
        ];
        nixPath = lib.mkIf (!pkgs.stdenv.hostPlatform.isDarwin) [ "/etc/nix/path" ];
      };

      environment.etc = lib.mkIf (!pkgs.stdenv.hostPlatform.isDarwin) (
        lib.mapAttrs' (name: value: {
          name = "nix/path/${name}";
          value.source = value.flake;
        }) config.nix.registry
      );
    };
}
