let
  inherit (import ./shell/aliases.nix) aliases abbrs;
in
{
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
      body = "command infocmp -x xterm-ghostty | ssh $argv -- tic -x -";
    };
    functions.withenv = {
      description = "withenv .env.foo [.env.bar ...] -- cmd";
      body = ''
        set -l vars
        while test (count $argv) -gt 0; and test "$argv[1]" != "--"
          for line in (grep -v '^\s*#' $argv[1] | grep -v '^\s*$')
            set -l kv (string split -m 1 '=' $line)
            set -a vars "$kv[1]="(string trim -c '"\''' $kv[2])
          end
          set -e argv[1]
        end
        set -e argv[1]
        env $vars $argv
      '';
    };
  };
}
