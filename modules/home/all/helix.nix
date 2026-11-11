{ flake, ... }:
let
  inherit (flake.config) opt;
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
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
        }
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
            args = [ "-" ];
          };
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
          language-servers = [
            "ty"
            "ruff"
          ];
        }
      ];
    };
  };
}
