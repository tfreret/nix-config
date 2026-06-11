{
  flake.modules.homeManager.git =
    { config, ... }:
    {
      programs.git = {
        enable = true;

        settings = {
          user.name = config.home.username;
          user.email = config.profile.email;

          init.defaultBranch = "main";
          pull.rebase = true;
          push.autoSetupRemote = true;
          rebase.autoStash = true;
          color.ui = "auto";

          core = {
            autocrlf = "input";
            editor = "nvim";
          };

          alias = {
            st = "status -sb";
            lg = "log --oneline --graph --decorate --all";
            d = "diff";
            p = "push";
            pl = " pull";
          };
        };
      };
    };
}
