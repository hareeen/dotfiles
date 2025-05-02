{flake, ...}: let
  inherit (flake) inputs;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # home.sessionVariables = {
  #   EDITOR = "nvim";
  #   VISUAL = "nvim";
  # };

  programs.nixvim = {
    enable = true;

    colorschemes.oxocarbon.enable = true;

    opts = {
      expandtab = true;
      shiftwidth = 4;
      smartindent = true;
      tabstop = 4;
      clipboard = "unnamedplus";
      number = true;
    };

    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Explorer";
      }
      {
        key = "<leader>;";
        action = "<cmd>Alpha<CR>";
        options.desc = "Dashboard";
      }
      {
        key = "<leader>g";
        action = "<cmd>Neogit<CR>";
        options.desc = "Git";
      }
      {
        key = "<leader>w";
        action = "<cmd>w!<CR>";
        options.desc = "Save";
      }
      {
        key = "<leader>q";
        action = "<cmd>confirm q<CR>";
        options.desc = "Quit";
      }
      {
        key = "<leader>/";
        action = "<Plug>(comment_toggle_linewise_current)";
        options.desc = "Comment";
      }
      {
        key = "<A-j>";
        action = ":m .+1<CR>==";
        mode = "n";
      }
      {
        key = "<A-j>";
        action = "<Esc>:m .+1<CR>==gi";
        mode = "i";
      }
      {
        key = "<A-j>";
        action = "<Esc>:m .+1<CR>==gv";
        mode = "v";
      }
      {
        key = "<A-k>";
        action = ":m .-2<CR>==";
        mode = "n";
      }
      {
        key = "<A-k>";
        action = "<Esc>:m .-2<CR>==gi";
        mode = "i";
      }
      {
        key = "<A-k>";
        action = "<Esc>:m .-2<CR>==gv";
        mode = "v";
      }
      {
        key = "<";
        action = "<gv";
        mode = "v";
      }
      {
        key = ">";
        action = ">gv";
        mode = "v";
      }
      {
        key = "jk";
        action = "<Esc>";
      }
    ];

    plugins = {
      alpha = {
        enable = true;
        theme = "theta";
      };

      which-key = {
        enable = true;
        settings = {
          preset = "helix";
          delay = 200;
          win = {
            border = "single";
          };
          layout = {
            width = {
              min = 20;
              max = 50;
            };
          };
        };
      };

      web-devicons.enable = true;
      nvim-tree = {
        enable = true;

        syncRootWithCwd = true;
        respectBufCwd = true;
        updateFocusedFile = {
          enable = true;
          updateRoot = true;
        };
      };
      project-nvim = {
        enable = true;
        enableTelescope = true;
      };
      lir = {
        enable = true;

        settings = {
          show_hidden_files = true;
          devicons = {
            enable = true;
            highlight_dirname = true;
          };
          mappings = {
            "-" = {
              __raw = "require('lir.actions').up";
            };
            "<CR>" = {
              __raw = "require('lir.actions').edit";
            };
            "<ESC>" = {
              __raw = "require('lir.actions').quit";
            };
            "@" = {
              __raw = "require('lir.actions').cd";
            };
          };
          hide_cursor = true;
        };
      };

      neogit.enable = true;
      gitsigns = {
        enable = true;

        settings = {
          current_line_blame = true;
        };
      };

      navic.enable = true;
      lualine.enable = true;
      bufferline = {
        enable = true;
        settings = {
          options.offsets = [
            {
              filetype = "NvimTree";
              text = "Explorer";
              highlight = "PanelHeading";
              padding = 1;
            }
          ];
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<c-\\>]]";
          direction = "float";
        };
      };

      treesitter.enable = true;
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      treesitter-textobjects.enable = true;

      none-ls.enable = true;
      nvim-autopairs.enable = true;
      indent-blankline.enable = true;
      guess-indent.enable = true;
      illuminate.enable = true;
      comment.enable = true;

      dap.enable = true;
      dap-ui.enable = true;

      luasnip.enable = true;
      friendly-snippets.enable = true;
      schemastore.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            options.desc = "File Finder";
            action = "find_files";
          };
          "<leader>fr" = {
            options.desc = "Recent Files";
            action = "oldfiles";
          };
          "<leader>fg" = {
            options.desc = "Find via grep";
            action = "live_grep";
          };
          "<leader>fk" = {
            options.desc = "Keymaps";
            action = "keymaps";
          };
          "<leader>fc" = {
            options.desc = "Commands";
            action = "commands";
          };
          "<leader>fb" = {
            options.desc = "Branches";
            action = "git_branches";
          };
          "<leader>fp" = {
            options.desc = "Projects";
            action = "projects";
          };
        };
        extensions = {
          file-browser.enable = true;
          ui-select.enable = true;
          frecency.enable = true;
          fzf-native.enable = true;
        };
      };

      noice = {
        enable = true;
        settings.presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
        };
      };

      lsp = {
        enable = true;
        inlayHints = true;
        keymaps = {
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gr" = "references";
            "gt" = "type_definition";
            "gI" = "implementation";
            "gs" = "signature_help";
            "K" = "hover";
            "<leader>a" = "code_action";
          };
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
        };
        servers = {
          marksman.enable = true;
          nil_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          jsonls.enable = true;
          yamlls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
      };
    };
  };
}
