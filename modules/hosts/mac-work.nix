{ config, ... }:
let
  inherit (config.flake.modules) darwin;
in
{
  configurations.darwin."MC-C02G32XKQ6LT".module = {
    imports = [
      darwin.base
    ];

    primaryUser = "tfreret";
    system.stateVersion = 6;

    profile.email = "todo@todo.com";
  };
}