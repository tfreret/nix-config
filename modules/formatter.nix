{
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.writeShellApplication {
        name = "formatter";
        runtimeInputs = [ pkgs.nixfmt ];
        text = ''
          find "''${1:-.}" -name '*.nix' -not -path '*/.git/*' -print0 \
            | xargs -0 nixfmt
        '';
      };
    };
}
