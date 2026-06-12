{
  flake.modules.homeManager.sql =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mariadb
        postgresql
        sqlite
      ];
    };
}
