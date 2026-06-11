{
  flake.modules.generic.profile =
    { lib, ... }:
    {
      options.profile = lib.mkOption {
        # Disactivate readOnly to allow work config injection
        # readOnly = true;
        type = lib.types.submodule {
          options = {
            fullName = lib.mkOption { type = lib.types.str; };
            email = lib.mkOption { type = lib.types.str; };
            locale = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  timezone = lib.mkOption { type = lib.types.str; };
                  default = lib.mkOption { type = lib.types.str; };
                };
              };
            };
          };
        };
      };

      config.profile = {
        fullName = lib.mkDefault "Tom Freret";
        email = lib.mkDefault "tom.freret@mailo.com";
        locale = {
          timezone = "Europe/Paris";
          default = "en_US.UTF-8";
        };
      };
    };
}
