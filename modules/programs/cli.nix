{
  flake.modules.homeManager.cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        git
        tmux
        vim
        fzf
        openssl

        unzip
        zip
        gzip
        rsync
        gnutar

        jq
        yq

        lsof
        htop
        btop
        tree

        curl
        wget
        dig
        mtr
        nmap

        ffmpeg
      ];
    };
}
