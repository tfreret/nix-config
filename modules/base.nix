{ config, ... }:
let
  inherit (config.flake.modules)
    generic
    darwin
    homeManager
    ;
  commonImports = [
    generic.profile
    generic.primaryUser
    generic.primaryUserHome
    generic.nixSettings
  ];
in
{
  flake.modules.nixos.base = {
    imports = commonImports;
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.darwin.base = {
    imports = commonImports ++ [
      darwin.users
      darwin.sudo
      darwin.systemPreferences
    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      generic.profile
      homeManager.cli
      homeManager.git
      homeManager.zsh
      homeManager.go
      homeManager.podman
      homeManager.python
      homeManager.cloud
      homeManager.neovim
      homeManager.ai
      homeManager.javascript
      homeManager.sql
      homeManager.rust
      homeManager.tmux
    ];
  };
}
