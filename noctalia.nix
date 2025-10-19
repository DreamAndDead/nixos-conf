{ pkgs, inputs, config, ... }:
let
  noctaliaConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/noctalia";
in
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  imports = [
    inputs.noctalia.nixosModules.default
  ];

  services.noctalia-shell.enable = true;

  home-manager.users.david = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

#    xdg.configFile."noctalia".source = config.lib.file.mkOutOfStoreSymlink noctaliaConfigPath;

  };

}
