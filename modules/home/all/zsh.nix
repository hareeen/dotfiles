let
  inherit (import ./shell/aliases.nix) aliases abbrs;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = ''
      autoload -Uz compinit
      if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
      fi
    '';
    initContent = ''
      reflect-ghostty() {
        command infocmp -x | ssh "$@" -- tic -x -
      }
    '';
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = {
        # fish_color_normal -> default
        default = "none";
        # fish_color_command -> command, builtin, function, alias
        command = "bold";
        builtin = "bold";
        function = "bold";
        alias = "bold";
        global-alias = "bold";
        # fish_color_comment -> comment
        comment = "fg=red";
        # fish_color_end -> commandseparator
        commandseparator = "fg=magenta,bold";
        # fish_color_error -> unknown-token
        unknown-token = "fg=red,bold";
        # fish_color_escape -> back-*-quoted-argument
        back-double-quoted-argument = "fg=yellow,bold";
        back-dollar-quoted-argument = "fg=yellow,bold";
        # fish_color_operator -> globbing
        globbing = "fg=yellow,bold";
        # fish_color_param -> options + default
        single-hyphen-option = "fg=cyan";
        double-hyphen-option = "fg=cyan";
        # fish_color_quote -> *-quoted-argument
        single-quoted-argument = "fg=yellow";
        double-quoted-argument = "fg=yellow";
        dollar-quoted-argument = "fg=yellow";
        dollar-double-quoted-argument = "fg=yellow";
        # fish_color_redirection -> redirection
        redirection = "fg=blue,bold";
        # fish_color_valid_path -> path
        path = "underline";
        # fish_color_error (precommand context)
        precommand = "fg=green,underline";
        # reserved words (if, then, else, fi, etc.)
        reserved-word = "fg=yellow";
        # assignments
        assign = "none";
      };
    };
    autocd = true;

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    shellAliases = aliases;

    zsh-abbr = {
      enable = true;
      abbreviations = abbrs;
    };
  };
}
