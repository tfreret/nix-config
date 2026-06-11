{
  flake.modules.nixos.users =
    { config, ... }:
    {
      users.users.${config.primaryUser} = {
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "video"
          "wheel"
        ];
      };
      security.sudo.wheelNeedsPassword = false;
    };

  flake.modules.darwin.users =
    { config, ... }:
    {
      users.users.${config.primaryUser} = {
        name = config.primaryUser;
        home = "/Users/${config.primaryUser}";
      };
      system.primaryUser = config.primaryUser;
    };
}
