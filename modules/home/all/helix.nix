{ flake, ... }:
let
  inherit (flake.config) opt;
  # Setting language-servers replaces Helix's default list, so each entry restates the defaults before appending typos.
  withTypos = servers: servers ++ [ "typos" ];
  yaziChooser = "/tmp/helix-yazi-chooser";
  # TUIs launched through :insert-output leave the alternate screen on exit, so these restore Helix's terminal state.
  # The escape goes through the blocking :insert-output rather than :sh, which runs as a background job and would clear the screen after :redraw repaints it.
  restoreTerminal = [
    '':insert-output printf "\x1b[?1049h\x1b[?2004h" > /dev/tty''
    ":redraw"
    ":set mouse false"
    ":set mouse true"
  ];
in
{
  programs.helix = {
    enable = true;
    defaultEditor = !opt.enableVim;
    # Helix ships no Kanso theme; this ports the ink variant of kanso.nvim and leaves ui.background unset so the terminal's translucency shows through.
    themes.kanso_ink = {
      "attribute" = "orange";
      "comment" = {
        fg = "gray4";
        modifiers = [ "italic" ];
      };
      "constant" = "orange";
      "constant.numeric" = "pink";
      "constant.character.escape" = "red3";
      "constructor" = "yellow3";
      "function" = "blue3";
      "keyword" = "violet2";
      "keyword.directive" = "gray3";
      "label" = "violet2";
      "namespace" = "fg";
      "operator" = "gray3";
      "punctuation" = "gray3";
      "punctuation.special" = "yellow3";
      "special" = "yellow3";
      "string" = "green3";
      "string.regexp" = "red3";
      "string.special.symbol" = "violet2";
      "string.special.url" = {
        fg = "yellow3";
        underline.style = "curl";
      };
      "tag" = "violet2";
      "tag.attribute" = "violet2";
      "type" = "aqua";
      "variable" = "fg";
      "variable.builtin" = {
        fg = "violet2";
        modifiers = [ "italic" ];
      };
      "variable.other.member" = "violet2";
      "variable.parameter" = "gray3";

      "markup.heading" = "blue3";
      "markup.bold".modifiers = [ "bold" ];
      "markup.italic".modifiers = [ "italic" ];
      "markup.strikethrough".modifiers = [ "crossed_out" ];
      "markup.link.url" = {
        fg = "yellow3";
        underline.style = "curl";
      };
      "markup.link.text" = "violet2";
      "markup.quote" = "gray3";
      "markup.raw" = "green3";
      "markup.list" = "yellow3";

      "diff.plus" = "gitGreen";
      "diff.minus" = "gitRed";
      "diff.delta" = "gitYellow";

      "error" = "red";
      "warning" = "yellow";
      "info" = "blue2";
      "hint" = "green4";
      "diagnostic.error".underline = {
        color = "red";
        style = "curl";
      };
      "diagnostic.warning".underline = {
        color = "yellow";
        style = "curl";
      };
      "diagnostic.info".underline = {
        color = "blue2";
        style = "curl";
      };
      "diagnostic.hint".underline = {
        color = "green4";
        style = "curl";
      };
      "diagnostic.unnecessary".modifiers = [ "dim" ];
      "diagnostic.deprecated".modifiers = [ "crossed_out" ];

      "ui.text" = "fg";
      "ui.text.focus" = {
        fg = "fg2";
        bg = "inkBg3";
      };
      "ui.cursor" = {
        fg = "inkBg0";
        bg = "fg2";
      };
      "ui.cursor.match" = {
        fg = "yellow";
        modifiers = [ "bold" ];
      };
      "ui.cursorline.primary".bg = "inkBg2";
      "ui.selection".bg = "inkBg3";
      "ui.linenr" = "gray5";
      "ui.linenr.selected" = "fg2";
      "ui.gutter" = { };
      "ui.statusline" = "gray2";
      "ui.statusline.inactive" = "gray5";
      "ui.statusline.normal" = {
        fg = "inkBg0";
        bg = "blue3";
      };
      "ui.statusline.insert" = {
        fg = "inkBg0";
        bg = "green3";
      };
      "ui.statusline.select" = {
        fg = "inkBg0";
        bg = "violet2";
      };
      "ui.bufferline" = "gray5";
      "ui.bufferline.active" = "fg2";
      "ui.bufferline.background" = { };
      "ui.popup" = {
        fg = "gray2";
        bg = "inkBg0";
      };
      "ui.window" = "inkBg2";
      "ui.help" = {
        fg = "gray2";
        bg = "inkBg0";
      };
      "ui.menu" = {
        fg = "fg2";
        bg = "inkBg0";
      };
      "ui.menu.selected".bg = "inkBg3";
      "ui.menu.scroll" = {
        fg = "inkBg3";
        bg = "inkBg0";
      };
      "ui.virtual.whitespace" = "inkBg4";
      "ui.virtual.indent-guide" = "inkBg2";
      "ui.virtual.ruler".bg = "inkBg1";
      "ui.virtual.inlay-hint" = "gray5";
      "ui.virtual.jump-label" = {
        fg = "yellow";
        modifiers = [ "bold" ];
      };
      "ui.highlight".bg = "altBlue2";

      palette = {
        inkBg0 = "#14171d";
        inkBg1 = "#1f1f26";
        inkBg2 = "#22262D";
        inkBg3 = "#393B44";
        inkBg4 = "#4b4e57";
        altBlue2 = "#2D4F67";
        fg = "#C5C9C7";
        fg2 = "#f2f1ef";
        gray2 = "#A4A7A4";
        gray3 = "#909398";
        gray4 = "#75797f";
        gray5 = "#5C6066";
        red = "#C34043";
        red3 = "#c4746e";
        yellow = "#DCA561";
        yellow3 = "#c4b28a";
        green3 = "#8a9a7b";
        green4 = "#6A9589";
        blue2 = "#658594";
        blue3 = "#8ba4b0";
        violet2 = "#8992a7";
        pink = "#a292a3";
        orange = "#b6927b";
        aqua = "#8ea4a2";
        gitGreen = "#76946A";
        gitRed = "#C34043";
        gitYellow = "#DCA561";
      };
    };
    settings = {
      theme = "kanso_ink";
      editor = {
        bufferline = "multiple";
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        indent-guides.render = true;
        inline-diagnostics.cursor-line = "warning";
        lsp.display-inlay-hints = true;
      };
      keys.normal = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-y = [
          ":insert-output rm -f ${yaziChooser}"
          '':insert-output yazi "%{buffer_name}" --chooser-file=${yaziChooser}''
        ]
        ++ restoreTerminal
        # Quitting yazi without a pick leaves no chooser file, so fall back to reopening the current buffer instead of erroring.
        ++ [ '':open %sh{[ -s ${yaziChooser} ] && cat ${yaziChooser} || echo "%{buffer_name}"}'' ];
        # Runs in a scratch buffer so nothing lazygit or the terminal restore prints lands in the file, then reloads to pick up checkouts and discarded changes.
        C-g = [
          ":write-all"
          ":new"
          ":insert-output lazygit"
        ]
        ++ restoreTerminal
        ++ [
          ":buffer-close!"
          ":reload-all"
        ];
      };
    };
    languages = {
      language-server.typos.command = "typos-lsp";
      # Passing --query-driver also turns off the nixpkgs clangd wrapper's header injection, so headers come from the compiler in compile_commands.json (or the host's own toolchain) and match the build.
      language-server.clangd.args = [ "--query-driver=/usr/bin/*,/nix/store/*/bin/*" ];
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
          language-servers = withTypos [ "rust-analyzer" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
            args = [ "-" ];
          };
          language-servers = withTypos [
            "nil"
            "nixd"
          ];
        }
        {
          name = "c";
          auto-format = true;
          language-servers = withTypos [ "clangd" ];
        }
        {
          name = "cpp";
          auto-format = true;
          language-servers = withTypos [ "clangd" ];
        }
        {
          name = "python";
          auto-format = true;
          formatter = {
            command = "ruff";
            args = [
              "format"
              "--line-length"
              "88"
              "-"
            ];
          };
          language-servers = withTypos [
            "ty"
            "ruff"
          ];
        }
        {
          name = "go";
          language-servers = withTypos [
            "gopls"
            "golangci-lint-lsp"
          ];
        }
        {
          name = "markdown";
          language-servers = withTypos [
            "marksman"
            "markdown-oxide"
          ];
        }
      ];
    };
  };
}
