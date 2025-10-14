{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";
  home.packages = [ pkgs.nixfmt-rfc-style ];
  programs.git = {
    enable = true;
    userEmail = "aquairain@gmail.com";
    userName = "David Zhang";
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.modus-themes
      epkgs.which-key
    ];
  };
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font Mono:size=10";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
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
