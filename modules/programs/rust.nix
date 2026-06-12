{
  flake.modules.homeManager.rust =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        rustc
        cargo
        rustfmt
        clippy
      ];
    };
}
