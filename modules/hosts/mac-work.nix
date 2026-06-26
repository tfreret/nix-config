{ config, ... }:
let
  inherit (config.flake.modules) darwin;
in
{
  configurations.darwin."MC-C02G32XKQ6LT".module = {
    imports = [
      darwin.base
      ./mac-work-local.nix
    ];

    primaryUser = "tfreret";
    system.stateVersion = 6;
  };
}
