{
  flake.modules.homeManager.zed =
    { pkgs, lib, ... }:
    {
      programs.zed-editor = {
        enable = true;

        # false = Nix owns the file (fully reproducible, no in-editor saves)
        # true  = Nix writes the initial file but you can edit it live
        mutableUserSettings = false;
        mutableUserKeymaps = false;

        enableMcpIntegration = true;

        extensions = [
          "nix"
          "toml"
          "dockerfile"
          "helm"
          "sql"
          "csv"
        ];

        userSettings = {
          # vim_mode = true;
          relative_line_numbers = true;

          theme = {
            mode = "system";
            light = "One Light";
            dark = "One Dark";
          };

          buffer_font_family = "JetBrainsMono Nerd Font";
          buffer_font_size = 14;
          ui_font_family = "JetBrainsMono Nerd Font";
          ui_font_size = 14;

          format_on_save = "on";

          tab_size = 2;
          hard_tabs = false;

          show_whitespaces = "selection";
          show_wrap_guides = true;
          wrap_guides = [ 80 120 ];

          autosave = "on_focus_change";

          git = {
            inline_blame.enabled = true;
          };

          terminal = {
            shell = { program = "${pkgs.zsh}/bin/zsh"; };
            env = {
              TERM = "xterm-256color";
            };
          };

          lsp = {
            gopls = {
              initialization_options = {
                hints = {
                  assignVariableTypes = true;
                  compositeLiteralFields = true;
                  constantValues = true;
                  functionTypeParameters = true;
                  parameterNames = true;
                  rangeVariableTypes = true;
                };
              };
            };
          };

          languages = {
            Nix = {
              tab_size = 2;
              formatter = { external = { command = "nixfmt"; }; };
            };
            Go = {
              tab_size = 4;
              hard_tabs = true;
              format_on_save = "on";
            };
            Python = {
              tab_size = 4;
              format_on_save = "on";
            };
          };
        };
      };
    };
}
