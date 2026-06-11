{
  flake.modules.homeManager.cloud =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kubectl
        kubectx
        kubernetes-helm
        kustomize

        terraform
        #opentofu

        # awscli
        # azure-cli
        # google-cloud-sdk
      ];

      # zsh auto complete
      # k9s

    };
}
