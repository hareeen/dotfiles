{lib, ...}: let
  inherit (import ./shell/aliases.nix) aliases abbrs;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initContent = lib.mkOrder 500 ''
      if [[ $- == *i* && -z "$IN_FISH" ]]; then
        export IN_FISH=1
        exec fish
      fi
    '';
  };

  programs.fish = {
    enable = true;
    shellAbbrs = abbrs;
    shellAliases = aliases;
    interactiveShellInit = ''
      set -g fish_color_autosuggestion '555' 'brblack'
      set -g fish_color_cancel -r
      set -g fish_color_command --bold
      set -g fish_color_comment red
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_end brmagenta
      set -g fish_color_error brred
      set -g fish_color_escape 'bryellow'  '--bold'
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_match --background=brblue
      set -g fish_color_normal normal
      set -g fish_color_operator bryellow
      set -g fish_color_param cyan
      set -g fish_color_quote yellow
      set -g fish_color_redirection brblue
      set -g fish_color_search_match 'bryellow' '--background=brblack'
      set -g fish_color_selection 'white' '--bold' '--background=brblack'
      set -g fish_color_user brgreen
      set -g fish_color_valid_path --underline
    '';
    functions.reflect-ghostty = {
      description = "Sync Ghostty terminfo to a remote host";
      body = "command infocmp -x | ssh $argv -- tic -x -";
    };
  };
}
