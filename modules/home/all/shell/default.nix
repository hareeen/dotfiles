{
  flake,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake.config) opt;

  nerdFontSymbolsPreset = pkgs.fetchurl {
    url = "https://starship.rs/presets/toml/nerd-font-symbols.toml";
    hash = "sha256-uEgo0X18vjxhTAteue5ROnNAmLExsP5y5EkV94tqjOw=";
  };

  preset = fromTOML (builtins.readFile nerdFontSymbolsPreset);
in
{
  programs = {
    fzf = {
      enable = true;
      historyWidget.command = "";
    };

    eza = {
      enable = true;
      icons = "auto";
      git = true;
    };

    zoxide = {
      enable = true;

      enableZshIntegration = !opt.enableFish;
      enableFishIntegration = opt.enableFish;
    };

    starship = {
      enable = true;

      enableZshIntegration = !opt.enableFish;
      enableFishIntegration = opt.enableFish;

      settings = lib.recursiveUpdate preset {
        add_newline = false;

        format = "$hostname$directory$git_branch$git_state$git_status$character";
        right_format = "$python$nix_shell$cmd_duration";

        character = {
          success_symbol = "[λ](#FFC799)";
          error_symbol = "[λ](#FF8080)";
          vimcmd_symbol = "[λ](#99FFE4)";
        };

        hostname = {
          ssh_only = true;
          format = "[$hostname]($style) ";
          style = "green";
        };

        directory = {
          truncation_length = 3;
          truncate_to_repo = true;
          style = "cyan";
        };

        git_branch = {
          format = "[$branch]($style) ";
          style = "bright-black";
        };

        git_state = {
          format = "[$state( $progress_current/$progress_total)]($style) ";
          style = "bright-black";
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
          style = "yellow";
          conflicted = "=";
          untracked = "?";
          modified = "*";
          staged = "+";
          renamed = "»";
          deleted = "✘";
          stashed = "≡";
          ahead = "⇡";
          behind = "⇣";
          diverged = "⇕";
        };

        python = {
          format = ''[(\($virtualenv\) )]($style)'';
          style = "bright-black";
        };

        nix_shell = {
          format = "[$symbol]($style) ";
          style = "blue";
        };

        cmd_duration = {
          min_time = 2000;
          format = "[$duration]($style)";
          style = "bright-black";
        };

        gcloud.disabled = true;
      };
    };
  };
}
