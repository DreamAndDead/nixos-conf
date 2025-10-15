nix-test:
    sudo nixos-rebuild test --flake .\#nixos --verbose --show-trace --print-build-logs

nix-switch:
    sudo nixos-rebuild switch --flake .\#nixos
