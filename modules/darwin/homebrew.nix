{
  flake.modules.darwin.homebrew =
    { ... }:
    {
      homebrew = {
        enable = true;

        onActivation = {
          autoUpdate = true;
          # cleanup = "zap";
          # cleanup is intentionally left unset (default: "none") during Homebrew .
          # Homebrew is install in case a package is not availabe on nix pkgs
        };

        taps = [ ];
        brews = [ ];
        casks = [ ];
      };
    };
}
