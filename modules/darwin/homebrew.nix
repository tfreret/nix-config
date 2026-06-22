{
  flake.modules.darwin.homebrew =
    { ... }:
    {
      homebrew = {
        enable = true;

        onActivation = {
          autoUpdate = true;
          # cleanup = "zap";
          # cleanup is intentionally left unset (default: "none") during Homebrew migration.
          # Set to "zap" once all desired casks/brews are declared here.
        };

        taps = [ ];
        brews = [ ];
        casks = [ ];
      };
    };
}
