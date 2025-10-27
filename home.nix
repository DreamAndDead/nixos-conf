{ config, pkgs, ... }:
let
  hyprConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/hypr";
  niriConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/niri";
in
{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";

  catppuccin = {
    enable = true;
  };

  home.packages = with pkgs; [
    nixfmt-rfc-style
    ripgrep
    just
    mc
    bat
    unzip
    sparkle
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    swayimg
    gimp3
    firefox
    nwg-displays
    bilibili
    freetube
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemd.enable = false;
  };

  # todo managed by nix file
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriConfigPath;

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

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    #    enableNushellIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "aquairain@gmail.com";
        name = "David Zhang";
      };
    };
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
    settings = {
      main = {
        term = "xterm-256color";
        shell = "nu";
        font = "FiraCode Nerd Font Mono:size=10";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
          ffmpeg = pkgs.ffmpeg-full;
        };
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };

}
