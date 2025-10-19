{ config, pkgs, ... }: let
  hyprConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/hyprland";
  footConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/foot";
in
{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    nixfmt-rfc-style
    ripgrep
    mc
    unzip
    sparkle
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    swayimg
    gimp3
    firefox
    qutebrowser
    nwg-displays
    just
    bilibili
    freetube
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemd.enable = false;
  };
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprConfigPath;

  xdg.portal.config = {
    common = {
      default = [
        "gtk"
      ];
    };
    pantheon = {
      default = [
        "pantheon"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Secret" = [
        "gnome-keyring"
      ];
    };
    x-cinnamon = {
      default = [
        "xapp"
        "gtk"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "aquairain@gmail.com";
    userName = "David Zhang";
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./home/emacs/init.el;
    extraPackages = epkgs: [
      epkgs.which-key
      epkgs.nix-mode
    ];
  };

  programs.foot = {
    enable = true;
    server.enable = true;
  };
  xdg.configFile."foot".source = config.lib.file.mkOutOfStoreSymlink footConfigPath;

  programs.ashell = {
    enable = true;
    settings = {
      modules = {
        left = [
          "Workspaces"
        ];
        center = [
          "WindowTitle"
        ];
        right = [
          "Tray"
          [
            "Clock"
            "Settings"
          ]
        ];
      };
      workspaces = {
        visibility_mode = "MonitorSpecific";
      };
    };
  };
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "Apps";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
      term = "foot";
      key_up = "Ctrl-p";
      key_down = "Ctrl-n";
      key_exit = "Ctrl-g";
    };
    style = ''
      window {
          margin: 0px;
          border: 10px solid #1e1e2e;
          background-color: #cdd6f4;
          border-radius: 20px;
      }

      #input {
          padding: 4px;
          margin: 4px;
          padding-left: 20px;
          border: none;
          color: #cdd6f4;
          font-weight: bold;
          background-color: #1e1e2e;
          /* background: ; */
         	outline: none;
          border-radius: 20px;
          margin: 10px 13px;
          margin-bottom: 2px;
      }
      #input:focus {
          border: 0px solid #1e1e2e;
          margin-bottom: 0px;
      }

      #inner-box {
          margin: 4px;
          border: 20px solid #1e1e2e;
          color: #cdd6f4;
          font-weight: bold;
          background-color: #242446;
          /* background-color: red; */
          border-radius: 20px;
      }

      #outer-box {
          margin: 0px;
          border: 3px solid #6cbdff;
          border-radius: 20px;
          background-color: #1e1e2e;
      }

      #scroll {
          margin-top: 5px;
          border: none;
          border-radius: 15px;
          margin-bottom: 5px;
      }

      #img{
          margin-right: 10px;
      }

      #img:selected {
          background-color: #89b4fa;
          margin-right: 10px;
          border-radius: 10px;
      }

      #text:selected {
          color: #cdd6f4;
          color: black;
          margin: 0px 0px;
          border: none;
          border-radius: 10px;
          background-color: #89b4fa;
      }

      #entry {
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
          background-color: transparent;
      }

      #entry:selected {
          margin: 0px 0px;
          border: none;
          border-radius: 5px;
          background-color: #89b4fa;
      }
    '';
  };
}
