{
  flake.modules.homeManager.podman =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        podman
        podman-compose
      ];

      programs.zsh.initContent = ''
        docker() {
          if [[ "$1" == "compose" ]]; then
            shift
            podman-compose "$@"
          else
            podman "$@"
          fi
        }
      '';
    };
}
