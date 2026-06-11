{ config, ... }:
let
  inherit (config.flake.modules) darwin;
in
{
  configurations.darwin."todo".module = {
    imports = [
      darwin.base
    ];

    primaryUser = "tfreret";
    system.stateVersion = 6;
  };
}
