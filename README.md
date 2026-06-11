# nix-config

Personal nix-config to manage nixos, darwin and home manager.
The config follow the [dendritic pattern](https://github.com/mightyiam/dendritic) and is heavily inspired by [AlexNabokikh personal config](https://github.com/AlexNabokikh/nix-config/tree/master/modules).

```
flake.nix
  └─ import-tree ./modules      ← auto-loads every .nix under modules/
       ├─ flake-parts.nix       ← enables the flake.modules registry
       ├─ systems.nix           ← declares supported host architectures
       ├─ nix-settings.nix      ← defines flake.modules.generic.nixSettings
       ├─ base.nix              ← assembles flake.modules.{darwin,nixos,homeManager}.base
       ├─ users.nix             ← defines flake.modules.{darwin,nixos}.users
       ├─ darwin/               ← darwin-specific modules
       ├─ profile/              ← identity & user option definitions
       ├─ programs/             ← home-manager program modules
       ├─ configurations/       ← turns configurations.darwin.* → flake.darwinConfigurations
       └─ hosts/                ← one file per machine, sets configurations.darwin.<name>
```